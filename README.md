# Universal AI Agent Framework

Portable, high-performance AI agent configuration, rules, workflows, and reusable skill libraries for **Antigravity IDE** and **VS Code with GitHub Copilot**.

---

## Overview

This repository provides an enterprise-ready, cross-IDE framework designed to give developer AI agents (such as Antigravity IDE and GitHub Copilot) structured workflows, empirical verification habits, token/output compression capabilities (`rtk`), and specialized skills.

### Supported IDE Environments

| IDE Target | Directory | Target Integrations |
| :--- | :--- | :--- |
| **Antigravity IDE** | [`Antigravity IDE/`](./Antigravity%20IDE) | Gemini 3.6 Flash / Pro, native tool calling (`replace_file_content`), Planning Mode (`implementation_plan.md`, `walkthrough.md`), Knowledge Items, `.agents/skills/` |
| **GitHub Copilot** | [`Github Copilot/`](./Github%20Copilot) | VS Code, Copilot Chat & Agent Mode, `.github/copilot-instructions.md`, prompt files (`.github/prompts/*.prompt.md`), `.github/instructions/` |

---

## Core Framework Principles

Across both IDE environments, the framework enforces uniform agent behavior:

1. **Working Code Only**: Plausibility is not correctness. Agents empirically verify code using build/test tools before reporting completion.
2. **Strict Verification**: No fabricated paths, commit hashes, or fake test results. Full logs and tracebacks are inspected before diagnosing failures.
3. **Planning & Implementation Workflows**: Non-trivial tasks require explicit implementation plans, clear review boundaries, and step-by-step execution.
4. **Token Compression with RTK**: Integrates `rtk` execution rules to compress noisy build logs, linter outputs, and test runs, maximizing LLM context efficiency.
5. **Clean Separation of Config & Runtime**: Configuration, rules, and skills are maintained cleanly without tracking credentials, databases, or temporary session logs.

---

## Quick Start & Installation

Choose the folder corresponding to your primary IDE and run the installer:

### Option A: Antigravity IDE

```bash
cd "Antigravity IDE"

# Preview installation
./scripts/install.sh --dry-run

# Install to ~/.gemini/config/
./scripts/install.sh
```

For Windows PowerShell:
```powershell
cd "Antigravity IDE"
.\scripts\install.ps1
```

For complete layout details, see [`Antigravity IDE/README.md`](./Antigravity%20IDE/README.md) and [`Antigravity IDE/docs/ANTIGRAVITY_LAYOUT.md`](./Antigravity%20IDE/docs/ANTIGRAVITY_LAYOUT.md).

---

### Option B: VS Code with GitHub Copilot

```bash
cd "Github Copilot"

# Preview installation
./scripts/install.sh --dry-run

# Install to ~/.config/github-copilot/
./scripts/install.sh
```

For Windows PowerShell:
```powershell
cd "Github Copilot"
.\scripts\install.ps1
```

For complete layout details, see [`Github Copilot/README.md`](./Github%20Copilot/README.md) and [`Github Copilot/docs/COPILOT_LAYOUT.md`](./Github%20Copilot/docs/COPILOT_LAYOUT.md).

---

## Included Skills Library

Both environments include 13 production-ready skill modules with full functional parity:

| Skill | Purpose | Antigravity IDE Path | GitHub Copilot Path |
| :--- | :--- | :--- | :--- |
| **`ai-project-manager`** | Requirements planning & task management | `.agents/skills/ai-project-manager/` | `.github/prompts/ai-project-manager.prompt.md` |
| **`axiom`** | OT/ICS security engineering & IEC 62443 / CRA | `.agents/skills/axiom/` | `.github/prompts/axiom.prompt.md` |
| **`pr-readiness`** | Diff verification & PR review readiness | `.agents/skills/pr-readiness/` | `.github/prompts/pr-readiness.prompt.md` |
| **`bash-scripting`** | POSIX Bash scripting & ShellCheck | `.agents/skills/bash-scripting/` | `.github/prompts/bash-scripting.prompt.md` |
| **`linux-sysadmin`** | Linux sysadmin, systemd & diagnostics | `.agents/skills/linux-sysadmin/` | `.github/prompts/linux-sysadmin.prompt.md` |
| **`python-ai`** | Python AI development & `uv` workflows | `.agents/skills/python-ai/` | `.github/prompts/python-ai.prompt.md` |
| **`rust-cli`** | Rust CLI engineering & Cargo | `.agents/skills/rust-cli/` | `.github/prompts/rust-cli.prompt.md` |
| **`homelab-admin`** | Homelab network, NFS & infrastructure | `.agents/skills/homelab-admin/` | `.github/prompts/homelab-admin.prompt.md` |
| **`forgejo-maintainer`** | Forgejo / Gitea server administration | `.agents/skills/forgejo-maintainer/` | `.github/prompts/forgejo-maintainer.prompt.md` |
| **`podman-operator`** | Rootless Podman & Quadlet units | `.agents/skills/podman-operator/` | `.github/prompts/podman-operator.prompt.md` |
| **`hugo`** | Hugo static site generation | `.agents/skills/hugo/` | `.github/prompts/hugo.prompt.md` |
| **`mdbook`** | mdBook documentation compilation | `.agents/skills/mdbook/` | `.github/prompts/mdbook.prompt.md` |
| **`quickshell`** | Quickshell QML desktop shell development | `.agents/skills/quickshell/` | `.github/prompts/quickshell.prompt.md` |

---

## Recommended Token Compression CLI: RTK

Install `rtk` to filter noisy terminal output and reduce context usage:

```bash
cargo install --git https://github.com/rtk-ai/rtk
export PATH="$HOME/.cargo/bin:$PATH"
rtk --version
```

---

## Validation

To validate both IDE configurations across the repository, run the global validation suite:

```bash
./scripts/validate-all.sh
```

---

## Repository Structure

```text
.
├── Antigravity IDE/         # Antigravity IDE configuration & skills
│   ├── AGENTS.md            # Maintenance instructions
│   ├── antigravity-home/    # Managed global rules and manifests
│   ├── .agents/skills/      # 13 Antigravity skills
│   ├── docs/                # Antigravity layout & prompt guides
│   └── scripts/             # Antigravity installers & validator
├── Github Copilot/          # GitHub Copilot configuration & prompts
│   ├── AGENTS.md            # Maintenance instructions
│   ├── .github/             # copilot-instructions.md & prompts/
│   ├── docs/                # Copilot layout & prompt guides
│   └── scripts/             # Copilot installers & validator
├── scripts/
│   └── validate-all.sh      # Repository-wide validation runner
├── README.md                # Unified multi-IDE documentation
├── SPEC.md                  # Project specification
├── ROADMAP.md               # Unified development roadmap
└── TASKS.md                 # Project task tracking
```
