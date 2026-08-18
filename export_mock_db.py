"""
export_mock_db.py — Export full mock database schema + seeded data into a single .sql file.
Run: python export_mock_db.py
"""
import os
import pymysql

OUTPUT_FILE = "kezzler_mock_dump.sql"

def dump_database():
    host = os.environ.get("DB_HOST", "127.0.0.1")
    port = int(os.environ.get("DB_PORT", "3306"))
    user = os.environ.get("AGENT_USER", "agent_ro")
    password = os.environ.get("AGENT_PW", "agent_ro_pw")
    database = os.environ.get("DB_NAME", "kezzler")

    print(f"Connecting to MySQL database '{database}' on {host}:{port}...")
    conn = pymysql.connect(
        host=host, port=port, user=user, password=password, database=database, autocommit=True
    )
    cur = conn.cursor()

    cur.execute("SHOW TABLES;")
    tables = [row[0] for row in cur.fetchall()]

    print(f"Found {len(tables)} tables. Exporting data to {OUTPUT_FILE}...")

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("-- Kezzler Mock Database Dump\n")
        f.write(f"-- Exported from {database}\n\n")
        f.write("SET FOREIGN_KEY_CHECKS = 0;\n\n")

        # Also include schema.sql if exists
        schema_path = os.path.join(os.path.dirname(__file__), "schema.sql")
        if os.path.exists(schema_path):
            with open(schema_path, "r", encoding="utf-8") as sf:
                f.write(sf.read())
                f.write("\n\n")

        for table in tables:
            cur.execute(f"SELECT * FROM `{table}`;")
            columns = [desc[0] for desc in cur.description]
            rows = cur.fetchall()
            if not rows:
                continue
            
            col_str = ", ".join([f"`{c}`" for c in columns])
            f.write(f"-- Data for table `{table}` ({len(rows)} rows)\n")
            
            for row in rows:
                vals = []
                for v in row:
                    if v is None:
                        vals.append("NULL")
                    elif isinstance(v, (int, float)):
                        vals.append(str(v))
                    else:
                        escaped = str(v).replace("\\", "\\\\").replace("'", "\\'")
                        vals.append(f"'{escaped}'")
                val_str = ", ".join(vals)
                f.write(f"INSERT INTO `{table}` ({col_str}) VALUES ({val_str});\n")
            f.write("\n")

        f.write("SET FOREIGN_KEY_CHECKS = 1;\n")

    conn.close()
    size_mb = round(os.path.getsize(OUTPUT_FILE) / (1024 * 1024), 2)
    print(f"Done! Exported full dump to {OUTPUT_FILE} ({size_mb} MB).")

if __name__ == "__main__":
    dump_database()
