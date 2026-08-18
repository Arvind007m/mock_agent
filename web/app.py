"""
app.py — Web Chat Interface for Kezzler Text-to-SQL AI Agent.
Runs a FastAPI server on http://127.0.0.1:8000
"""
import os
import sys
import time
import pymysql
from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from pydantic import BaseModel

# Add project root to python path
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if ROOT_DIR not in sys.path:
    sys.path.insert(0, ROOT_DIR)

from agent.graph import answer
from harness.safety import is_safe, enforce_limit

from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Kezzler AI Agent Chat Interface", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    question: str

def get_db_connection():
    db_host = os.environ.get("DB_HOST", "127.0.0.1")
    conn_kwargs = dict(
        host=db_host,
        port=int(os.environ.get("DB_PORT", "3306")),
        user=os.environ.get("AGENT_USER", "agent_ro"),
        password=os.environ.get("AGENT_PW", "agent_ro_pw"),
        database=os.environ.get("DB_NAME", "kezzler"),
        autocommit=True,
        cursorclass=pymysql.cursors.Cursor,
        connect_timeout=10,
    )
    if db_host != "127.0.0.1" and db_host != "localhost":
        conn_kwargs["ssl"] = {"ssl": True}
    return pymysql.connect(**conn_kwargs)

def execute_query(sql: str, limit: int = 100):
    safe_sql = enforce_limit(sql, cap=limit)
    start_t = time.time()
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        # Set 5-second timeout
        try:
            cur.execute("SET SESSION MAX_EXECUTION_TIME=5000")
        except Exception:
            pass
        cur.execute(safe_sql)
        columns = [desc[0] for desc in cur.description] if cur.description else []
        raw_rows = cur.fetchall()
        conn.close()
        duration_ms = round((time.time() - start_t) * 1000, 2)
        
        # Format values for JSON serializability
        rows = []
        for row in raw_rows:
            formatted_row = []
            for item in row:
                if item is None:
                    formatted_row.append(None)
                elif isinstance(item, (int, float, str, bool)):
                    formatted_row.append(item)
                else:
                    formatted_row.append(str(item))
            rows.append(formatted_row)

        return {
            "success": True,
            "columns": columns,
            "rows": rows,
            "row_count": len(rows),
            "duration_ms": duration_ms,
            "error": None,
            "executed_sql": safe_sql
        }
    except Exception as e:
        duration_ms = round((time.time() - start_t) * 1000, 2)
        return {
            "success": False,
            "columns": [],
            "rows": [],
            "row_count": 0,
            "duration_ms": duration_ms,
            "error": str(e),
            "executed_sql": safe_sql
        }

@app.get("/api/health")
def health_check():
    db_ok = False
    db_err = None
    try:
        conn = get_db_connection()
        conn.ping()
        conn.close()
        db_ok = True
    except Exception as e:
        db_err = str(e)

    return {
        "status": "ok",
        "database_connected": db_ok,
        "database_error": db_err,
        "provider": os.environ.get("AGENT_PROVIDER", "groq"),
        "model": os.environ.get("AGENT_MODEL", "llama-3.3-70b-versatile"),
        "db_host": os.environ.get("DB_HOST", "127.0.0.1"),
        "db_name": os.environ.get("DB_NAME", "kezzler"),
    }

@app.post("/api/chat")
def chat_endpoint(req: ChatRequest):
    question = req.question.strip()
    if not question:
        raise HTTPException(status_code=400, detail="Question cannot be empty")

    start_time = time.time()
    
    # 1. Invoke LangGraph Agent
    agent_output = answer(question)
    
    raw_sql = agent_output.get("sql")
    refused = agent_output.get("refused", False)
    note = agent_output.get("note", "")

    # 2. Safety check & execution
    safety_ok = True
    safety_reason = "OK"
    exec_result = None

    if raw_sql and not refused:
        safety_ok, safety_reason = is_safe(raw_sql)
        if safety_ok:
            exec_result = execute_query(raw_sql)
        else:
            exec_result = {
                "success": False,
                "columns": [],
                "rows": [],
                "row_count": 0,
                "duration_ms": 0,
                "error": f"Blocked by safety guardrail: {safety_reason}",
                "executed_sql": raw_sql
            }

    total_duration_ms = round((time.time() - start_time) * 1000, 2)

    return {
        "question": question,
        "refused": refused,
        "note": note,
        "sql": raw_sql,
        "is_safe": safety_ok,
        "safety_reason": safety_reason,
        "execution": exec_result,
        "total_duration_ms": total_duration_ms,
        "provider": os.environ.get("AGENT_PROVIDER", "groq"),
        "model": os.environ.get("AGENT_MODEL", "llama-3.3-70b-versatile"),
    }

