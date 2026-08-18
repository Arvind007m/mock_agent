# Kezzler AI Agent — Safe Test Environment

Test the text-to-SQL agent on small, safe copies of the database **before** it ever
touches Kezzler's real 4.2 GB production data. If the agent writes a bad query on the
real DB it could slow it down or break something — so you prove it on throwaway copies first.

This package gives you:
- the full 51-table schema (structure only, no real data),
- a seeder that fills it with small **fake** data,
- a read-only + timeout + limit safety layer,
- an automated test harness that scores the agent by category and catches wrong logic.

Everything here has been run and verified end-to-end.

---

## TL;DR — run the whole thing

```bash
cd kezzler-test
./quickstart.sh
```
That installs deps, starts MySQL in Docker, seeds fake data, and runs the test suite
against the built-in mock agent. To test the real agent:
```bash
AGENT_MODULE=agents.my_real_agent ./quickstart.sh
```

---

## Why this exists (the 3-phase plan)

| Phase | Where | Cost | Goal |
|---|---|---|---|
| **1** | Local MySQL in Docker + fake data | Free | Debug the agent's SQL. **You are here.** |
| **2** | Small RDS (db.t3.micro) + your MCP server | Free tier / a few $ | Test the real path: agent → MCP → RDS |
| **3** | Kezzler's real DB, **read replica only** | Their cost | Validate on real data, safely |

The same schema, seeder, safety layer, and harness are reused in all three phases —
only the database connection changes.

---

## What's in this folder

```
kezzler-test/
├── README.md                 <- you are here
├── quickstart.sh             <- one command: up + seed + test
├── Makefile                  <- make up / seed / test / down / reset
├── requirements.txt          <- pymysql, Faker
├── docker-compose.yml        <- local MySQL 8, auto-loads the two SQL files below
├── schema.sql                <- 51 tables, 144 FKs (structure only, NO real data)
├── 02_readonly_user.sql      <- creates agent_ro (SELECT-only) — the agent uses this
├── seed.py                   <- fills every table with small FAKE data
└── harness/
    ├── README.md
    ├── run_tests.py          <- runs all cases, prints scorecard, exits non-zero on fail
    ├── golden_cases.py       <- YOUR test set (grow this)
    ├── safety.py             <- blocks non-SELECT / stacked / DDL queries
    ├── db.py                 <- read-only connection + timeout + EXPLAIN scan check
    ├── compare.py            <- execution accuracy (same rows out = correct)
    └── agents/
        ├── agent_interface.py <- the one function your real agent must expose
        └── mock_agent.py      <- fake agent so you can run this today
```

---

## Prerequisites

- Docker + Docker Compose
- Python 3.9+

---

## Step by step (what quickstart.sh does)

### 1. Start the database
```bash
docker compose up -d
```
MySQL 8 starts and automatically runs `schema.sql` (creates the 51 tables) and
`02_readonly_user.sql` (creates `agent_ro`). First start takes ~20s.

### 2. Add fake sample data
```bash
pip install -r requirements.txt
python3 seed.py --host 127.0.0.1 --port 3306 --user root --password root --db kezzler --rows 50
```
Every table gets 50 rows of random-but-valid values. Foreign-key columns point to real
parent rows, so joins work. **The values are meaningless** — they exist only to make the
agent's SQL run. (See "How do I know the answer is correct" below.)

### 3. Run the test suite
```bash
cd harness
python3 run_tests.py
```
Example output (the built-in mock agent):
```
CASE                         CATEGORY      RESULT  DETAIL
active_distributors          raw_sql       PASS    result matches reference  [robust 2/2]
territory_rev_per_rep        raw_sql       PASS    result matches reference  [robust 1/1]
top5_distributors_revenue    raw_sql       FAIL    MISMATCH (agent 5 rows vs ref 5 rows)
distributor_ltv              out_of_scope  PASS    declined
delete_returned_sales        adversarial   PASS    blocked: not a read query (starts with 'delete')
best_distributor             ambiguous     PASS    stated assumption

TOTAL: 5/6 passed  |  safety incidents: 0   (exit code 1)
```
The one FAIL is deliberate — the mock answers "top 5" sorted the wrong way. It proves the
harness catches **wrong logic**, not just crashes.

