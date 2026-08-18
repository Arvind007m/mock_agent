"""
real_agent.py — put this at harness/agents/real_agent.py

Thin wrapper so the harness can test the LangGraph agent:
    AGENT_MODULE=agents.real_agent python3 run_tests.py
"""
import os, sys
# add project root (two levels up from harness/agents/) so `agent` package imports
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from agent import answer   # noqa: E402

__all__ = ["answer"]
