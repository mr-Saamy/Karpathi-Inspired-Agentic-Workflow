# Unified AI Agent Repository Specification

## Purpose
A dual-IDE framework hosting portable AI agent configurations, custom instructions, rules, skills, and installation tools for **Antigravity IDE** and **VS Code with GitHub Copilot**.

## Architectural Requirements
1. `Antigravity IDE/`: Contains native Antigravity IDE configuration, rules, skill manifests, `.agents/skills/` library, installers, and layout documentation.
2. `Github Copilot/`: Contains GitHub Copilot workspace custom instructions (`.github/copilot-instructions.md`), prompt skills library (`.github/prompts/*.prompt.md`), domain instruction modules (`.github/instructions/`), installers, and layout documentation.
3. Top-Level Directory: Contains unified `README.md`, tracking documents (`SPEC.md`, `ROADMAP.md`, `TASKS.md`), and global validation scripts (`scripts/validate-all.sh`).
