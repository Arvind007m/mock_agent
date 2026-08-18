"""
schema_context.py — what the agent is allowed to know about the DB.

For now this is a hand-curated doc covering the tables you can actually answer
from. Later, swap this for real schema RAG (embed table/column docs, retrieve the
relevant few per question). Keeping it small also keeps the prompt cheap.
"""

# Core answerable tables + the columns and joins that matter.
SCHEMA_DOC = """\
You write MySQL for a track-and-trace sales database. Use ONLY these tables/columns.

Distributor(DistributorRecId PK, BusinessName, TerritoryRecId, MDORecId, StateRecId,
            DistrictRecId, IsActive, IsDeleted)
Retailer(RetailerRecId PK, BusinessName, TerritoryRecId, MDORecId, StateRecId, IsActive, IsDeleted)

DistributorSales(DistributorSalesRecId PK, DistributorRecId, HybridRecId, CodeRecId,
                 MDORecId, TSMRecId, LotRecId, Price DECIMAL, Points DECIMAL,
                 SoldDate DATETIME, ScannedDate DATETIME, IsReturned, IsDuplicateSales)
RetailerSales(RetailerSalesRecId PK, RetailerRecId, HybridRecId, CodeRecId, MDORecId,
              TSMRecId, LotRecId, Price DECIMAL, SoldDate DATETIME, ScannedDate DATETIME,
              IsReturned, IsDuplicateSales)

Hybrid(HybridRecId PK, MaterialNumber, MaterialName, SKURecId, CategoryRecId, MRP)  -- product master
SKU(SKURecId PK, PackSize, VarietyRecId, UnitType)

-- geo hierarchy: Zone > Region > Territory > District ; State is separate
Zone(ZoneRecId PK, Zone)
Region(RegionRecId PK, Region, ZoneRecId)
Territory(TerritoryRecId PK, Territory, RegionRecId, TSMRecId)
District(DistrictRecId PK, District, StateRecId, TerritoryRecId)
State(StateRecId PK, State)

-- field force
MDO(MDORecId PK, FirstName, LastName, TerritoryRecId)   -- a rep
TSM(TSMRecId PK, UsersRecId, AmbassadorRegionRecId)

-- track & trace
Code(CodeRecId PK, Code, LotRecId)
Lot(LotRecId PK, LotNum, HybridRecId, PackingDate)
DuplicateSales(DuplicateSalesRecId PK, CodeRecId, HybridRecId, DistributorRecId, RetailerRecId, ScannedOn)
WarehouseReturn(WarehouseReturnRecId PK, CodeRecId, HybridRecId, LotRecId, ScannedDate)

JOIN / SEMANTIC RULES (follow exactly):
- "revenue" = SUM(Price). ALWAYS exclude returned rows: WHERE IsReturned = 0.
- "primary sales"   = DistributorSales.   "secondary sales" = RetailerSales.
- distributor -> territory: DistributorSales JOIN Distributor USING(DistributorRecId),
  Distributor.TerritoryRecId -> Territory.TerritoryRecId.
- territory -> region -> zone: Territory.RegionRecId -> Region.RegionRecId -> Region.ZoneRecId -> Zone.
- product: *Sales.HybridRecId -> Hybrid.HybridRecId (MaterialName is the product name).
- rep: Distributor.MDORecId -> MDO.MDORecId  (a rep's territory is MDO.TerritoryRecId).
- "active" distributor/retailer = IsActive = 1 (and usually IsDeleted = 0).
- dates: use SoldDate for when it sold, ScannedDate for when it was scanned.
"""

# Metrics the schema CANNOT produce. If a question needs one of these, the agent
# must decline (there's no cost, plan, margin, sentiment, or finance data here).
OUT_OF_SCOPE_HINTS = [
    "ebitda", "revenue vs plan", "working capital", "ccc", "cash conversion",
    "d/e", "debt to equity", "roce", "roi", "npv", "ltv", "lifetime value",
    "esg", "nps", "net promoter", "brand perception", "brand awareness",
    "forecast accuracy", "market share", "margin", "gross margin", "otif",
    "wallet share", "elasticity", "scheme effectiveness", "budget", "plan vs actual",
]
