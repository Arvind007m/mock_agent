"""
llm.py — the ONE place the agent talks to a model. Provider-agnostic.

All options below speak the OpenAI-compatible API.
Pick with AGENT_PROVIDER:

  openrouter (default here) -> set OPENROUTER_API_KEY
  gemini  (free)            -> set GEMINI_API_KEY
  groq    (free, fast)      -> set GROQ_API_KEY
  ollama  (local, private)  -> run `ollama serve`, no key needed
  openai / anthropic        -> paid, set matching key

Override the model any time with AGENT_MODEL.
Smoke-test with no key at all:  AGENT_FAKE_LLM=1
"""
import os
import json
import time
import urllib.request

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
                    val = v.strip().strip('"').strip("'").replace('\r', '').replace('\n', '')
                    os.environ.setdefault(k.strip(), val)
_load_dotenv()

PROVIDER = os.environ.get("AGENT_PROVIDER", "groq").lower().strip()

_PROVIDERS = {
    "openrouter": ("https://openrouter.ai/api/v1", "OPENROUTER_API_KEY", "deepseek/deepseek-chat-v3:free"),
    "gemini": ("https://generativelanguage.googleapis.com/v1beta/openai/", "GEMINI_API_KEY", "gemini-2.5-flash"),
    "groq": ("https://api.groq.com/openai/v1", "GROQ_API_KEY", "groq/compound-mini"),
    "ollama": ("http://localhost:11434/v1", None, "qwen2.5-coder"),
    "openai": ("https://api.openai.com/v1", "OPENAI_API_KEY", "gpt-4o-mini"),
}

MODEL = os.environ.get("AGENT_MODEL")


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

    provider = os.environ.get("AGENT_PROVIDER", "groq").lower().strip()
    base_url, key_env, default_model = _PROVIDERS.get(provider, ("https://api.groq.com/openai/v1", "GROQ_API_KEY", "groq/compound-mini"))
    model = (os.environ.get("AGENT_MODEL") or default_model).strip()

    raw_key = os.environ.get(key_env) or os.environ.get("GROQ_API_KEY") or ""
    api_key = raw_key.strip().replace('\r', '').replace('\n', '')
    if not api_key:
        api_key = "dummy"

    url = f"{base_url.rstrip('/')}/chat/completions"

    models_to_try = [model]
    if "groq/compound-mini" not in models_to_try:
        models_to_try.append("groq/compound-mini")
    if "qwen/qwen3.6-27b" not in models_to_try:
        models_to_try.append("qwen/qwen3.6-27b")

    last_err = None
    for m in models_to_try:
        try:
            p_data = json.dumps({
                "model": m,
                "messages": [
                    {"role": "system", "content": system},
                    {"role": "user", "content": user}
                ],
                "max_tokens": max_tokens
            }).encode("utf-8")

            headers = {
                "Authorization": f"Bearer {api_key}",
                "Content-Type": "application/json",
                "Content-Length": str(len(p_data)),
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) KezzlerAgent/1.0"
            }
            
            req = urllib.request.Request(url, data=p_data, headers=headers)
            with urllib.request.urlopen(req, timeout=30) as response:
                resp_data = json.loads(response.read().decode("utf-8"))
                content = resp_data["choices"][0]["message"]["content"]
                if content:
                    return content.strip()
        except Exception as e:
            last_err = e
            time.sleep(2.0)

    raise RuntimeError(f"LLM Connection Error: {str(last_err)}")
