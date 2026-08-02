# GitHub Copilot Agent Framework

Portable VS Code + GitHub Copilot custom instructions, prompt files, workflow principles, and reusable prompt skill library.

## Features

- **Native VS Code & Copilot Integration**: Custom workspace instructions (`.github/copilot-instructions.md`) and prompt files (`.github/prompts/*.prompt.md`) tuned for Copilot Chat and Agent Mode.
- **Output Compression with RTK**: Integrated `rtk` rules for terminal output compression to optimize token context.
- **Cross-Platform Installer**: Safe POSIX Bash (`install.sh`) and PowerShell (`install.ps1`) installers with configuration backup support.
- **13 Reusable Prompt Skills**: Complete feature parity with the Antigravity skill library.

## Installation

### Linux / macOS

Preview installation:
```bash
./scripts/install.sh --dry-run
```

Install:
```bash
./scripts/install.sh
```

### Windows (PowerShell)

Preview installation:
```powershell
.\scripts\install.ps1 -DryRun
```

Install:
```powershell
.\scripts\install.ps1
```

## Prompt Skills Library

- `ai-project-manager`: Requirements planning and task tracking.
- `axiom`: OT/ICS security engineering and compliance.
- `pr-readiness`: Diff verification and pull-request readiness.
- `bash-scripting`: Shell script design and ShellCheck validation.
- `linux-sysadmin`: System diagnostics and service management.
- `python-ai`: Python AI engineering with `uv`.
- `rust-cli`: Rust CLI development with Cargo.
- `homelab-admin`: Infrastructure administration and networking.
- `forgejo-maintainer`: Forgejo / Gitea instance administration.
- `podman-operator`: Rootless Podman and Quadlet operations.
- `hugo`: Hugo static site creation and validation.
- `mdbook`: mdBook manuscript building.
- `quickshell`: Quickshell QML desktop shell development.

## Validation

Run validation runner:
```bash
./scripts/validate.sh
```
