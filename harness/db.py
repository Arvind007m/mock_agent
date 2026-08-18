"""
db.py — how the harness talks to the test database.
- Agent queries run as a READ-ONLY user with a timeout.
- EXPLAIN is checked for full table scans before running.
"""
import pymysql


class DB:
    def __init__(self, cfg: dict):
        # cfg keys: host, port, user, password, db  OR  unix_socket, user, password, db
        self.cfg = cfg

    def _connect(self):
        c = dict(self.cfg)
        return pymysql.connect(cursorclass=pymysql.cursors.Cursor, autocommit=True, **c)

    def run(self, sql: str, timeout_ms: int = 5000):
        """Run a query, return (rows, error). rows is a list of tuples."""
        try:
            conn = self._connect()
            cur = conn.cursor()
            # query timeout — MySQL 8 uses MAX_EXECUTION_TIME (ms);
            # MariaDB uses max_statement_time (s). Try both, ignore if unsupported.
            for stmt in (f"SET SESSION MAX_EXECUTION_TIME={timeout_ms}",
                         f"SET SESSION max_statement_time={timeout_ms/1000.0}"):
                try:
                    cur.execute(stmt); break
                except Exception:
                    continue
            cur.execute(sql)
            rows = cur.fetchall()
            conn.close()
            return rows, None
        except Exception as e:
            return None, str(e)

    def explain(self, sql: str):
        """Return (plan_rows, warning). warning set if a big full scan is detected."""
        try:
            conn = self._connect()
            cur = conn.cursor(pymysql.cursors.DictCursor)
            cur.execute("EXPLAIN " + sql)
            plan = cur.fetchall()
            conn.close()
        except Exception as e:
            return None, f"explain failed: {e}"
        warn = None
        for step in plan:
            access = (step.get("type") or "").lower()
            est = step.get("rows") or 0
            if access == "all" and est and int(est) > 100_000:
                warn = (f"full table scan on '{step.get('table')}' "
                        f"(~{est} rows) — blocked before running")
        return plan, warn