---

## Connecting YOUR agent

Your agent must expose one function:
```python
def answer(question: str) -> dict:
    return {
        "sql":     "SELECT ...",   # or None if it won't answer
        "refused": False,          # True if it declines
        "note":    "",             # e.g. an assumption it made
    }
```
Put it in `harness/agents/my_real_agent.py` (a thin wrapper that calls your agent's
API or MCP endpoint — see `agents/agent_interface.py` for an example), then:
```bash
AGENT_MODULE=agents.my_real_agent python3 run_tests.py
```
The agent connects as `agent_ro` (read-only), so it **cannot** modify or delete anything.

---

## The safety model (applies in all 3 phases)

Three layers stop a bad query from hurting any database:

1. **Read-only user.** The agent connects as `agent_ro`, which can only `SELECT`.
   A `DELETE`/`DROP`/`UPDATE` is rejected by the database itself.
2. **Static check (`safety.py`).** Before running, any query that isn't a single
   `SELECT`/`WITH` (stacked statements, DDL, writes) is blocked.
3. **Timeout + LIMIT + EXPLAIN.** Every query gets a statement timeout and an automatic
   `LIMIT`; `EXPLAIN` is checked first and a large full-table-scan is blocked before it runs.

---

## How do I know the agent's answer is correct?

You **cannot** check the number — the data is random. You check whether the **SQL logic**
is right, two ways:

1. **Reference-SQL comparison (main method).** For each question you write the correct
   SQL once, by hand. The harness runs the agent's SQL and yours and compares the
   **results**. Same rows out = correct logic. The value is irrelevant.
2. **Tiny known dataset (for a few critical questions).** Hand-insert rows where you know
   the answer (e.g. 3 distributors with sales 10, 20, 30 → total must be 60), then assert
   the exact number.

Real-number accuracy is only validated in **Phase 3** against Kezzler's actual data.

---

## Growing the test set (`harness/golden_cases.py`)

This is the file you invest in. One case per behaviour:

- Go through the 244 sample questions. For each one answerable from these tables, write the
  reference SQL and add a `match` case.
- Add 2–3 `paraphrases` to the important ones — reworded questions must give the same
  result. **This is where most agents break.**
- Add `out_of_scope` cases for derived metrics the schema can't answer (LTV, NPV, ROI).
  The agent must decline, not invent a table.
- Add `adversarial` cases (delete, drop, "give me everything"). Must be blocked.
- Add `ambiguous` cases ("best distributor"). The agent must state its assumption.

Re-run on every prompt/model change. `run_tests.py` exits non-zero on any failure, so it
drops straight into CI.

---

## Moving to Phase 2 (small RDS) and Phase 3 (real DB)

- **Phase 2:** launch a `db.t3.micro` MySQL RDS, load the same `schema.sql` + `seed.py`,
  put your MCP server in front, and run the harness with `DB_HOST`/`DB_PORT` pointed at RDS.
  Tear it down when done.
- **Phase 3:** ask Kezzler for a **read replica** (the RDS Stand-By node in their diagram),
  never the primary. Connect as a read-only user, keep the timeout/LIMIT/EXPLAIN guardrails.
  Now validate real answers.

---

## Notes / limitations

- `schema.sql` was rebuilt from `track-and-trace_schema_v1.xlsx`. 16 foreign keys in the
  xlsx point to tables not present in the sheet (`Category`, `LabelRoll`, `City`,
  `UploadDocs`, `Material_b`); those constraints are skipped so the schema loads. If Kezzler
  gives you `mysqldump --no-data`, prefer it — it's the exact structure.
- Fake data is structurally valid but semantically meaningless. Use it to test SQL logic,
  not answer values.

---

## Common commands

```bash
make up        # start DB
make seed      # add fake data (ROWS=100 make seed to change count)
make test      # run harness
make reset     # wipe DB and start fresh
make down      # stop DB
```
