"""
agent_interface.py — the ONE function the harness needs from your agent.

Your real agent must expose:

    def answer(question: str) -> dict

returning a dict:
    {
      "sql":     "SELECT ..."  or None,   # the query it wants to run (None if it won't)
      "refused": True/False,              # True if it declined to answer
      "note":    "free text"              # e.g. an assumption it made, or why it refused
    }

To wire in the real agent, replace mock_agent.answer with a call to your
agent's API / MCP endpoint, e.g.:

    import requests
    def answer(question):
        r = requests.post("http://localhost:8000/ask", json={"q": question}).json()
        return {"sql": r.get("sql"), "refused": r.get("refused", False),
                "note": r.get("explanation", "")}

Everything else in the harness stays the same.
"""
