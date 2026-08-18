"""
safety.py — static guardrails on the SQL the agent produces.
Runs BEFORE any query touches the database.
Fixes vs v1:
  - strips string literals so ';' or keywords INSIDE a string don't false-trigger
  - allows REPLACE()/other functions; only blocks the statement forms (e.g. REPLACE INTO)
"""
import re

# statement-form dangers. REPLACE handled specially (function vs statement).
FORBIDDEN = ("insert", "update", "delete", "drop", "alter", "truncate",
             "create", "grant", "revoke", "call", "into outfile", "load_file")


def strip_comments(sql: str) -> str:
    sql = re.sub(r"/\*.*?\*/", " ", sql, flags=re.S)
    sql = re.sub(r"--[^\n]*", " ", sql)
    sql = re.sub(r"#[^\n]*", " ", sql)
    return sql.strip()


def strip_strings(sql: str) -> str:
    # replace '...' and "..." contents with empty quotes so their bytes can't trigger rules
    sql = re.sub(r"'(?:[^'\\]|\\.)*'", "''", sql)
    sql = re.sub(r'"(?:[^"\\]|\\.)*"', '""', sql)
    return sql


def is_safe(sql: str):
    """Return (ok, reason). ok=False -> BLOCK."""
    if not sql or not sql.strip():
        return False, "empty query"
    clean = strip_strings(strip_comments(sql))

    body = clean.rstrip(";")
    if ";" in body:
        return False, "multiple statements not allowed"

    first = body.lower().lstrip("(").split(None, 1)[0] if body else ""
    if first not in ("select", "with"):
        return False, f"not a read query (starts with '{first}')"

    low = " " + body.lower() + " "
    for kw in FORBIDDEN:
        if re.search(r"(?<![a-z_])" + re.escape(kw) + r"(?![a-z_])", low):
            return False, f"forbidden keyword: {kw}"

    # REPLACE: allow the function REPLACE(...), block the statement REPLACE INTO / REPLACE DELAYED
    if re.search(r"(?<![a-z_])replace\s+(into|delayed|low_priority)\b", low):
        return False, "forbidden statement: replace into"
    # SET as a leading statement is already caught by the first-token rule above.

    return True, "ok"


def enforce_limit(sql: str, cap: int = 1000) -> str:
    if re.search(r"\blimit\b", sql, flags=re.I):
        return sql
    return sql.rstrip().rstrip(";") + f"\nLIMIT {cap}"
