"""
llm.py — the ONE place the agent talks to a model. Provider-agnostic.

All options below speak the OpenAI-compatible API, so the code is identical —
only base_url / key / model change. Pick with AGENT_PROVIDER:

  openrouter (default here) -> set OPENROUTER_API_KEY  (openrouter.ai/keys)
                               default model: deepseek/deepseek-chat-v3:free
  gemini  (free)            -> set GEMINI_API_KEY      (aistudio.google.com/apikey)
  groq    (free, fast)      -> set GROQ_API_KEY        (console.groq.com/keys)
  ollama  (local, private)  -> run `ollama serve`, no key needed
  openai / anthropic        -> paid, set the matching *_API_KEY

Override the model any time with AGENT_MODEL.
Smoke-test with no key at all:  AGENT_FAKE_LLM=1
"""
import os, json
def _load_dotenv():
    here = os.path.dirname(os.path.abspath(__file__))
    for path in (os.path.join(here, ".env"), os.path.join(here, "..", ".env")):
        if os.path.exists(path):
            with open(path) as f:
                for line in f:
                    line = line.strip()
                    if not line or line.startswith("#") or "=" not in line:
                        continue
                    k, v = line.split("=", 1)
                    os.environ.setdefault(k.strip(), v.strip().strip('"').strip("'"))
_load_dotenv()
PROVIDER = os.environ.get("AGENT_PROVIDER", "openrouter").lower()

# provider -> (base_url, api-key env var, default model)
_PROVIDERS = {
    "openrouter": ("https://openrouter.ai/api/v1",
                   "OPENROUTER_API_KEY", "deepseek/deepseek-chat-v3:free"),
    "gemini": ("https://generativelanguage.googleapis.com/v1beta/openai/",
               "GEMINI_API_KEY", "gemini-2.5-flash"),
    "groq":   ("https://api.groq.com/openai/v1",
               "GROQ_API_KEY", "groq/compound-mini"),
    "ollama": ("http://localhost:11434/v1",
               None, "qwen2.5-coder"),
    "openai": ("https://api.openai.com/v1",
               "OPENAI_API_KEY", "gpt-4o-mini"),
    "anthropic": (None, "ANTHROPIC_API_KEY", "claude-sonnet-4-6"),  # native, handled below
}

MODEL = os.environ.get("AGENT_MODEL")  # override any default


def _fake(system: str, user: str) -> str:
    if "classify" in system.lower():
        oos = any(k in user.lower() for k in ("ltv", "ebitda", "nps", "roi", "npv", "esg"))
        return json.dumps({"answerable": not oos, "reason": "derived metric" if oos else "in schema"})
    qline = next((l.lower() for l in user.splitlines() if l.lower().startswith("question:")), "")
    if "top" in qline and "distributor" in qline:
        return ("SELECT DistributorRecId, ROUND(SUM(Price),2) AS revenue "
                "FROM DistributorSales WHERE IsReturned=0 "
                "GROUP BY DistributorRecId ORDER BY revenue DESC LIMIT 5;")
    if "active" in qline and "distributor" in qline:
        return "SELECT COUNT(*) AS n FROM Distributor WHERE IsActive = 1;"
    return "SELECT 1;"


def call_llm(system: str, user: str, max_tokens: int = 1024) -> str:
    if os.environ.get("AGENT_FAKE_LLM") == "1":
        return _fake(system, user)

    provider = os.environ.get("AGENT_PROVIDER", "groq").lower()
    base_url, key_env, default_model = _PROVIDERS.get(provider, ("https://api.groq.com/openai/v1", "GROQ_API_KEY", "groq/compound-mini"))
    model = os.environ.get("AGENT_MODEL") or default_model

    api_key = os.environ.get(key_env) or os.environ.get("GROQ_API_KEY")
    if not api_key:
        raise RuntimeError("GROQ_API_KEY environment variable is not configured on Vercel.")

    from openai import OpenAI
    client = OpenAI(base_url=base_url or "https://api.groq.com/openai/v1", api_key=api_key)
    r = client.chat.completions.create(
        model=model, max_tokens=max_tokens,
        messages=[{"role": "system", "content": system},
                  {"role": "user", "content": user}],
    )
    return (r.choices[0].message.content or "").strip()
