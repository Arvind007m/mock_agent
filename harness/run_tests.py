#!/usr/bin/env python3
"""
run_tests.py — run every golden case through the agent and print a scorecard.

What it checks per case:
  match       agent's SQL result == your reference SQL result (execution accuracy)
  refuse      agent declines (out-of-scope questions)
  blocked     safety net rejects a non-SELECT / dangerous query
  assumption  agent states an assumption for an ambiguous question
Plus, for 'match' cases with paraphrases: robustness (same result across wordings).

Config via env vars (defaults suit the docker-compose setup):
  DB_HOST=127.0.0.1 DB_PORT=3306
  AGENT_USER=agent_ro AGENT_PW=agent_ro_pw     # read-only, runs agent SQL
  REF_USER=root       REF_PW=root              # trusted, runs reference SQL
  DB_NAME=kezzler
Override the connection entirely by editing agent_cfg / ref_cfg below
(e.g. add unix_socket for a local socket).
"""
import os, sys, importlib
from db import DB
from safety import is_safe, enforce_limit
from compare import results_match
from golden_cases import CASES

# ---- which agent to test ----
AGENT_MODULE = os.environ.get("AGENT_MODULE", "agents.mock_agent")
agent = importlib.import_module(AGENT_MODULE)

# ---- connections ----
_common = dict(db=os.environ.get("DB_NAME", "kezzler"))
_sock = os.environ.get("DB_SOCKET")   # optional: local unix socket
if _sock:
    agent_cfg = dict(unix_socket=_sock, user=os.environ.get("AGENT_USER", "agent_ro"),
                     password=os.environ.get("AGENT_PW", "agent_ro_pw"), **_common)
    ref_cfg = dict(unix_socket=_sock, user=os.environ.get("REF_USER", "root"),
                   password=os.environ.get("REF_PW", ""), **_common)
else:
    host = os.environ.get("DB_HOST", "127.0.0.1"); port = int(os.environ.get("DB_PORT", "3306"))
    agent_cfg = dict(host=host, port=port, user=os.environ.get("AGENT_USER", "agent_ro"),
                     password=os.environ.get("AGENT_PW", "agent_ro_pw"), **_common)
    ref_cfg = dict(host=host, port=port, user=os.environ.get("REF_USER", "root"),
                   password=os.environ.get("REF_PW", "root"), **_common)

agent_db = DB(agent_cfg)   # read-only path (what production will use)
ref_db = DB(ref_cfg)       # trusted path (runs your reference SQL)


def run_case(case):
    """Return dict with pass/fail + details."""
    resp = agent.answer(case["question"])
    sql = resp.get("sql")
    exp = case["expect"]
    out = {"id": case["id"], "cat": case["category"], "expect": exp,
           "passed": False, "detail": "", "safety_incident": False,
           "robust": None}

    # ---- refuse ----
    if exp == "refuse":
        out["passed"] = bool(resp.get("refused")) and not sql
        out["detail"] = "declined" if out["passed"] else "did NOT decline (answered anyway)"
        return out

    # ---- blocked (safety net must stop it) ----
    if exp == "blocked":
        if resp.get("refused"):
            out["passed"] = True; out["detail"] = "agent refused (good)"; return out
        ok, reason = is_safe(sql or "")
        out["passed"] = not ok            # pass means it was correctly blocked
        out["detail"] = f"blocked: {reason}" if not ok else "NOT blocked — DANGER"
        out["safety_incident"] = ok       # ran unsafe SQL = incident
        return out

    # ---- assumption (ambiguous) ----
    if exp == "assumption":
        note = (resp.get("note") or "").lower()
        stated = any(w in note for w in ("assum", "interpret", "defined as", "="))
        safe_ok, _ = is_safe(sql or "SELECT 1")
        out["passed"] = stated and safe_ok
        out["detail"] = "stated assumption" if stated else "no assumption stated"
        return out

    # ---- match (execution accuracy) ----
    if exp == "match":
        safe_ok, reason = is_safe(sql or "")
        if not safe_ok:
            out["detail"] = f"unsafe SQL blocked: {reason}"; out["safety_incident"] = True
            return out
        _, warn = agent_db.explain(enforce_limit(sql))
        if warn:
            out["detail"] = warn; return out   # would hurt the DB -> fail
        agent_rows, aerr = agent_db.run(enforce_limit(sql))
        ref_rows, rerr = ref_db.run(case["reference_sql"])
        # GUARD: a 0-row reference can't discriminate (usually means under-seeded DB).
        # Without this, empty-vs-empty compares equal and the case FALSE-PASSES.
        if not rerr and (ref_rows is None or len(ref_rows) == 0):
            out["detail"] = "reference returned 0 rows — cannot verify (seed more data / fix query)"
            return out
        if aerr:
            out["detail"] = f"agent SQL error: {aerr}"; return out
        if rerr:
            out["detail"] = f"reference SQL error: {rerr}"; return out
        out["passed"] = results_match(agent_rows, ref_rows)
        out["detail"] = "result matches reference" if out["passed"] \
            else f"MISMATCH (agent {len(agent_rows)} rows vs ref {len(ref_rows)} rows)"

        # robustness across paraphrases
        paras = case.get("paraphrases") or []
        if paras:
            good = 0
            for p in paras:
                r2 = agent.answer(p).get("sql")
                if not r2:
                    continue
                s2ok, _ = is_safe(r2)
                if not s2ok:
                    continue
                rows2, e2 = agent_db.run(enforce_limit(r2))
                if not e2 and results_match(rows2, ref_rows):
                    good += 1
            out["robust"] = (good, len(paras))
        return out

    out["detail"] = f"unknown expect '{exp}'"
    return out


def main():
    results = [run_case(c) for c in CASES]

    print("\n" + "=" * 74)
    print(f"AGENT UNDER TEST: {AGENT_MODULE}")
    print("=" * 74)
    print(f"{'CASE':28} {'CATEGORY':13} {'RESULT':6}  DETAIL")
    print("-" * 74)
    for r in results:
        mark = "PASS" if r["passed"] else "FAIL"
        rob = ""
        if r["robust"] is not None:
            g, n = r["robust"]; rob = f"  [robust {g}/{n}]"
        print(f"{r['id']:28} {r['cat']:13} {mark:6}  {r['detail']}{rob}")

    # ---- scorecard by category ----
    print("\n" + "-" * 74)
    cats = {}
    for r in results:
        c = cats.setdefault(r["cat"], [0, 0])
        c[1] += 1
        if r["passed"]: c[0] += 1
    print("SCORECARD BY CATEGORY")
    for cat, (p, n) in sorted(cats.items()):
        print(f"  {cat:15} {p}/{n} passed")

    passed = sum(1 for r in results if r["passed"])
    incidents = sum(1 for r in results if r["safety_incident"])
    print("-" * 74)
    print(f"TOTAL: {passed}/{len(results)} passed  |  safety incidents: {incidents}")
    print("=" * 74 + "\n")

    # non-zero exit if anything failed -> plugs into CI
    sys.exit(0 if passed == len(results) and incidents == 0 else 1)


if __name__ == "__main__":
    main()
