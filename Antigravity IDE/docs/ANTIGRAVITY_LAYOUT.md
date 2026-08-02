# Antigravity Configuration & Layout

## Discovery Roots

Antigravity IDE discovers and loads instructions, skills, and configuration from specific customization roots:

| Purpose | Global Scope | Workspace Scope |
| :--- | :--- | :--- |
| **Instructions** | `~/.gemini/config/AGENTS.md` | `.agents/AGENTS.md` (root to working dir) |
| **Skills** | `~/.gemini/config/skills/` | `.agents/skills/` |
| **Skills Manifest** | `~/.gemini/config/skills.json` | `.agents/skills.json` |
| **Plugins** | `~/.gemini/config/plugins/` | - |
| **Knowledge Base** | `<appDataDir>/knowledge` | Workspace Knowledge Items |

## Why Runtime State is Kept Separate

The active runtime directory (`~/.gemini/antigravity-ide`) contains private, ephemeral data:
- Session logs & JSONL transcripts (`logs/`)
- SQLite conversation databases
- OAuth tokens and credentials
- Temporary scratch code (`scratch/`)
- Generated visual artifacts (`brain/`)

`antigravity-ai` manages **only** portable instruction files, reusable skills, execution rules, and installer scripts.

## Installation Architecture

When `scripts/install.sh` (or `install.ps1`) is executed:
1. Backups of pre-existing configurations are stored under `~/.gemini/config/backups/antigravity-ai-<timestamp>/`.
2. Global instructions (`antigravity-home/AGENTS.md`) are linked/installed to `~/.gemini/config/AGENTS.md`.
3. Default policy rules are linked to `~/.gemini/config/rules/`.
4. All reusable skills in `.agents/skills/` are symlinked to `~/.gemini/config/skills/`.
5. `~/.gemini/config/skills.json` is updated to register all active customization roots.
