# antigravity-ai

Portable Antigravity IDE configuration, rules, workflow principles, and reusable skills.

## Features

- **Native Antigravity Integration**: Optimized for Antigravity IDE tool calling (`replace_file_content`, `multi_replace_file_content`), Planning Mode artifacts (`implementation_plan.md`, `walkthrough.md`), Knowledge Items (KIs), and slash commands (`/goal`, `/grill-me`, `/learn`).
- **Clean Separation of Config & Runtime State**: Manages instructions, rules, profiles, and skills without cluttering git with private keys, credentials, SQLite state, or ephemeral session transcripts.
- **Output Compression with RTK**: Integrates selective `rtk` execution rules to maximize Gemini 3.6 context efficiency.
- **Cross-Platform Installer**: Safe POSIX Bash (`install.sh`) and PowerShell (`install.ps1`) installers with automated config backups.
- **Comprehensive Skill Library**: 12 pre-configured, production-ready skills under `.agents/skills/`.

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

## Recommended CLI Tools

### RTK (Token / Output Compression)

Install `rtk` to filter noisy terminal command output:
```bash
cargo install --git https://github.com/rtk-ai/rtk
```

Ensure Cargo binaries are on your `PATH`:
```bash
export PATH="$HOME/.cargo/bin:$PATH"
```

Verify installation:
```bash
rtk --version
```

Antigravity will automatically use `rtk` when running build suites, test runs, or broad searches.

## AI Development Workflow

1. **Planning**: Ask Antigravity to plan major features. It will read `AGENTS.md` and KIs, then create `<appDataDir>/brain/<conversation-id>/implementation_plan.md`.
2. **Review & Approval**: Review the plan and approve execution.
3. **Incremental Execution**: Antigravity executes using native file editing tools.
4. **Verification & PR Readiness**: Run `$pr-readiness` to validate code changes and update task tracking.

For full workflow details, see [docs/WORKFLOW.md](docs/WORKFLOW.md) and [docs/PROMPT_GUIDE.md](docs/PROMPT_GUIDE.md).

## Validation

Run the validation suite to verify syntax, skill definitions, and installer integrity:
```bash
./scripts/validate.sh
```

## Repository Structure

- `AGENTS.md`: Repository maintenance rules.
- `SPEC.md`, `ROADMAP.md`, `TASKS.md`: Requirements, phase order, and validated task tracking.
- `antigravity-home/`: Managed global instructions, rules, and skill manifests.
- `.agents/skills/`: Reusable skills library.
- `docs/`: Deep-dive documentation (`ANTIGRAVITY_LAYOUT.md`, `SKILLS.md`, `WORKFLOW.md`, `PROMPT_GUIDE.md`).
- `scripts/`: Installers and validation runner.
