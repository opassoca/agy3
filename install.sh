#!/bin/bash
set -e
echo "◈ AGY3 Proxy - Standalone Consumer Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Sanity Check for Gemini Auth
if [ ! -d "$HOME/.gemini-auth" ]; then
    echo "[!] Warning: Master state (~/.gemini-auth) not found."
    echo "[*] Install 'gemini-auth' first to manage accounts."
fi

mkdir -p "$BIN_DIR"

# 2. Create entry point
cat <<EOF > "$BIN_DIR/agy3"
#!$(which python3)
import os
import sys
script_path = "$PROJECT_DIR/agy3.py"
os.execv(sys.executable, [sys.executable, script_path] + sys.argv[1:])
EOF
chmod +x "$BIN_DIR/agy3"
chmod +x "$PROJECT_DIR/agy3.py"

echo "[*] AGY3 Proxy installation complete."
echo "[*] Launch official engine via: agy3"
