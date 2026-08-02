# Antigravity IDE Agent Framework

Portable Antigravity IDE configuration, rules, workflow principles, and reusable skills library.

## Features

- **Native Antigravity Integration**: Optimized for Antigravity IDE tool calling (`replace_file_content`, `multi_replace_file_content`), Planning Mode artifacts (`implementation_plan.md`, `walkthrough.md`), Knowledge Items (KIs), and slash commands (`/goal`, `/grill-me`, `/learn`).
- **Clean Separation of Config & Runtime State**: Manages instructions, rules, profiles, and skills without cluttering git with private keys, credentials, SQLite state, or ephemeral session transcripts.
- **Output Compression with RTK**: Integrates selective `rtk` execution rules to maximize Gemini context efficiency.
- **Cross-Platform Installer**: Safe POSIX Bash (`install.sh`) and PowerShell (`install.ps1`) installers with automated config backups.
- **Comprehensive Skill Library**: 13 pre-configured, production-ready skills under `.agents/skills/`.

## Installation

### Linux / macOS

Preview changes with dry-run:
```bash
./scripts/install.sh --dry-run
```

Install to `~/.gemini/config/`:
```bash
./scripts/install.sh
```

### Windows (PowerShell)

Preview changes:
```powershell
.\scripts\install.ps1 -DryRun
```

Install:
```powershell
.\scripts\install.ps1
```

Existing configuration files are backed up automatically under `~/.gemini/config/backups/antigravity-ai-<timestamp>/`.

## Included Skills

- `$ai-project-manager`: Manage project requirements (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) and Planning Mode execution.
- `$axiom`: Senior OT/ICS Security Engineer & Consultant for threat modeling, CRA compliance, IEC 62443, and building secure Python and C/C++ embedded software tools.
- `$pr-readiness`: Final diff verification, linting, test validation, and PR readiness checks.
- `$bash-scripting`: Safe Bash/POSIX script creation and ShellCheck validation.
- `$linux-sysadmin`: Linux system diagnostics, systemd, and log analysis.
- `$python-ai`: Python AI app development using `uv` and model provider integration.
- `$rust-cli`: Cargo workflows and Rust CLI app design.
- `$homelab-admin`: Homelab network, NFS, reverse proxies, and infrastructure.
- `$forgejo-maintainer`: Forgejo and Gitea instance administration.
- `$podman-operator`: Podman containers, Quadlet units, and rootless setups.
- `$hugo`: Hugo static site generation and template validation.
- `$mdbook`: mdBook manuscript building and structure verification.
- `$quickshell`: Quickshell QML desktop shell configurations.

## Validation

Run the validation suite to verify syntax, skill definitions, and installer integrity:
```bash
./scripts/validate.sh
```

## Structure

- `AGENTS.md`: Repository maintenance rules.
- `SPEC.md`, `ROADMAP.md`, `TASKS.md`: Requirements, phase order, and validated task tracking.
- `antigravity-home/`: Managed global instructions, rules, and skill manifests.
- `.agents/skills/`: Reusable skills library.
- `docs/`: Deep-dive documentation (`ANTIGRAVITY_LAYOUT.md`, `SKILLS.md`, `WORKFLOW.md`, `PROMPT_GUIDE.md`).
- `scripts/`: Installers and validation runner.
