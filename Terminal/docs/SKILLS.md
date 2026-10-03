# Terminal / CLI Reusable Prompt Skills

This repository provides agent prompt files located under `prompts/`.

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

## Invoking Prompt Skills in CLI Tools

- In **Claude Code**: Reference prompt files in `prompts/` (e.g. `/prompts/rust-cli.prompt.md`).
- In **Aider**: Add prompt files via `/read prompts/<name>.prompt.md`.
- In **Avante.nvim**: Select custom prompts configured from `prompts/`.
