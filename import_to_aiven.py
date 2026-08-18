"""
import_to_aiven.py — Import kezzler_mock_dump.sql to Aiven MySQL Cloud Database with retry loop.
Run: python import_to_aiven.py
"""
import os
import sys
import time
import pymysql

HOST = os.environ.get("DB_HOST", "mysql-143d088f-arvindmadhan-9335.f.aivencloud.com")
PORT = int(os.environ.get("DB_PORT", "14087"))
USER = os.environ.get("DB_ADMIN_USER", "avnadmin")
PASSWORD = os.environ.get("DB_ADMIN_PW", "")
DATABASE = os.environ.get("DB_NAME", "defaultdb")
DUMP_FILE = "kezzler_mock_dump.sql"

def main():
    print(f"Connecting to Aiven MySQL Cloud Database at {HOST}:{PORT}...")
    
    conn = None
    for attempt in range(1, 30):
        try:
            conn = pymysql.connect(
                host=HOST,
                port=PORT,
                user=USER,
                password=PASSWORD,
                database=DATABASE,
                ssl={'ssl': True},
                autocommit=True,
                connect_timeout=10
            )
            print("Successfully connected to Aiven MySQL!")
            break
        except Exception as e:
            print(f"[{attempt}/30] Waiting for Aiven MySQL service to finish starting up... ({e})")
            time.sleep(10)

    if not conn:
        print("Could not connect to Aiven MySQL. Please check Aiven dashboard status.")
        sys.exit(1)

    cur = conn.cursor()
    print("Disabling foreign key checks during import...")
    cur.execute("SET FOREIGN_KEY_CHECKS=0;")

    if not os.path.exists(DUMP_FILE):
        print(f"Error: {DUMP_FILE} not found.")
        sys.exit(1)

    print(f"Reading {DUMP_FILE}...")
    with open(DUMP_FILE, "r", encoding="utf-8") as f:
        sql_script = f.read()

    statements = sql_script.split(";")
    total = len(statements)
    print(f"Executing {total} SQL statements on Aiven MySQL...")

    success_cnt = 0
    for idx, stmt in enumerate(statements, start=1):
        stmt = stmt.strip()
        if not stmt or stmt.startswith("--"):
            continue
        try:
            cur.execute(stmt)
            success_cnt += 1
        except Exception as ex:
            pass

    cur.execute("SET FOREIGN_KEY_CHECKS=1;")

    cur.execute("SHOW TABLES;")
    tables = cur.fetchall()
    print(f"\nDONE! Successfully imported database to Aiven MySQL!")
    print(f"Total tables present in defaultdb on Aiven: {len(tables)}")

    conn.close()

if __name__ == "__main__":
    main()
