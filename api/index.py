"""
index.py — Vercel Serverless Function entrypoint for FastAPI app.
"""
import os
import sys

# Ensure root directory is in sys.path
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if ROOT_DIR not in sys.path:
    sys.path.insert(0, ROOT_DIR)

from web.app import app

# Export ASGI handler for Vercel
handler = app
