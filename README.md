# Universal AI Agent Framework

Portable, high-performance AI agent configuration, rules, workflows, and reusable skill libraries for **Antigravity IDE**, **VS Code with GitHub Copilot**, **Zed Editor**, **VSCodium / Open VS Code**, and **Terminal / CLI Agents**. Based on [ChrisTitusTech's AI Workflow](https://github.com/ChrisTitusTech/titus-ai) and Andrej Karpathy's agentic principles.

---

## Overview

This repository provides an enterprise-ready, cross-environment framework designed to give developer AI agents structured workflows, empirical verification habits, token/output compression capabilities (`rtk`), and 13 specialized domain skills.

### Supported Environments

| Target Environment | Directory | Target Integrations & Scope |
| :--- | :--- | :--- |
| **Antigravity IDE** | [`Antigravity IDE/`](./Antigravity%20IDE) | Gemini 3.6/3.8 Flash & Pro, native tool calling, Planning Mode (`implementation_plan.md`, `walkthrough.md`), Knowledge Items, `.agents/skills/` |
| **GitHub Copilot** | [`Github Copilot/`](./Github%20Copilot) | VS Code, Copilot Chat & Agent Mode, `.github/copilot-instructions.md`, prompt files (`.github/prompts/*.prompt.md`), `.github/instructions/` |
| **Zed Editor** | [`Zed/`](./Zed) | Zed Assistant, assistant settings (`.zed/settings.json`), prompt slash commands (`.zed/prompts/*.prompt.md`), Context Servers (MCP) |
| **VSCodium / Open VS Code** | [`VSCodium/`](./VSCodium) | Cline (`.clinerules`), Roo-Code (`.roomodes`), Continue.dev (`.continue/config.json`, `.continue/prompts/*.prompt.md`) |
| **Terminal / CLI / Neovim** | [`Terminal/`](./Terminal) | Claude Code CLI (`CLAUDE.md`), Aider (`.aider.conf.yml`, `.aider.prompt.md`), Neovim Avante (`.avante/templates/`), `prompts/` |

---

## Core Framework Principles

Across all environments, the framework strictly enforces:

1. **Working Code Only**: Plausibility is not correctness. Agents empirically verify code using build/test tools before reporting completion.
2. **Strict Verification**: No fabricated paths, commit hashes, or fake test results. Full logs and tracebacks are inspected before diagnosing failures.
3. **Planning & Implementation Workflows**: Non-trivial tasks require explicit implementation plans, clear review boundaries, and step-by-step execution.
4. **Token Compression with RTK**: Integrates `rtk` execution rules to compress noisy build logs, linter outputs, and test runs, maximizing LLM context efficiency.
5. **Clean Separation of Config & Runtime**: Configuration, rules, and skills are maintained cleanly without tracking credentials, databases, or temporary session logs.

---

## Quick Start & Installation

Install for a specific environment or all environments using the unified installer:

### Linux / macOS

```bash
# Preview installation for all targets
./scripts/install.sh --dry-run

# Install a specific environment
./scripts/install.sh --target antigravity
./scripts/install.sh --target copilot
./scripts/install.sh --target zed
./scripts/install.sh --target vscodium
./scripts/install.sh --target terminal

# Or install all environments
./scripts/install.sh --target all
```

### Windows (PowerShell)

```powershell
# Preview installation
.\scripts\install.ps1 -DryRun

# Install a specific environment
.\scripts\install.ps1 -Target zed
.\scripts\install.ps1 -Target copilot
.\scripts\install.ps1 -Target all
```

---

## Included Skills Library

All 5 environments maintain 100% parity across 13 production-ready skill modules:

| Skill | Purpose | Antigravity IDE | GitHub Copilot | Zed Editor | VSCodium | Terminal / CLI |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **`ai-project-manager`** | Requirements planning & task management | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`axiom`** | OT/ICS security & IEC 62443 / CRA | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`pr-readiness`** | Diff verification & PR review readiness | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`bash-scripting`** | POSIX Bash scripting & ShellCheck | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`linux-sysadmin`** | Linux sysadmin, systemd & diagnostics | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`python-ai`** | Python AI development & `uv` workflows | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`rust-cli`** | Rust CLI engineering & Cargo | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`homelab-admin`** | Homelab network, NFS & infrastructure | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`forgejo-maintainer`** | Forgejo / Gitea server administration | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`podman-operator`** | Rootless Podman & Quadlet units | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`hugo`** | Hugo static site generation | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`mdbook`** | mdBook documentation compilation | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |
| **`quickshell`** | Quickshell QML desktop shell development | `.agents/skills/` | `.github/prompts/` | `.zed/prompts/` | `.continue/prompts/` | `prompts/` |

---

## Token Compression CLI: RTK

Install `rtk` to filter noisy terminal output and reduce context usage:

```bash
cargo install --git https://github.com/rtk-ai/rtk
export PATH="$HOME/.cargo/bin:$PATH"
rtk --version
```

---

## Validation & Verification

Run the comprehensive multi-environment validation suite:

```bash
./scripts/validate-all.sh
```

---

## Repository Structure

```text
.
├── Antigravity IDE/         # Antigravity IDE configuration & skills
├── Github Copilot/          # GitHub Copilot configuration & prompts
├── Zed/                     # Zed Editor assistant settings & slash prompts
├── VSCodium/                # VSCodium rules, Roo-Code modes & Continue prompts
├── Terminal/                # Claude Code CLI, Aider, and Neovim templates
├── scripts/
│   ├── install.sh           # Unified multi-target installer (Linux/macOS)
│   ├── install.ps1          # Unified multi-target installer (Windows)
│   ├── test-skill-parity.sh # 100% skill parity verification test
│   ├── validate-all.sh      # Full multi-environment validation suite
│   └── validate.sh          # Legacy root validation wrapper
├── README.md                # Unified multi-environment documentation
├── Report.md                # Comprehensive repository analysis report
├── SPEC.md                  # Universal multi-environment specification
├── ROADMAP.md               # Phased development roadmap
└── TASKS.md                 # Project task tracking
```
