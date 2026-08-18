#!/usr/bin/env python3
"""
seed_known.py — insert a TINY, CONTROLLED dataset with KNOWN answers.

Unlike seed.py (random noise), this inserts a handful of rows where you know
the correct answer by hand, so the harness can assert EXACT numbers.

It uses a reserved high ID range (RecId 9000+) so it never collides with the
random seed data, and it deletes its own rows first so you can re-run it safely.

The controlled world it builds:
  2 territories:  North (9001), South (9002)
  1 region (9001) so territories have a valid parent
  2 reps (MDO):   rep in North (9001), rep in South (9002)
  3 distributors:
      Alpha (9001) North, active
      Bravo (9002) North, active
      Charlie (9003) South, active
  1 product (Hybrid 9001)
  DistributorSales (all IsReturned=0 unless noted):
      Alpha:   100 + 200            = 300
      Bravo:   50                   = 50
      Charlie: 400 + 100(RETURNED)  = 400 counted, 100 excluded

KNOWN ANSWERS (what your golden cases assert):
  active distributors in this set                 = 3
  total revenue (IsReturned=0)                    = 300 + 50 + 400 = 750
  revenue by territory:  North = 350,  South = 400
  top distributor by revenue                      = Charlie (400)
  returned-sales excluded correctly (Charlie 500 gross -> 400 net)

Usage (Windows):
  python seed_known.py --host 127.0.0.1 --port 3306 --user root --password YOURPW --db kezzler
"""
import argparse, pymysql

def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--host", default="127.0.0.1")
    p.add_argument("--port", type=int, default=3306)
    p.add_argument("--user", default="root")
    p.add_argument("--password", default="root")
    p.add_argument("--db", default="kezzler")
    return p.parse_args()

# reserved id range so we never clash with random seed data
R = 9000
ZONE        = R + 1                    # 9001
REGION      = R + 1                    # 9001
TERR_NORTH  = R + 1                    # 9001
TERR_SOUTH  = R + 2                    # 9002
MDO_NORTH   = R + 1
MDO_SOUTH   = R + 2
DIST_ALPHA  = R + 1
DIST_BRAVO  = R + 2
DIST_CHAR   = R + 3
HYBRID      = R + 1
CODE_BASE   = R                        # codes 9001..9006
SALE_BASE   = R                        # sales 9001..9006

def main():
    a = parse_args()
    conn = pymysql.connect(host=a.host, port=a.port, user=a.user,
                           password=a.password, database=a.db, autocommit=False)
    cur = conn.cursor()
    cur.execute("SET FOREIGN_KEY_CHECKS=0")

    # ---- clean up any previous run of THIS script (idempotent) ----
    for tbl, col in [
        ("DistributorSales", "DistributorSalesRecId"),
        ("Code", "CodeRecId"),
        ("Distributor", "DistributorRecId"),
        ("MDO", "MDORecId"),
        ("Territory", "TerritoryRecId"),
        ("Region", "RegionRecId"),
        ("Zone", "ZoneRecId"),
        ("Hybrid", "HybridRecId"),
    ]:
        cur.execute(f"DELETE FROM {tbl} WHERE {col} >= {R}")

    # ---- parents first ----
    cur.execute("INSERT INTO Zone (ZoneRecId, Zone, ShortName) VALUES (%s,%s,%s)",
                (ZONE, "KnownZone", "KZ"))
    cur.execute("INSERT INTO Region (RegionRecId, Region, ShortName, ZoneRecId) "
                "VALUES (%s,%s,%s,%s)", (REGION, "KnownRegion", "KR", ZONE))

    cur.execute("INSERT INTO Territory (TerritoryRecId, Territory, ShortName, RegionRecId) "
                "VALUES (%s,%s,%s,%s)", (TERR_NORTH, "North", "N", REGION))
    cur.execute("INSERT INTO Territory (TerritoryRecId, Territory, ShortName, RegionRecId) "
                "VALUES (%s,%s,%s,%s)", (TERR_SOUTH, "South", "S", REGION))

    cur.execute("INSERT INTO MDO (MDORecId, EmpId, FirstName, Passwd, TerritoryRecId, Mobile) "
                "VALUES (%s,%s,%s,%s,%s,%s)",
                (MDO_NORTH, "EMP-N", "RepNorth", "x", TERR_NORTH, "9000000001"))
    cur.execute("INSERT INTO MDO (MDORecId, EmpId, FirstName, Passwd, TerritoryRecId, Mobile) "
                "VALUES (%s,%s,%s,%s,%s,%s)",
                (MDO_SOUTH, "EMP-S", "RepSouth", "x", TERR_SOUTH, "9000000002"))

    cur.execute("INSERT INTO Hybrid (HybridRecId, MaterialName) VALUES (%s,%s)",
                (HYBRID, "KnownProduct"))

    # distributors: (id, name, territory, mdo, active, deleted)
    dists = [
        (DIST_ALPHA, "Alpha",   TERR_NORTH, MDO_NORTH, 1, 0),
        (DIST_BRAVO, "Bravo",   TERR_NORTH, MDO_NORTH, 1, 0),
        (DIST_CHAR,  "Charlie", TERR_SOUTH, MDO_SOUTH, 1, 0),
    ]
    for did, name, terr, mdo, active, deleted in dists:
        cur.execute(
            "INSERT INTO Distributor "
            "(DistributorRecId, BusinessName, TerritoryRecId, MDORecId, IsActive, IsDeleted, IsBLF, Passwd) "
            "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",
            (did, name, terr, mdo, active, deleted, 0, "x"))

    # codes (DistributorSales needs a CodeRecId; make one per sale)
    for i in range(1, 7):
        cur.execute("INSERT INTO Code (CodeRecId, Code) VALUES (%s,%s)",
                    (CODE_BASE + i, f"KCODE{i}"))

    # sales: (saleid, distributor, price, isreturned)
    sales = [
        (SALE_BASE + 1, DIST_ALPHA, 100, 0),
        (SALE_BASE + 2, DIST_ALPHA, 200, 0),   # Alpha total 300
        (SALE_BASE + 3, DIST_BRAVO,  50, 0),   # Bravo total 50
        (SALE_BASE + 4, DIST_CHAR,  400, 0),   # Charlie counted 400
        (SALE_BASE + 5, DIST_CHAR,  100, 1),   # RETURNED -> excluded
    ]
    for sid, dist, price, ret in sales:
        cur.execute(
            "INSERT INTO DistributorSales "
            "(DistributorSalesRecId, DistributorRecId, CodeRecId, HybridRecId, "
            " ScannedDate, SoldDate, Price, IsReturned) "
            "VALUES (%s,%s,%s,%s, NOW(), NOW(), %s, %s)",
            (sid, dist, CODE_BASE + (sid - SALE_BASE), HYBRID, price, ret))

    cur.execute("SET FOREIGN_KEY_CHECKS=1")
    conn.commit()
    print("Known dataset inserted (ids >= 9000).")
    print("Expected answers:")
    print("  active distributors in set : 3")
    print("  total revenue (net)        : 750")
    print("  North revenue              : 350")
    print("  South revenue              : 400")
    print("  top distributor            : Charlie (400)")

if __name__ == "__main__":
    main()
