#!/usr/bin/env python3
"""
Fill the local Kezzler test DB with small, FAKE sample data.
- Reads structure from information_schema (so it always matches schema.sql).
- Inserts rows in FK dependency order.
- FK columns are filled from parent rows that already exist.
- UNIQUE columns get guaranteed-unique values (no duplicate-key crashes).
- A bad row is skipped, not fatal — the rest of the table still fills.
- NO real Kezzler data is used or needed.

Usage:
  python3 seed.py --host 127.0.0.1 --port 3306 --user root --password root \
                  --db kezzler --rows 20
"""
import argparse, random
import pymysql
from faker import Faker

fake = Faker()

# global monotonic counter -> guarantees uniqueness for UNIQUE columns
_UNIQ = 0
def _next_uniq():
    global _UNIQ
    _UNIQ += 1
    return _UNIQ

def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--host", default="127.0.0.1")
    p.add_argument("--port", type=int, default=3306)
    p.add_argument("--user", default="root")
    p.add_argument("--password", default="root")
    p.add_argument("--db", default="kezzler")
    p.add_argument("--rows", type=int, default=20, help="rows per table")
    return p.parse_args()

def fake_value(col, unique=False):
    """col = dict with type, nullable, is_auto, char_len, num_scale.
       unique=True -> value is made globally unique for that column."""
    t = col["type"]

    if "int" in t and "tinyint(1)" not in t:
        # unique ints just use the counter; others are random
        return _next_uniq() if unique else random.randint(1, 100000)
    if t == "tinyint(1)":
        return random.randint(0, 1)
    if t.startswith("decimal"):
        scale = col["num_scale"] or 2
        return round(random.uniform(0, 100000), scale)
    if t == "date":
        return fake.date_between("-2y", "today")
    if t == "datetime":
        return fake.date_time_between("-2y", "now")
    if t.startswith("varchar"):
        n = col["char_len"] or 20
        if unique:
            # word + counter, trimmed to fit the column
            suffix = str(_next_uniq())
            base = fake.word()[: max(0, n - len(suffix) - 1)]
            return (base + "_" + suffix)[:n]
        base = fake.word() if n < 40 else fake.sentence(nb_words=6)
        return base[:n]
    return None

def main():
    a = parse_args()
    conn = pymysql.connect(host=a.host, port=a.port, user=a.user,
                           password=a.password, database=a.db, autocommit=False)
    cur = conn.cursor(pymysql.cursors.DictCursor)

    # --- load columns ---
    cur.execute("""SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_TYPE,
                          IS_NULLABLE, EXTRA, CHARACTER_MAXIMUM_LENGTH, NUMERIC_SCALE
                   FROM information_schema.columns
                   WHERE table_schema=%s ORDER BY TABLE_NAME, ORDINAL_POSITION""",
                (a.db,))
    tables = {}
    for r in cur.fetchall():
        tables.setdefault(r["TABLE_NAME"], []).append({
            "name": r["COLUMN_NAME"],
            "type": r["COLUMN_TYPE"],
            "nullable": r["IS_NULLABLE"] == "YES",
            "is_auto": "auto_increment" in (r["EXTRA"] or ""),
            "char_len": r["CHARACTER_MAXIMUM_LENGTH"],
            "num_scale": r["NUMERIC_SCALE"],
        })

    # --- single-column UNIQUE constraints (so we generate unique values) ---
    # A single-column unique index has exactly one column and NON_UNIQUE=0.
    cur.execute("""SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
                   FROM information_schema.statistics
                   WHERE table_schema=%s AND NON_UNIQUE=0
                   ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX""", (a.db,))
    idx_cols = {}
    for r in cur.fetchall():
        idx_cols.setdefault((r["TABLE_NAME"], r["INDEX_NAME"]), []).append(r["COLUMN_NAME"])
    unique_single = {}   # table -> set(colname) for SINGLE-column unique keys only
    for (t, _idx), cols in idx_cols.items():
        if len(cols) == 1:
            unique_single.setdefault(t, set()).add(cols[0])

    # --- work out each table's auto-increment PK (used for name matching) ---
    pk_name = {}                       # e.g. "DistributorRecId" -> "Distributor"
    for t, cols in tables.items():
        for c in cols:
            if c["is_auto"]:
                pk_name[c["name"]] = t

    # --- load DECLARED FKs ---
    cur.execute("""SELECT TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
                   FROM information_schema.key_column_usage
                   WHERE table_schema=%s AND REFERENCED_TABLE_NAME IS NOT NULL""",
                (a.db,))
    fks = {}          # table -> {col: (reftable, refcol)}
    deps = {t: set() for t in tables}
    for r in cur.fetchall():
        fks.setdefault(r["TABLE_NAME"], {})[r["COLUMN_NAME"]] = (
            r["REFERENCED_TABLE_NAME"], r["REFERENCED_COLUMN_NAME"])
        if r["REFERENCED_TABLE_NAME"] != r["TABLE_NAME"]:
            deps[r["TABLE_NAME"]].add(r["REFERENCED_TABLE_NAME"])

    # --- infer references BY NAME for columns with no declared FK ---
    def infer_ref(table, colname):
        if colname in pk_name and pk_name[colname] != table:
            return (pk_name[colname], colname)
        for pkn, rt in pk_name.items():
            if len(pkn) > 4 and colname.endswith(pkn) and rt != table:
                return (rt, pkn)
        return None

    for t, cols in tables.items():
        for c in cols:
            if c["is_auto"] or c["name"] in fks.get(t, {}):
                continue
            ref = infer_ref(t, c["name"])
            if ref:
                fks.setdefault(t, {})[c["name"]] = ref
                if ref[0] != t:
                    deps[t].add(ref[0])

    # --- topological sort (parents before children) ---
    order, seen = [], set()
    def visit(t, stack):
        if t in seen: return
        for d in deps.get(t, ()):
            if d in stack:   # cycle -> break it
                continue
            visit(d, stack | {t})
        seen.add(t); order.append(t)
    for t in tables: visit(t, set())

    def table_pk(t):
        for c in tables[t]:
            if c["is_auto"]:
                return c["name"]
        return None

    pk_pool = {}
    cur.execute("SET FOREIGN_KEY_CHECKS=0")
    total = 0
    for t in order:
        cols = tables[t]
        fk_map = fks.get(t, {})
        uniq_cols = unique_single.get(t, set())
        pk = table_pk(t)
        pk_pool[t] = []
        insert_cols = [c for c in cols if not c["is_auto"]]
        col_names = ", ".join(f"`{c['name']}`" for c in insert_cols)
        placeholders = ", ".join(["%s"] * len(insert_cols))
        sql = f"INSERT INTO `{t}` ({col_names}) VALUES ({placeholders})"

        made = 0
        for _ in range(a.rows):
            vals = []
            for c in insert_cols:
                if c["name"] in fk_map:
                    rt, _rc = fk_map[c["name"]]
                    parent = pk_pool.get(rt, [])
                    vals.append(random.choice(parent) if parent else None)
                else:
                    vals.append(fake_value(c, unique=c["name"] in uniq_cols))
            try:
                cur.execute(sql, vals)
                if pk:
                    pk_pool[t].append(cur.lastrowid)
                made += 1
                total += 1
            except Exception as e:
                # skip this row only; keep filling the table
                print(f"  skip row in {t}: {e}")
                continue
        print(f"{t:32} +{made} rows")
    cur.execute("SET FOREIGN_KEY_CHECKS=1")
    conn.commit()
    print(f"\nDone. ~{total} fake rows inserted across {len(order)} tables.")

if __name__ == "__main__":
    main()
