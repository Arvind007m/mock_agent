"""
compare.py — decide if the agent's result matches the reference result.
We compare RESULTS, not SQL text: two different queries can both be correct.
"""
from decimal import Decimal
import datetime


def _norm_cell(v):
    if isinstance(v, Decimal):
        return round(float(v), 2)
    if isinstance(v, float):
        return round(v, 2)
    if isinstance(v, (datetime.date, datetime.datetime)):
        return v.isoformat()
    return v


def _norm_rows(rows):
    # normalize each cell, then sort rows so order doesn't cause false fails
    normed = [tuple(_norm_cell(c) for c in row) for row in rows]
    return sorted(normed, key=lambda r: [str(x) for x in r])


def results_match(agent_rows, ref_rows):
    if agent_rows is None or ref_rows is None:
        return False
    return _norm_rows(agent_rows) == _norm_rows(ref_rows)
