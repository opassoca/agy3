#!/bin/bash
set -e
echo "◈ AGY3 Proxy - Standalone Consumer Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$PROJECT_DIR")"

# 1. Dependency: Master Auth Panel
if [ ! -d "$HOME/.gemini-auth" ]; then
    echo "[!] Master state (~/.gemini-auth) not found."
    echo "[*] Attempting to install 'gemini-auth' dependency..."
    
    # Se estivermos no ecosystem-pdk, o auth está ao lado
    if [ -d "$PARENT_DIR/auth" ]; then
        echo "[✓] Found local dependency in $PARENT_DIR/auth. Installing..."
        cd "$PARENT_DIR/auth" && ./install.sh
        cd "$PROJECT_DIR"
    else
        echo "[*] Downloading 'gemini-auth' from GitHub..."
        mkdir -p "$HOME/projects/ecosystem-pdk"
        gh repo clone opassoca/gemini-auth "$HOME/projects/ecosystem-pdk/auth"
        cd "$HOME/projects/ecosystem-pdk/auth" && ./install.sh
        cd "$PROJECT_DIR"
    fi
fi

mkdir -p "$BIN_DIR"

# 2. Create entry point for agy3
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
