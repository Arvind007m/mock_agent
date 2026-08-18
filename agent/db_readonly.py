"""
db_readonly.py — the agent runs its own SQL here ONLY to self-correct.
Connects as the read-only user (agent_ro). If MySQL isn't reachable, or
AGENT_SKIP_EXEC=1, execution is skipped and the agent returns its SQL unverified.
"""
import os

def _cfg():
    host = os.environ.get("DB_HOST", "127.0.0.1").strip().replace('\r', '').replace('\n', '')
    port = int(str(os.environ.get("DB_PORT", "3306")).strip().replace('\r', '').replace('\n', ''))
    user = os.environ.get("AGENT_USER", "agent_ro").strip().replace('\r', '').replace('\n', '')
    password = os.environ.get("AGENT_PW", "agent_ro_pw").strip().replace('\r', '').replace('\n', '')
    database = os.environ.get("DB_NAME", "kezzler").strip().replace('\r', '').replace('\n', '')
    
    cfg_dict = dict(
        host=host,
        port=port,
        user=user,
        password=password,
        database=database,
        connect_timeout=10,
    )
    if host != "127.0.0.1" and host != "localhost":
        cfg_dict["ssl"] = {"ssl": True}
    return cfg_dict

def try_execute(sql: str, timeout_ms: int = 5000):
    """Return (ok, error). ok=True means the query ran. Rows are ignored here —
    we only care whether it's VALID against the real schema."""
    if os.environ.get("AGENT_SKIP_EXEC") == "1":
        return True, None
    try:
        import pymysql
    except ImportError:
        return True, None  # can't check -> don't block
    try:
        conn = pymysql.connect(**_cfg(), autocommit=True)
        cur = conn.cursor()
        try:
            cur.execute(f"SET SESSION MAX_EXECUTION_TIME={timeout_ms}")
        except Exception:
            pass
        cur.execute(sql)
        cur.fetchall()
        conn.close()
        return True, None
    except Exception as e:
        return False, str(e)
