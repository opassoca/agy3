#!/bin/bash
set -e
echo "◈ Antigravity Proxy (agy3) Installer ◈"

BIN_DIR="$HOME/bin"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Commands
cat <<EOW > "$BIN_DIR/agy3"
#!/data/data/com.termux/files/usr/bin/python3
import os
import sys
script_path = "$PROJECT_DIR/antigravity-proxy.py"
os.execv(sys.executable, [sys.executable, script_path] + sys.argv[1:])
EOW
chmod +x "$BIN_DIR/agy3"
ln -sf "$BIN_DIR/agy3" "$BIN_DIR/proxy"
ln -sf "$BIN_DIR/agy3" "$HOME/agy3"

echo "[✓] Antigravity Proxy (agy3) installed."
echo "[*] Commands: agy3, proxy"
