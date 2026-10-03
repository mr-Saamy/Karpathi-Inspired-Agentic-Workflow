# VSCodium & Open VS Code Agent Framework

Portable configuration, custom instructions, modes, and prompt library for VSCodium and VS Code open-source agent extensions (Cline, Roo-Code, Continue.dev).

## Features

- **Cline & Roo-Code Support**: Workspace rules (`.clinerules`) and custom modes (`.roomodes`) tuned for autonomous agent workflows.
- **Continue.dev Integration**: System instructions (`.continue/config.json`) and 13 prompt files (`.continue/prompts/*.prompt.md`).
- **Output Compression with RTK**: Integrated `rtk` rules for terminal output compression to optimize token context.
- **Cross-Platform Installer**: Safe POSIX Bash (`install.sh`) and PowerShell (`install.ps1`) installers with backup support.
- **13 Reusable Prompt Skills & Modes**: Complete feature parity across the universal skill catalog.

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

## Prompt Skills & Modes Library

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
- `hugo`: Hugo static site generation and template validation.
- `mdbook`: mdBook manuscript building.
- `quickshell`: Quickshell QML desktop shell development.

## Validation

Run validation runner:
```bash
./scripts/validate.sh
```
