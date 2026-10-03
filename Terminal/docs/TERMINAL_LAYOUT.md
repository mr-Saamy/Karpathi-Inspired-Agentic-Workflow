# Terminal & CLI Configuration & Layout

## Discovery Roots & Configuration

Terminal and CLI coding agents discover instructions, configuration, and prompt files from specific paths:

| Tool | Workspace Scope | Global / User Scope |
| :--- | :--- | :--- |
| **Claude Code CLI** | `CLAUDE.md` | `~/.claude.json` |
| **Aider** | `.aider.conf.yml`, `.aider.prompt.md` | `~/.aider.conf.yml` |
| **Neovim / Avante** | `.avante/templates/` | `~/.config/nvim/` |
| **Prompt Library** | `prompts/*.prompt.md` | `~/.config/agent-prompts/` |

## Installation & Deployment Architecture

When `scripts/install.sh` (or `install.ps1`) is executed:
1. Pre-existing user configurations are backed up under `~/.config/terminal-ai/backups/terminal-ai-<timestamp>/`.
2. Workspace instructions (`CLAUDE.md`, `.aider.conf.yml`, `.aider.prompt.md`) are installed.
3. Prompt files in `prompts/` are linked or copied to `~/.config/terminal-ai/prompts/`.
