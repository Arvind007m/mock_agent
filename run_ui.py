"""
run_ui.py — Launcher for the Kezzler Text-to-SQL Agent Web UI.
Run with: python run_ui.py
"""
import uvicorn
import os

if __name__ == "__main__":
    host = os.environ.get("HOST", "127.0.0.1")
    port = int(os.environ.get("PORT", "8000"))
    print(f"Starting Kezzler Agent Web Interface at http://{host}:{port}")
    uvicorn.run("web.app:app", host=host, port=port, reload=False)
