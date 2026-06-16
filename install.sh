#!/bin/bash
set -e
echo "◈ Agy3 - Standalone Consumer Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$PROJECT_DIR")"

# 1. Dependency: Auth Panel
if [ ! -d "$HOME/.auth" ]; then
    echo "[!] Master state (~/.auth) not found."
    if [ -d "$PARENT_DIR/auth" ]; then
        cd "$PARENT_DIR/auth" && ./install.sh
        cd "$PROJECT_DIR"
    else
        gh repo clone opassoca/auth "$HOME/projects/pdk/auth"
        cd "$HOME/projects/pdk/auth" && ./install.sh
        cd "$PROJECT_DIR"
    fi
fi

mkdir -p "$BIN_DIR"

# 2. Entry Point
cat <<EOF > "$BIN_DIR/agy3"
#!$(which python3)
import os
import sys
script_path = "$PROJECT_DIR/agy3.py"
os.execv(sys.executable, [sys.executable, script_path] + sys.argv[1:])
EOF
chmod +x "$BIN_DIR/agy3"
chmod +x "$PROJECT_DIR/agy3.py"

echo "[*] Agy3 installation complete."
echo "[*] Command: agy3"
