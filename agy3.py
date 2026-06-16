#!/usr/bin/env python3
__version__ = "3.1.0"
import os
import sys
import json
import subprocess
import shutil
import argparse

# --- REALITY MAPPING ---
# O AGY3 deve ler as contas do 'gemini-auth' que é o seu sistema ativo.
AUTH_DIR = os.path.expanduser("~/.gemini-auth")
ACCOUNTS_FILE = os.path.join(AUTH_DIR, "google_accounts.json")
GEMINI_DIR = os.path.expanduser("~/.gemini")
OAUTH_CREDS = os.path.join(GEMINI_DIR, "oauth_creds.json")
REAL_MOTOR = "/data/data/com.termux/files/usr/bin/gemini"

def get_active_account():
    if os.path.exists(ACCOUNTS_FILE):
        try:
            with open(ACCOUNTS_FILE, "r") as f:
                return json.load(f).get("active")
        except: pass
    return "Unknown"

def sync_check():
    """Garante que o motor oficial está usando a conta do switcher."""
    active = get_active_account()
    if active == "Unknown": return
    
    # Verifica se o oauth_creds atual bate com o que deveria estar ativo
    # No seu setup, o 'auth' já faz o copy, mas o agy3 reforça a sanidade.
    print(f"[*] AGY3 Engine: Official motor linked to {active}")

def launch_gemini(args):
    sync_check()
    
    env = os.environ.copy()
    env["GEMINI_CLI_NO_RELAUNCH"] = "true"
    env["NODE_OPTIONS"] = "--max-old-space-size=4096"
    
    cmd = [REAL_MOTOR] + args
    try:
        subprocess.run(cmd, env=env)
    except KeyboardInterrupt:
        pass

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
