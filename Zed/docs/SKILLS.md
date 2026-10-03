# Zed Custom Prompt Skills

This repository translates agent skills into Zed Editor prompt slash commands located under `.zed/prompts/`.

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

## Invoking Prompt Skills in Zed

In Zed Assistant panel:
Type `/` followed by the prompt name (e.g. `/ai-project-manager` or `/rust-cli`).
