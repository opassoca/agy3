#!/bin/bash
set -e
echo "◈ Antigravity Bridge Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Commands
cat <<EOW > "$BIN_DIR/antigravity-proxy"
#!/data/data/com.termux/files/usr/bin/python3
import os
import sys
script_path = "$PROJECT_DIR/antigravity-proxy.py"
os.execv(sys.executable, [sys.executable, script_path] + sys.argv[1:])
EOW
chmod +x "$BIN_DIR/antigravity-proxy"
ln -sf "$BIN_DIR/antigravity-proxy" "$BIN_DIR/agy3"

echo "[✓] Antigravity Bridge installed."
echo "[*] Commands: antigravity-proxy, agy3"
