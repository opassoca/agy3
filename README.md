# 🪐 AGY3 PROXY - Neural Bridge 🪐
### *O Túnel Inteligente para o Motor Oficial Gemini CLI*

<div align="center">
<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&color=90CAF9&center=true&vCenter=true&width=600&lines=AGY3_PROXY+v3.0;TUNNELING_OFFICIAL_ENGINE...+[OK];SYNCING_GEMINI_AUTH...+[OK];SYSTEM_READY" alt="Typing SVG" />
</div>

---

## 🧬 O Que é o AGY3?
O **AGY3 Proxy** é a ponte neural que permite usar o **Motor Oficial do Gemini CLI** sob o isolamento e a inteligência do ecossistema Paçoca. Ele atua como um wrapper cirúrgico que intercepta as chamadas, gerencia identidades via **Gemini-Auth** e garante que a CLI oficial rode sem "leaks" de ambiente ou conflitos de rede.

## 🚀 Arquitetura de Operação

### 🛡️ Motor Oficial (Original Integrity)
Diferente de forks modificados, o AGY3 utiliza o binário oficial `/data/data/com.termux/files/usr/bin/gemini`. Isso garante 100% de compatibilidade com as atualizações do Google enquanto mantemos o controle total do ambiente.

### 🔑 Integração Gemini-Auth
O proxy sincroniza automaticamente as identidades em tempo real:
*   **Source:** `~/.gemini/oauth_creds.json`
*   **Registry:** Pool de tokens em `~/.gemini-auth/id-tokens/`
*   **Orchestration:** Sincronização bidirecional via `sync.py`.

### ⚡ Tunelamento e Isolamento
*   Remove variáveis globais redundantes que causam erros de TLS.
*   Configura `GEMINI_CLI_NO_RELAUNCH=true` para evitar loops de execução.
*   Otimiza a memória do Node.js (`max-old-space-size=4096`).

---

## 🖥️ Comandos do Ecossistema

*   **`agy`**: O binário nativo (ELF aarch64) otimizado para despacho rápido.
*   **`agy3`**: O wrapper Python para gestão avançada de cotas e seleção de modelos.
*   **`auth`**: Painel TUI (Terminal User Interface) para alternância instantânea de contas.
*   **`oauth`**: Daemon de sincronização de tokens em background.

---

## 🛠️ Instalação

O AGY3 faz parte do **Ecosystem PDK**. Para instalar ou atualizar:

```bash
# Clone e instale via wrapper oficial
gh repo clone opassoca/agy-3-proxy
cd agy-3-proxy
./install.sh
```

---

## 👨‍💻 Créditos & Arquitetura

**Lead Architect:** [Paçoca (@opassoca)](https://github.com/opassoca)

> *"Surgicality is not just an option, it is the only way to maintain the integrity of the machine."*

<sub>Otimizado com rigor cirúrgico via **Gemini 3 Flash CLI** · PDK Environment</sub>
