"""
graph.py — the LangGraph text-to-SQL agent.

Flow:
  route -> (out_of_scope) -> refuse -> END
  route -> retrieve_schema -> generate_sql -> validate -> execute
  execute --error, attempts<MAX--> generate_sql   (self-correction loop)
  execute --ok--> END

Exposes build_agent() -> compiled graph, and answer(question) -> dict.
"""
import os, sys, json, re

# make sibling modules importable whether run as a package or loose files
sys.path.insert(0, os.path.dirname(__file__))

from typing import TypedDict, Optional
from langgraph.graph import StateGraph, END

from llm import call_llm
from schema_context import SCHEMA_DOC, OUT_OF_SCOPE_HINTS
from db_readonly import try_execute

# the harness's safety layer lives in ../../harness — reuse it if reachable,
# otherwise fall back to a tiny inline check so the agent still self-protects.
try:
    _hp = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "harness"))
    sys.path.insert(0, _hp)
    from safety import is_safe, enforce_limit
except Exception:
    def is_safe(sql):
        s = (sql or "").strip().lower().lstrip("(")
        first = s.split(None, 1)[0] if s else ""
        return (first in ("select", "with"), "ok" if first in ("select", "with") else "not a read")
    def enforce_limit(sql, cap=1000):
        return sql if re.search(r"\blimit\b", sql, re.I) else sql.rstrip().rstrip(";") + f"\nLIMIT {cap}"

MAX_ATTEMPTS = 3


class S(TypedDict, total=False):
    question: str
    answerable: bool
    schema: str
    sql: Optional[str]
    error: Optional[str]
    attempts: int
    refused: bool
    note: str


# ---------- nodes ----------

def route(state: S) -> S:
    q = state["question"].lower()
    # cheap denylist first (saves an LLM call on obvious out-of-scope metrics)
    if any(h in q for h in OUT_OF_SCOPE_HINTS):
        return {"answerable": False,
                "note": "This needs a metric not in the track-and-trace DB "
                        "(no cost, plan, margin, sentiment, or finance data)."}
    # otherwise ask the model
    sys_p = "You classify DB questions. Reply ONLY JSON: {\"answerable\": bool, \"reason\": str}."
    usr = (f"Schema summary:\n{SCHEMA_DOC}\n\n"
           f"Question: {state['question']}\n"
           "Answerable purely from the tables above? JSON only.")
    try:
        j = json.loads(_json_only(call_llm(sys_p, usr, max_tokens=200)))
        return {"answerable": bool(j.get("answerable")),
                "note": "" if j.get("answerable") else j.get("reason", "out of scope")}
    except Exception:
        return {"answerable": True, "note": ""}  # fail open to a SQL attempt


def refuse(state: S) -> S:
    return {"refused": True, "sql": None,
            "note": state.get("note") or "Not answerable from this schema."}


def retrieve_schema(state: S) -> S:
    # static for now; later: RAG the few relevant tables for THIS question
    # also flag ambiguous questions so the agent states its interpretation
    return {"schema": SCHEMA_DOC,
            "attempts": state.get("attempts", 0),
            "note": _assumption_note(state["question"])}


def generate_sql(state: S) -> S:
    sys_p = ("You write ONE MySQL SELECT for the given schema. "
             "Output ONLY the raw SQL query, no prose, no explanations, no repeating prompt text, no markdown fences. "
             "Read-only. Follow the JOIN/SEMANTIC RULES exactly.")
    usr = f"{state['schema']}\n\nQuestion: {state['question']}\n"
    if state.get("error"):
        usr += (f"\nYour previous SQL attempt failed with error:\n{state['error']}\n"
                f"Fix the SQL query. Output ONLY the corrected SQL query starting with SELECT.")
    sql = _strip_fences(call_llm(sys_p, usr, max_tokens=800))
    return {"sql": sql, "attempts": state.get("attempts", 0) + 1}


def validate(state: S) -> S:
    ok, reason = is_safe(state.get("sql") or "")
    if not ok:
        # treat as an error the loop can try to fix (or give up -> refuse)
        return {"error": f"blocked by safety: {reason}"}
    return {"error": None}


def execute(state: S) -> S:
    if state.get("error"):           # came from validate as unsafe
        return {}
    ok, err = try_execute(enforce_limit(state["sql"]))
    return {"error": None if ok else err}


# ---------- edges ----------

def after_route(state: S) -> str:
    return "retrieve_schema" if state.get("answerable") else "refuse"

def after_execute(state: S) -> str:
    if not state.get("error"):
        return END
    if state.get("attempts", 0) >= MAX_ATTEMPTS:
        return "give_up"
    return "generate_sql"

def give_up(state: S) -> S:
    return {"refused": True,
            "note": f"Could not produce valid SQL after {MAX_ATTEMPTS} tries. "
                    f"Last error: {state.get('error')}"}


# ---------- helpers ----------

def _assumption_note(question: str) -> str:
    """If the question uses a vague superlative with no metric, state the
    interpretation we're using. Returns '' when the question is unambiguous."""
    q = question.lower()
    metrics = ("revenue", "sales", "price", "volume", "points",
               "count", "quantity", "amount", "profit", "units")
    vague = ("best", "worst", "top ", "strongest", "leading",
             "highest performing", "weakest", "poorest")
    if any(v in q for v in vague) and not any(m in q for m in metrics):
        return ("Ambiguous question — assuming 'best/top' is defined as "
                "highest total sales revenue (SUM(Price) where IsReturned = 0).")
    return ""


def _strip_fences(text: str) -> str:
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r"```[a-z]*\n?", "", text, flags=re.IGNORECASE)
    text = re.sub(r"```", "", text)
    matches = list(re.finditer(r"\bSELECT\b", text, flags=re.IGNORECASE))
    if matches:
        text = text[matches[-1].start():]
    if ";" in text:
        text = text.split(";")[0] + ";"
    else:
        lines = []
        for line in text.splitlines():
            l_strip = line.strip().lower()
            if l_strip.startswith(("- ", "* ", "note:", "**", "this ", "here ", "constraint", "question:", "previous")):
                break
            lines.append(line)
        text = "\n".join(lines).strip()
        if text and not text.endswith(";"):
            text += ";"
    return text.strip()

def _json_only(text: str) -> str:
    m = re.search(r"\{.*\}", text, re.S)
    return m.group(0) if m else text


# ---------- build ----------

def build_agent():
    g = StateGraph(S)
    g.add_node("route", route)
    g.add_node("refuse", refuse)
    g.add_node("retrieve_schema", retrieve_schema)
    g.add_node("generate_sql", generate_sql)
    g.add_node("validate", validate)
    g.add_node("execute", execute)
    g.add_node("give_up", give_up)

    g.set_entry_point("route")
    g.add_conditional_edges("route", after_route,
                            {"retrieve_schema": "retrieve_schema", "refuse": "refuse"})
    g.add_edge("refuse", END)
    g.add_edge("retrieve_schema", "generate_sql")
    g.add_edge("generate_sql", "validate")
    g.add_edge("validate", "execute")
    g.add_conditional_edges("execute", after_execute,
                            {END: END, "generate_sql": "generate_sql", "give_up": "give_up"})
    g.add_edge("give_up", END)
    return g.compile()


_AGENT = None

def answer(question: str) -> dict:
    """Entry point the harness calls."""
    global _AGENT
    if _AGENT is None:
        _AGENT = build_agent()
    out = _AGENT.invoke({"question": question, "attempts": 0})
    return {
        "sql": None if out.get("refused") else out.get("sql"),
        "refused": bool(out.get("refused")),
        "note": out.get("note", ""),
    }
