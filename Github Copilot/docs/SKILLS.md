# GitHub Copilot Prompt Skills

This repository translates agent skills into VS Code GitHub Copilot prompt files located under `.github/prompts/`.

## Available Prompt Skills

- `ai-project-manager`: Manage project requirements (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) and implementation planning.
- `axiom`: OT/ICS security engineering, IEC 62443, MITRE EMB3D, CRA compliance, threat modeling, and embedded C/C++/Python code.
- `pr-readiness`: Final diff verification, linting, test validation, and PR readiness checks.
- `bash-scripting`: Safe Bash/POSIX script creation and ShellCheck validation.
- `linux-sysadmin`: Linux system diagnostics, systemd, and log analysis.
- `python-ai`: Python AI app development using `uv` and model provider integration.
- `rust-cli`: Cargo workflows and Rust CLI app design.
- `homelab-admin`: Homelab network, NFS, reverse proxies, and infrastructure.
- `forgejo-maintainer`: Forgejo and Gitea instance administration.
- `podman-operator`: Podman containers, Quadlet units, and rootless setups.
- `hugo`: Hugo static site generation and template validation.
- `mdbook`: mdBook manuscript building and structure verification.
- `quickshell`: Quickshell QML desktop shell configurations.

## Invoking Prompt Skills in VS Code

In GitHub Copilot Chat:
```text
/prompt ai-project-manager
```
or reference `@workspace` with prompt files loaded in `.github/prompts/`.
