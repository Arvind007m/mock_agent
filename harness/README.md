# Test harness

Runs every golden case through your agent and prints a pass/fail scorecard.
Verified working against the local seeded DB (5/6 passing — the 6th fails on
purpose to show the harness catches wrong logic).

## Files
- `golden_cases.py` — your test set. **This is the file you grow.** One case per behaviour.
- `run_tests.py` — the runner. Prints the scorecard, exits non-zero on any fail (CI-ready).
- `safety.py` — blocks non-SELECT / stacked / DDL queries before they run.
- `db.py` — read-only connection, query timeout, EXPLAIN full-scan check.
- `compare.py` — execution accuracy (same rows out = correct).
- `agents/mock_agent.py` — fake agent so you can run this today.
- `agents/agent_interface.py` — the one function your real agent must expose.

## Run it (against docker-compose DB from the parent folder)
```bash
pip install pymysql
cd harness
python3 run_tests.py            # uses agent_ro (read-only) + reference SQL as root
```
Defaults connect to 127.0.0.1:3306, user `agent_ro`. Override with env vars:
`DB_HOST DB_PORT DB_NAME AGENT_USER AGENT_PW REF_USER REF_PW`, or `DB_SOCKET` for a local socket.

## Plug in the real agent
Point the harness at your agent instead of the mock:
```bash
AGENT_MODULE=agents.my_real_agent python3 run_tests.py
```
Your module just needs `answer(question) -> {"sql":..., "refused":..., "note":...}`.
See `agents/agent_interface.py`.

## What each expectation means
- `match` — agent result must equal your reference SQL result. Add `paraphrases` to test wording robustness.
- `refuse` — agent must decline (out-of-scope questions with no data).
- `blocked` — safety net must reject a dangerous/non-SELECT query.
- `assumption` — agent must state its assumption for an ambiguous question.

## How to grow coverage
1. Go through the 244 questions. For each answerable one, write the reference SQL → add a `match` case.
2. Add 2–3 paraphrases to the ones that matter (robustness is where agents break).
3. Add `out_of_scope` cases for derived metrics (LTV, NPV, ROI) the schema can't answer.
4. Add `adversarial` cases (delete, drop, "give me everything").
5. Re-run on every prompt/model change. Any red = regression.
```
```