@app.get("/", response_class=HTMLResponse)
def index():
    return HTML_CONTENT

HTML_CONTENT = r"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kezzler AI Agent — Text-to-SQL Engine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-base: #090a0c;
            --bg-surface: #111318;
            --bg-elevated: #181b22;
            --bg-input: #14171e;
            --border-subtle: #222631;
            --border-accent: #333a4b;
            --text-primary: #f3f4f6;
            --text-secondary: #9ca3af;
            --text-muted: #6b7280;
            --accent-blue: #3b82f6;
            --accent-cyan: #06b6d4;
            --status-green: #10b981;
            --status-amber: #f59e0b;
            --status-red: #ef4444;
            --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            --font-mono: 'JetBrains Mono', monospace;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: var(--font-sans);
            background-color: var(--bg-base);
            color: var(--text-primary);
            height: 100vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            -webkit-font-smoothing: antialiased;
        }

        /* Minimalist Header */
        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 14px 24px;
            background: rgba(17, 19, 24, 0.8);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-subtle);
            z-index: 10;
        }

        .header-brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-symbol {
            width: 28px;
            height: 28px;
            background: var(--bg-elevated);
            border: 1px solid var(--border-accent);
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 13px;
            color: #ffffff;
            letter-spacing: -0.05em;
        }

        .brand-title {
            font-size: 14px;
            font-weight: 600;
            letter-spacing: -0.01em;
            color: #ffffff;
        }

        .brand-sub {
            font-size: 12px;
            color: var(--text-muted);
            margin-left: 6px;
            font-weight: 400;
        }

        .header-meta {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .meta-pill {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            background: var(--bg-elevated);
            border: 1px solid var(--border-subtle);
            border-radius: 6px;
            font-size: 12px;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: var(--status-green);
        }
        .status-dot.offline { background: var(--status-red); }

        /* Main Workspace */
        .workspace {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-width: 1040px;
            width: 100%;
            margin: 0 auto;
            overflow: hidden;
            position: relative;
        }

        /* Chat Scroll Canvas */
        .chat-canvas {
            flex: 1;
            overflow-y: auto;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            gap: 24px;
            scroll-behavior: smooth;
        }

        .chat-canvas::-webkit-scrollbar { width: 5px; }
        .chat-canvas::-webkit-scrollbar-thumb {
            background: var(--border-subtle);
            border-radius: 3px;
        }

        /* Message Rows */
        .msg-row {
            display: flex;
            flex-direction: column;
            gap: 8px;
            width: 100%;
            animation: fadeIn 0.25s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(6px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .msg-row.user { align-items: flex-end; }
        .msg-row.agent { align-items: flex-start; }

        .user-bubble {
            background: var(--bg-elevated);
            border: 1px solid var(--border-accent);
            padding: 12px 18px;
            border-radius: 12px 12px 2px 12px;
            color: #ffffff;
            font-size: 14px;
            line-height: 1.5;
            max-width: 80%;
        }

        .agent-container {
            background: var(--bg-surface);
            border: 1px solid var(--border-subtle);
            border-radius: 12px;
            padding: 18px 20px;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        /* Pipeline Steps Header */
        .pipeline-header {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
            padding-bottom: 12px;
            border-bottom: 1px solid var(--border-subtle);
        }

        .pipe-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 11px;
            font-weight: 500;
            padding: 3px 8px;
            border-radius: 4px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--border-subtle);
            color: var(--text-muted);
            font-family: var(--font-mono);
        }
        .pipe-tag.pass {
            background: rgba(16, 185, 129, 0.08);
            border-color: rgba(16, 185, 129, 0.25);
            color: #34d399;
        }
        .pipe-tag.refused {
            background: rgba(239, 68, 68, 0.08);
            border-color: rgba(239, 68, 68, 0.25);
            color: #f87171;
        }
        .pipe-tag.active {
            background: rgba(59, 130, 246, 0.08);
            border-color: rgba(59, 130, 246, 0.25);
            color: #60a5fa;
        }

        /* Callout Containers */
        .callout {
            padding: 12px 14px;
            border-radius: 6px;
            font-size: 13px;
            line-height: 1.5;
            display: flex;
            gap: 10px;
            align-items: flex-start;
        }
        .callout.info {
            background: rgba(245, 158, 11, 0.06);
            border-left: 3px solid var(--status-amber);
            color: #fde047;
        }
        .callout.refusal {
            background: rgba(239, 68, 68, 0.06);
            border-left: 3px solid var(--status-red);
            color: #fca5a5;
        }

        /* SQL Editor Container */
        .sql-wrapper {
            background: var(--bg-base);
            border: 1px solid var(--border-subtle);
            border-radius: 8px;
            overflow: hidden;
        }
        .sql-topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 8px 12px;
            background: rgba(255, 255, 255, 0.02);
            border-bottom: 1px solid var(--border-subtle);
            font-family: var(--font-mono);
            font-size: 11px;
            color: var(--text-secondary);
        }
        .btn-copy {
            background: transparent;
            border: 1px solid var(--border-subtle);
            color: var(--text-secondary);
            cursor: pointer;
            font-size: 11px;
            padding: 3px 8px;
            border-radius: 4px;
            font-family: var(--font-sans);
            transition: all 0.15s ease;
        }
        .btn-copy:hover {
            background: var(--bg-elevated);
            color: #ffffff;
            border-color: var(--border-accent);
        }

        pre.sql-content {
            padding: 12px 14px;
            font-family: var(--font-mono);
            font-size: 12px;
            line-height: 1.6;
            color: #e2e8f0;
            overflow-x: auto;
            white-space: pre-wrap;
        }

        /* Results Data Grid */
        .grid-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 12px;
        }
        .grid-title {
            font-weight: 600;
            color: var(--text-primary);
            font-size: 12px;
            letter-spacing: -0.01em;
        }
        .grid-stats {
            color: var(--text-muted);
            font-family: var(--font-mono);
            font-size: 11px;
        }

        .data-grid-container {
            max-height: 300px;
            overflow: auto;
            border: 1px solid var(--border-subtle);
            border-radius: 6px;
            background: var(--bg-base);
        }

        table.results-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            text-align: left;
        }

        table.results-grid th {
            background: var(--bg-elevated);
            color: var(--text-secondary);
            font-weight: 600;
            padding: 8px 12px;
            position: sticky;
            top: 0;
            border-bottom: 1px solid var(--border-subtle);
            font-family: var(--font-mono);
            font-size: 11px;
        }

        table.results-grid td {
            padding: 8px 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.03);
            color: var(--text-primary);
            font-family: var(--font-mono);
            font-size: 12px;
        }

        table.results-grid tr:hover { background: rgba(255, 255, 255, 0.02); }

        /* Quick Suggestion Pills */
        .suggestions-bar {
            display: flex;
            flex-wrap: wrap;
            gap: 8px 6px;
            padding: 12px 20px;
            background: var(--bg-base);
            border-top: 1px solid var(--border-subtle);
            max-height: 160px;
            overflow-y: auto;
        }
        .suggestions-bar::-webkit-scrollbar { width: 4px; }
        .suggestions-bar::-webkit-scrollbar-thumb { background: var(--border-subtle); border-radius: 2px; }

        .sug-pill {
            white-space: normal;
            background: var(--bg-surface);
            border: 1px solid var(--border-subtle);
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            line-height: 1.35;
            color: var(--text-secondary);
            cursor: pointer;
            transition: all 0.15s ease;
        }
        .sug-pill:hover {
            background: var(--bg-elevated);
            border-color: var(--border-accent);
            color: #ffffff;
        }

        /* Search / Input Console */
        .input-bar {
            padding: 14px 20px 20px 20px;
            background: var(--bg-base);
            border-top: 1px solid var(--border-subtle);
        }

        .input-wrapper {
            display: flex;
            align-items: center;
            background: var(--bg-input);
            border: 1px solid var(--border-subtle);
            border-radius: 8px;
            padding: 4px 6px 4px 14px;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }
        .input-wrapper:focus-within {
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.15);
        }

        .input-wrapper input {
            flex: 1;
            background: transparent;
            border: none;
            outline: none;
            color: #ffffff;
            font-size: 14px;
            font-family: var(--font-sans);
            padding: 8px 0;
        }
        .input-wrapper input::placeholder {
            color: var(--text-muted);
        }

        .btn-submit {
            background: var(--accent-blue);
            border: none;
            color: #ffffff;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.15s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .btn-submit:hover { background: #2563eb; }
        .btn-submit:disabled { opacity: 0.5; cursor: not-allowed; }

        /* Loader Animation */
        .pulse-loader {
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 8px 0;
        }
        .pulse-loader span {
            width: 5px;
            height: 5px;
            background: var(--accent-blue);
            border-radius: 50%;
            animation: pulse 1.2s infinite ease-in-out both;
        }
        .pulse-loader span:nth-child(1) { animation-delay: -0.32s; }
        .pulse-loader span:nth-child(2) { animation-delay: -0.16s; }
        @keyframes pulse {
            0%, 80%, 100% { opacity: 0.2; transform: scale(0.8); }
            40% { opacity: 1; transform: scale(1.1); }
        }
    </style>
</head>
<body>

    <div class="workspace">
        <div class="chat-canvas" id="chatCanvas">
        </div>

        <div class="suggestions-bar">
            <div class="sug-pill" onclick="triggerQuery('What are the active distributors?')">Active distributors</div>
            <div class="sug-pill" onclick="triggerQuery('Show top 5 distributors by total revenue')">Top 5 distributors by revenue</div>
            <div class="sug-pill" onclick="triggerQuery('Show total revenue by zone, region, territory, distributor and product excluding returned sales')">Show revenue by Zone, Region, Territory, Distributor and Product (Complex 6-Table Join)</div>
            <div class="sug-pill" onclick="triggerQuery('Which MDO sales rep generated the highest total sales revenue?')">Highest performing sales rep (MDO)</div>
            <div class="sug-pill" onclick="triggerQuery('What are the top 3 product materials by total distributor revenue?')">Top 3 products by revenue</div>
            <div class="sug-pill" onclick="triggerQuery('Show total sales revenue grouped by Zone and Region, excluding returned sales')">Revenue by Zone and Region</div>
            <div class="sug-pill" onclick="triggerQuery('How many duplicate scan incidents occurred per distributor?')">Duplicate scan logs by distributor</div>
            <div class="sug-pill" onclick="triggerQuery('Which product lots have recorded warehouse returns?')">Warehouse returns by product lot</div>
            <div class="sug-pill" onclick="triggerQuery('Who is the best distributor?')">Best distributor (Ambiguous)</div>
            <div class="sug-pill" onclick="triggerQuery('Delete returned sales data')">Delete returned sales (Adversarial)</div>
            <div class="sug-pill" onclick="triggerQuery('Calculate distributor lifetime value (LTV)')">Calculate LTV (Out of scope)</div>
        </div>

        <div class="input-bar">
            <form id="queryForm" onsubmit="handleFormSubmit(event)">
                <div class="input-wrapper">
                    <input type="text" id="queryInput" placeholder="Ask a question about the database schema..." autocomplete="off">
                    <button type="submit" class="btn-submit" id="submitBtn">
                        <span>Send</span>
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        async function initHealth() {
            try {
                await fetch('/api/health');
            } catch (e) {
                console.error('Health request failed', e);
            }
        }
        initHealth();

        function triggerQuery(text) {
            document.getElementById('queryInput').value = text;
            handleFormSubmit(new Event('submit'));
        }

        async function handleFormSubmit(e) {
            e.preventDefault();
            const input = document.getElementById('queryInput');
            const question = input.value.trim();
            if (!question) return;

            input.value = '';
            renderUserMessage(question);

            const submitBtn = document.getElementById('submitBtn');
            submitBtn.disabled = true;

            const loaderId = renderLoader();

            try {
                const res = await fetch('/api/chat', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ question })
                });

                if (!res.ok) {
                    let errText = `Server returned status ${res.status}`;
                    try {
                        const errJson = await res.json();
                        if (errJson.detail) errText = errJson.detail;
                    } catch(e) {}
                    removeElement(loaderId);
                    renderAgentResponse({
                        refused: true,
                        note: `HTTP Error ${res.status}: ${errText}`,
                        sql: null,
                        is_safe: false,
                        execution: null,
                        total_duration_ms: 0
                    });
                    return;
                }

                const data = await res.json();
                removeElement(loaderId);
                renderAgentResponse(data);
            } catch (err) {
                removeElement(loaderId);
                renderAgentResponse({
                    refused: true,
                    note: `Network Error: ${err.message || 'Unable to reach backend server.'}`,
                    sql: null,
                    is_safe: false,
                    execution: null,
                    total_duration_ms: 0
                });
            } finally {
                submitBtn.disabled = false;
            }
        }

        function renderUserMessage(text) {
            const canvas = document.getElementById('chatCanvas');
            const div = document.createElement('div');
            div.className = 'msg-row user';
            div.innerHTML = `<div class="user-bubble">${sanitizeText(text)}</div>`;
            canvas.appendChild(div);
            canvas.scrollTop = canvas.scrollHeight;
        }

        function renderLoader() {
            const canvas = document.getElementById('chatCanvas');
            const id = 'loader-' + Date.now();
            const div = document.createElement('div');
            div.className = 'msg-row agent';
            div.id = id;
            div.innerHTML = `
                <div class="agent-container">
                    <div class="pipeline-header">
                        <div class="pipe-tag active">Executing LangGraph Agent pipeline...</div>
                    </div>
                    <div class="pulse-loader">
                        <span></span><span></span><span></span>
                    </div>
                </div>
            `;
            canvas.appendChild(div);
            canvas.scrollTop = canvas.scrollHeight;
            return id;
        }

        function removeElement(id) {
            const el = document.getElementById(id);
            if (el) el.remove();
        }

        function renderAgentResponse(data) {
            const canvas = document.getElementById('chatCanvas');
            const div = document.createElement('div');
            div.className = 'msg-row agent';

            let pipelineHtml = '';
            if (data.refused) {
                pipelineHtml = `
                    <div class="pipe-tag pass">Intent: Classified</div>
                    <div class="pipe-tag refused">Status: Refused</div>
                `;
            } else {
                pipelineHtml = `
                    <div class="pipe-tag pass">Intent: Classified</div>
                    <div class="pipe-tag pass">Schema: Context Loaded</div>
                    <div class="pipe-tag pass">SQL: Generated</div>
                    <div class="pipe-tag ${data.is_safe ? 'pass' : 'refused'}">Safety: ${data.is_safe ? 'Approved' : 'Blocked'}</div>
                    <div class="pipe-tag ${data.execution?.success ? 'pass' : 'refused'}">DB Execution: ${data.execution?.success ? 'Executed' : 'Failed'}</div>
                `;
            }

            let noteHtml = '';
            if (data.note) {
                const isRefusal = data.refused;
                noteHtml = `
                    <div class="callout ${isRefusal ? 'refusal' : 'info'}">
                        <div>${sanitizeText(data.note)}</div>
                    </div>
                `;
            }

            let sqlHtml = '';
            if (data.sql) {
                sqlHtml = `
                    <div class="sql-wrapper">
                        <div class="sql-topbar">
                            <span>Generated MySQL Query</span>
                            <button class="btn-copy" onclick="navigator.clipboard.writeText(\`${sanitizeJs(data.sql)}\`)">Copy Query</button>
                        </div>
                        <pre class="sql-content">${sanitizeText(data.sql)}</pre>
                    </div>
                `;
            }

            let gridHtml = '';
            if (data.execution) {
                const exec = data.execution;
                if (exec.success && exec.columns.length > 0) {
                    let ths = exec.columns.map(c => `<th>${sanitizeText(c)}</th>`).join('');
                    let trs = exec.rows.map(r => `<tr>${r.map(v => `<td>${sanitizeText(v ?? 'NULL')}</td>`).join('')}</tr>`).join('');

                    gridHtml = `
                        <div>
                            <div class="grid-header">
                                <span class="grid-title">Query Results</span>
                                <span class="grid-stats">${exec.row_count} row(s) returned • ${exec.duration_ms} ms</span>
                            </div>
                            <div class="data-grid-container">
                                <table class="results-grid">
                                    <thead><tr>${ths}</tr></thead>
                                    <tbody>${trs}</tbody>
                                </table>
                            </div>
                        </div>
                    `;
                } else if (!exec.success) {
                    gridHtml = `
                        <div class="callout refusal">
                            <div>Execution Error: ${sanitizeText(exec.error)}</div>
                        </div>
                    `;
                }
            }

            div.innerHTML = `
                <div class="agent-container">
                    <div class="pipeline-header">${pipelineHtml}</div>
                    ${noteHtml}
                    ${sqlHtml}
                    ${gridHtml}
                    <div style="display: flex; justify-content: flex-end; font-size: 11px; color: var(--text-muted); font-family: var(--font-mono); margin-top: 4px;">
                        Total duration: ${data.total_duration_ms} ms
                    </div>
                </div>
            `;

            canvas.appendChild(div);
            canvas.scrollTop = canvas.scrollHeight;
        }

        function sanitizeText(str) {
            if (typeof str !== 'string') return String(str);
            return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#039;");
        }

        function sanitizeJs(str) {
            return str.replace(/\\\\/g, '\\\\').replace(/`/g, '\\`').replace(/\\$/g, '\\$');
        }
    </script>
</body>
</html>
"""

