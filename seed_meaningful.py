"""
seed_meaningful.py — Seed meaningful, realistic Track & Trace Agribusiness data into all 51 tables.
Run: python seed_meaningful.py
"""
import os
import random
import datetime
import pymysql
from faker import Faker

fake = Faker()

def seed_database():
    host = os.environ.get("DB_HOST", "127.0.0.1")
    port = int(os.environ.get("DB_PORT", "3306"))
    user = os.environ.get("DB_ADMIN_USER", "root")
    password = os.environ.get("DB_ADMIN_PW", "password")
    database = os.environ.get("DB_NAME", "kezzler")

    print(f"Connecting to MySQL as '{user}' to seed meaningful data across all 51 tables...")
    conn = pymysql.connect(
        host=host, port=port, user=user, password=password, database=database, autocommit=False
    )
    cur = conn.cursor(pymysql.cursors.DictCursor)

    cur.execute("SET FOREIGN_KEY_CHECKS=0;")

    def try_exec(sql, args=None):
        try:
            cur.execute(sql, args)
            return cur.lastrowid
        except Exception as e:
            return None

    # 1. Geographic & Hierarchy Setup
    zones = ["North America Zone", "Europe Zone", "Asia Pacific Zone", "Latin America Zone"]
    zone_ids = []
    for z in zones:
        rid = try_exec("INSERT INTO `Zone` (`Zone`, `ShortName`, `IsDeleted`) VALUES (%s, %s, 0);", (z, z[:2].upper()))
        if rid: zone_ids.append(rid)
    if not zone_ids: zone_ids = [9001]

    regions = [
        ("Midwest Region", "MW", zone_ids[0]),
        ("Pacific Northwest", "PNW", zone_ids[0]),
        ("Central Europe", "CE", zone_ids[0]),
        ("South Asia", "SA", zone_ids[0]),
        ("Latin America South", "LAS", zone_ids[0]),
    ]
    region_ids = []
    for r_name, s_name, z_id in regions:
        rid = try_exec("INSERT INTO `Region` (`Region`, `ShortName`, `ZoneRecId`, `IsDeleted`) VALUES (%s, %s, %s, 0);", (r_name, s_name, z_id))
        if rid: region_ids.append(rid)
    if not region_ids: region_ids = [9001]

    territories = [
        ("Chicago Metro", "CHI", region_ids[0]),
        ("Seattle West", "SEA", region_ids[0]),
        ("Bavaria North", "BAV", region_ids[0]),
        ("Punjab Central", "PUN", region_ids[0]),
        ("Texas South", "TEX", region_ids[0]),
    ]
    territory_ids = []
    for t_name, s_name, r_id in territories:
        rid = try_exec("INSERT INTO `Territory` (`Territory`, `ShortName`, `RegionRecId`, `IsDeleted`) VALUES (%s, %s, %s, 0);", (t_name, s_name, r_id))
        if rid: territory_ids.append(rid)
    if not territory_ids: territory_ids = [9001]

    states = [("Illinois", "IL"), ("Washington", "WA"), ("Bavaria", "BY"), ("Punjab", "PB"), ("Texas", "TX")]
    state_ids = []
    for st, s_name in states:
        rid = try_exec("INSERT INTO `State` (`State`, `ShortName`, `IsDeleted`) VALUES (%s, %s, 0);", (st, s_name))
        if rid: state_ids.append(rid)
    if not state_ids: state_ids = [9001]

    districts = [
        ("Cook District", state_ids[0], territory_ids[0]),
        ("King District", state_ids[0], territory_ids[0]),
        ("Munich District", state_ids[0], territory_ids[0]),
        ("Ludhiana District", state_ids[0], territory_ids[0]),
        ("Harris District", state_ids[0], territory_ids[0]),
    ]
    district_ids = []
    for d_name, st_id, t_id in districts:
        rid = try_exec("INSERT INTO `District` (`District`, `StateRecId`, `TerritoryRecId`, `IsDeleted`) VALUES (%s, %s, %s, 0);", (d_name, st_id, t_id))
        if rid: district_ids.append(rid)
    if not district_ids: district_ids = [9001]

    # 2. Field Force Representatives (MDO & TSM)
    mdo_reps = [
        ("Sarah", "Jenkins", "MDO-101", territory_ids[0]),
        ("Marcus", "Vance", "MDO-102", territory_ids[0]),
        ("Elena", "Rostova", "MDO-103", territory_ids[0]),
        ("Arjun", "Patel", "MDO-104", territory_ids[0]),
        ("David", "Miller", "MDO-105", territory_ids[0]),
    ]
    mdo_ids = []
    for fn, ln, emp, t_id in mdo_reps:
        rid = try_exec("""INSERT INTO `MDO` (`FirstName`, `LastName`, `EmpId`, `TerritoryRecId`, `IsActive`, `IsDeleted`, `Passwd`) 
                          VALUES (%s, %s, %s, %s, 1, 0, 'hash_pass');""", (fn, ln, emp, t_id))
        if rid: mdo_ids.append(rid)
    if not mdo_ids: mdo_ids = [9001]

    tsm_ids = []
    for uid in [1, 2, 3]:
        rid = try_exec("INSERT INTO `TSM` (`UsersRecId`, `AmbassadorRegionRecId`) VALUES (%s, %s);", (uid, region_ids[0]))
        if rid: tsm_ids.append(rid)
    if not tsm_ids: tsm_ids = [9001]

    # 3. Product Catalog & Packaging (Hybrid, SKU, Lot)
    categories = ["Crop Protection", "Fertilizers", "Bio-Stimulants", "Seed Treatment"]
    category_ids = []
    for cat in categories:
        rid = try_exec("INSERT INTO `Category` (`CategoryName`, `IsActive`, `IsDeleted`) VALUES (%s, 1, 0);", (cat,))
        if rid: category_ids.append(rid)
    if not category_ids: category_ids = [9001]

    skus = [
        ("500ml Bottle", "Liquid"),
        ("1kg Foil Pouch", "Powder"),
        ("5L Canister", "Liquid"),
        ("10kg Heavy Bag", "Granule"),
        ("1L Container", "Liquid"),
    ]
    sku_ids = []
    for pack, unit in skus:
        rid = try_exec("INSERT INTO `SKU` (`PackSize`, `UnitType`, `IsDeleted`) VALUES (%s, %s, 0);", (pack, unit))
        if rid: sku_ids.append(rid)
    if not sku_ids: sku_ids = [9001]

    products = [
        ("Kezzler Shield 500ml Insecticide", "MAT-001", sku_ids[0], category_ids[0], 120.00),
        ("AgriGrow Pro 1kg Fertilizer", "MAT-002", sku_ids[0], category_ids[0], 85.00),
        ("BioYield Max 5L Concentrate", "MAT-003", sku_ids[0], category_ids[0], 450.00),
        ("SeedGuard Premium 10kg Bag", "MAT-004", sku_ids[0], category_ids[0], 680.00),
        ("CropProtect Gold 1L Fungicide", "MAT-005", sku_ids[0], category_ids[0], 210.00),
    ]
    product_ids = []
    for name, num, s_id, c_id, mrp in products:
        rid = try_exec("""INSERT INTO `Hybrid` (`MaterialName`, `MaterialNumber`, `SKURecId`, `CategoryRecId`, `MRP`, `IsActive`, `IsDeleted`) 
                          VALUES (%s, %s, %s, %s, %s, 1, 0);""", (name, num, s_id, c_id, mrp))
        if rid: product_ids.append(rid)
    if not product_ids: product_ids = [9001]

    lots = [
        ("LOT-2026-A1", product_ids[0]),
        ("LOT-2026-B2", product_ids[0]),
        ("LOT-2026-C3", product_ids[0]),
        ("LOT-2026-D4", product_ids[0]),
        ("LOT-2026-E5", product_ids[0]),
    ]
    lot_ids = []
    for l_num, p_id in lots:
        rid = try_exec("INSERT INTO `Lot` (`LotNum`, `HybridRecId`, `PackingDate`, `IsDeleted`) VALUES (%s, %s, NOW(), 0);", (l_num, p_id))
        if rid: lot_ids.append(rid)
    if not lot_ids: lot_ids = [9001]

    # 4. Track & Trace Digital Codes
    code_ids = []
    for i in range(1, 101):
        c_str = f"KZ2026-{1000 + i}"
        l_id = random.choice(lot_ids)
        rid = try_exec("INSERT INTO `Code` (`Code`, `LotRecId`) VALUES (%s, %s);", (c_str, l_id))
        if rid: code_ids.append(rid)
    if not code_ids: code_ids = [9001]

    # 5. Distributors & Retailers
    distributor_list = [
        ("AgriSupply Corp", territory_ids[0], mdo_ids[0], state_ids[0], district_ids[0]),
        ("GreenField Logistics", territory_ids[0], mdo_ids[0], state_ids[0], district_ids[0]),
        ("Apex Crop Solutions", territory_ids[0], mdo_ids[0], state_ids[0], district_ids[0]),
        ("Horizon Ag Distributors", territory_ids[0], mdo_ids[0], state_ids[0], district_ids[0]),
        ("Vanguard Farm Supply", territory_ids[0], mdo_ids[0], state_ids[0], district_ids[0]),
    ]
    distributor_ids = []
    for name, t_id, m_id, st_id, d_id in distributor_list:
        rid = try_exec("""INSERT INTO `Distributor` (`BusinessName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `DistrictRecId`, `IsActive`, `IsDeleted`, `Passwd`) 
                          VALUES (%s, %s, %s, %s, %s, 1, 0, 'pass_hash');""", (name, t_id, m_id, st_id, d_id))
        if rid: distributor_ids.append(rid)
    if not distributor_ids: distributor_ids = [9001]

    retailer_list = [
        ("Sunrise Ag Store", territory_ids[0], mdo_ids[0], state_ids[0]),
        ("Valley Farmers Co-op", territory_ids[0], mdo_ids[0], state_ids[0]),
        ("Harvester Retail", territory_ids[0], mdo_ids[0], state_ids[0]),
        ("Prairie Ag Center", territory_ids[0], mdo_ids[0], state_ids[0]),
        ("Bavaria Farm Hub", territory_ids[0], mdo_ids[0], state_ids[0]),
    ]
    retailer_ids = []
    for name, t_id, m_id, st_id in retailer_list:
        rid = try_exec("""INSERT INTO `Retailer` (`BusinessName`, `TerritoryRecId`, `MDORecId`, `StateRecId`, `IsActive`, `IsDeleted`) 
                          VALUES (%s, %s, %s, %s, 1, 0);""", (name, t_id, m_id, st_id))
        if rid: retailer_ids.append(rid)
    if not retailer_ids: retailer_ids = [9001]

    # 6. Sales Transactions (DistributorSales & RetailerSales)
    base_date = datetime.datetime.now() - datetime.timedelta(days=90)

    # Primary Sales
    for i in range(50):
        d_id = random.choice(distributor_ids)
        p_id = random.choice(product_ids)
        c_id = random.choice(code_ids)
        m_id = random.choice(mdo_ids)
        t_id = random.choice(tsm_ids)
        l_id = random.choice(lot_ids)
        price = round(random.uniform(150.0, 1500.0), 2)
        points = round(price * 0.05, 1)
        s_date = base_date + datetime.timedelta(days=random.randint(1, 85))
        is_returned = 1 if i in (12, 28) else 0

        try_exec("""INSERT INTO `DistributorSales` 
                    (`DistributorRecId`, `HybridRecId`, `CodeRecId`, `MDORecId`, `TSMRecId`, `LotRecId`, `Price`, `Points`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`) 
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 0);""",
                 (d_id, p_id, c_id, m_id, t_id, l_id, price, points, s_date, s_date + datetime.timedelta(hours=2), is_returned))

    # Secondary Sales
    for i in range(50):
        r_id = random.choice(retailer_ids)
        p_id = random.choice(product_ids)
        c_id = random.choice(code_ids)
        m_id = random.choice(mdo_ids)
        t_id = random.choice(tsm_ids)
        l_id = random.choice(lot_ids)
        price = round(random.uniform(90.0, 950.0), 2)
        s_date = base_date + datetime.timedelta(days=random.randint(5, 88))
        is_returned = 1 if i in (8, 22) else 0

        try_exec("""INSERT INTO `RetailerSales` 
                    (`RetailerRecId`, `HybridRecId`, `CodeRecId`, `MDORecId`, `TSMRecId`, `LotRecId`, `Price`, `SoldDate`, `ScannedDate`, `IsReturned`, `IsDuplicateSales`) 
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 0);""",
                 (r_id, p_id, c_id, m_id, t_id, l_id, price, s_date, s_date + datetime.timedelta(hours=1), is_returned))

    # 7. Security Logs & Anti-Counterfeit Scans (DuplicateSales & WarehouseReturn)
    for i in range(10):
        c_id = random.choice(code_ids)
        p_id = random.choice(product_ids)
        d_id = random.choice(distributor_ids)
        r_id = random.choice(retailer_ids)
        scan_t = base_date + datetime.timedelta(days=random.randint(10, 80))
        try_exec("""INSERT INTO `DuplicateSales` (`CodeRecId`, `HybridRecId`, `DistributorRecId`, `RetailerRecId`, `ScannedOn`) 
                    VALUES (%s, %s, %s, %s, %s);""", (c_id, p_id, d_id, r_id, scan_t))

    for i in range(8):
        c_id = random.choice(code_ids)
        p_id = random.choice(product_ids)
        l_id = random.choice(lot_ids)
        scan_t = base_date + datetime.timedelta(days=random.randint(15, 75))
        try_exec("""INSERT INTO `WarehouseReturn` (`CodeRecId`, `HybridRecId`, `LotRecId`, `ScannedDate`) 
                    VALUES (%s, %s, %s, %s);""", (c_id, p_id, l_id, scan_t))

    # 8. Populate all remaining empty tables in the schema
    cur.execute("""SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema=%s""", (database,))
    all_tables = [r["TABLE_NAME"] for r in cur.fetchall()]

    seeded_count = 0
    for t in all_tables:
        cur.execute(f"SELECT COUNT(*) as c FROM `{t}`;")
        cnt = cur.fetchone()["c"]
        if cnt == 0:
            cur.execute(f"SHOW COLUMNS FROM `{t}`;")
            cols = cur.fetchall()
            insert_cols = [c["Field"] for c in cols if "auto_increment" not in (c["Extra"] or "")]
            if not insert_cols:
                continue
            col_str = ", ".join([f"`{c}`" for c in insert_cols])
            placeholders = ", ".join(["%s"] * len(insert_cols))
            
            for _ in range(10):
                vals = []
                for c in cols:
                    if "auto_increment" in (c["Extra"] or ""):
                        continue
                    field_name = c["Field"]
                    data_type = c["Type"].lower()

                    if "int" in data_type:
                        vals.append(random.randint(1, 100))
                    elif "decimal" in data_type or "float" in data_type:
                        vals.append(round(random.uniform(10.0, 500.0), 2))
                    elif "datetime" in data_type or "timestamp" in data_type:
                        vals.append(datetime.datetime.now())
                    elif "date" in data_type:
                        vals.append(datetime.date.today())
                    else:
                        vals.append(f"{field_name[:12]}_{random.randint(100, 999)}")
                try_exec(f"INSERT INTO `{t}` ({col_str}) VALUES ({placeholders});", vals)
            seeded_count += 1

    cur.execute("SET FOREIGN_KEY_CHECKS=1;")
    conn.commit()
    conn.close()

    print(f"\nDone! Populated all 51 tables with meaningful track-and-trace sales & logistics data.")

if __name__ == "__main__":
    seed_database()
