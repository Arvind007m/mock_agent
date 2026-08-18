"""
mock_agent.py — a FAKE agent so you can run the harness before the real one exists.
It hard-codes answers for the golden questions. One answer is deliberately WRONG
(top distributors sorted the wrong way) so you can see the harness catch a failure.

Swap this out for your real agent (see agent_interface.py).
"""


def answer(question: str) -> dict:
    q = question.lower()

    # --- out of scope: metric that doesn't exist in the schema ---
    if "lifetime value" in q or "ltv" in q:
        return {"sql": None, "refused": True,
                "note": "No lifetime-value data exists in the schema; cannot answer."}

    # --- adversarial: a naive agent might emit a DELETE. Safety net must catch it. ---
    if "delete" in q:
        return {"sql": "DELETE FROM DistributorSales WHERE IsReturned = 1",
                "refused": False, "note": ""}

    # --- ambiguous: agent should state an assumption ---
    if "best distributor" in q:
        return {"sql": "SELECT DistributorRecId, ROUND(SUM(Price),2) AS revenue "
                       "FROM DistributorSales GROUP BY DistributorRecId "
                       "ORDER BY revenue DESC LIMIT 1",
                "refused": False,
                "note": "Assumption: 'best' = highest total revenue."}

    # --- active distributors (has paraphrases in the golden set) ---
    if "active" in q and "distributor" in q:
        return {"sql": "SELECT COUNT(*) AS n FROM Distributor WHERE IsActive = 1",
                "refused": False, "note": ""}

    # --- territories by revenue per rep (question #81) ---
    if "territor" in q and "rep" in q:
        return {"sql": """SELECT t.Territory,
       ROUND(SUM(s.Price),2) AS revenue,
       COUNT(DISTINCT d.MDORecId) AS reps,
       ROUND(SUM(s.Price)/NULLIF(COUNT(DISTINCT d.MDORecId),0),2) AS revenue_per_rep
FROM DistributorSales s
JOIN Distributor d ON s.DistributorRecId = d.DistributorRecId
JOIN Territory   t ON d.TerritoryRecId   = t.TerritoryRecId
WHERE s.IsReturned = 0
GROUP BY t.TerritoryRecId, t.Territory
ORDER BY revenue_per_rep DESC""",
                "refused": False, "note": ""}

    # --- top distributors by revenue: DELIBERATELY WRONG (ascending) to show a FAIL ---
    if "top" in q and "distributor" in q:
        return {"sql": "SELECT DistributorRecId, ROUND(SUM(Price),2) AS revenue "
                       "FROM DistributorSales GROUP BY DistributorRecId "
                       "ORDER BY revenue ASC LIMIT 5",   # BUG: should be DESC
                "refused": False, "note": ""}

    # --- anything unknown ---
    return {"sql": None, "refused": True,
            "note": "Could not map the question to the schema."}
