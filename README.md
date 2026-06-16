# AGY3 PROXY
### *Official Engine Bridge & Execution Wrapper*

<div align="center">
<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&color=90CAF9&center=true&vCenter=true&width=600&lines=AGY3_PROXY+v0.3.1;READING_MASTER_AUTH...+[OK];ISOLATING_ENVIRONMENT...+[OK];MOTOR_READY" alt="Typing SVG" />
</div>

---

## 🧬 O Que é o AGY3?
O **AGY3 Proxy** é um consumidor modular do ecossistema. Ele não gerencia contas; ele simplesmente lê a conta ativa definida pelo **Gemini Auth** e executa o motor oficial com isolamento de ambiente e otimização de recursos.

## 🚀 Arquitetura de Operação

### 🛡️ Motor Oficial (Original Integrity)
Utiliza o binário original `/data/data/com.termux/files/usr/bin/gemini`, garantindo estabilidade e compatibilidade total com as atualizações do Google.

### 🔑 Consumo de Identidade (Master Slave)
O AGY3 é um "escravo" do **Gemini Auth**. Ele busca o email ativo em `~/.gemini-auth/google_accounts.json` antes de cada execução, garantindo que você nunca rode um script na conta errada.

### ⚡ Tunelamento de Ambiente
*   Remove variáveis de proxy globais que causam conflitos de rede.
*   Força `GEMINI_CLI_NO_RELAUNCH=true` para estabilidade.
*   Otimiza Node.js via `NODE_OPTIONS`.

---

## 🖥️ Comandos

*   **`agy3`**: Executa o agente oficial sob a proteção do proxy.
*   **`agy3 -stats`**: Exibe métricas de uso da conta ativa no Gemini Auth.

---

## 🛠️ Instalação

```bash
gh repo clone opassoca/agy-3-proxy
cd agy-3-proxy
./install.sh
```

---

## 👨‍💻 Créditos & Arquitetura

**Lead Architect:** [Paçoca (@opassoca)](https://github.com/opassoca)

<sub>Otimizado com rigor cirúrgico via **Gemini 3 Flash CLI** · PDK Environment</sub>
