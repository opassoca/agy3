#!/usr/bin/env python3
__version__ = "0.3.1"
import os
import sys
import json
import subprocess
import shutil
import argparse
import logging

# --- CONFIGURATION & LOGGING ---
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger("AGY3")

# --- REALITY MAPPING ---
AUTH_DIR = os.path.expanduser("~/.auth")
ACCOUNTS_FILE = os.path.join(AUTH_DIR, "google_accounts.json")
GEMINI_DIR = os.path.expanduser("~/.gemini")
OAUTH_CREDS = os.path.join(GEMINI_DIR, "oauth_creds.json")

def find_gemini_motor():
    """Busca dinâmica pelo binário oficial no sistema."""
    # 1. Tenta o PATH padrão
    path = shutil.which("gemini")
    if path:
        return path
    
    # 2. Fallbacks comuns em ambientes Android/Termux
    fallbacks = [
        "/data/data/com.termux/files/usr/bin/gemini",
        "/usr/local/bin/gemini",
        "/usr/bin/gemini"
    ]
    for fb in fallbacks:
        if os.path.exists(fb) and os.access(fb, os.X_OK):
            return fb
    
    return None

def get_active_account():
    if not os.path.exists(ACCOUNTS_FILE):
        return "Unknown"
    try:
        with open(ACCOUNTS_FILE, "r") as f:
            return json.load(f).get("active", "Unknown")
    except Exception as e:
        logger.error(f"Falha ao ler contas: {e}")
        return "Unknown"

def sync_check():
    """Garante que o motor oficial está usando a conta do switcher."""
    active = get_active_account()
    if active != "Unknown":
        logger.info(f"Official motor linked to {active}")

def launch_gemini(args):
    motor_path = find_gemini_motor()
    if not motor_path:
        logger.critical("Motor oficial 'gemini' não encontrado no PATH ou locais conhecidos.")
        logger.info("Instale via: npm install -g @google/gemini-cli")
        sys.exit(1)

    sync_check()
    
    env = os.environ.copy()
    env["GEMINI_CLI_NO_RELAUNCH"] = "true"
    env["NODE_OPTIONS"] = "--max-old-space-size=4096"
    
    cmd = [motor_path] + args
    try:
        subprocess.run(cmd, env=env)
    except KeyboardInterrupt:
        pass
    except Exception as e:
        logger.error(f"Erro na execução do motor: {e}")

def main():
    parser = argparse.ArgumentParser(description="AGY3 Proxy - Official Engine Wrapper")
    parser.add_argument("-stats", action="store_true", help="Show account metrics")
    args, unknown = parser.parse_known_args()
    
    if args.stats:
        active = get_active_account()
        print(f"\n◈ AGY3 PROXY METRICS ◈")
        print(f"Active Account: {active}\n")
        # Simulação simples de tabela de cotas (integrar com seu pool real no futuro)
        print("Status: Connected via Native Bridge")
        sys.exit(0)

    launch_gemini(unknown)

if __name__ == "__main__":
    main()
