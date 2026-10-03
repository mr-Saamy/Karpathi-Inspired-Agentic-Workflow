# VSCodium & Open VS Code Configuration & Layout

## Discovery Roots & Configuration

Open-source agent extensions in VSCodium / VS Code discover instructions, custom modes, and prompt files from specific paths:

| Extension / Tool | Workspace Scope | Global / User Scope |
| :--- | :--- | :--- |
| **Cline** | `.clinerules` | `~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/` |
| **Roo-Code** | `.roomodes` | `~/.config/Code/User/globalStorage/rooveterinaryinc.roo-cline/settings/` |
| **Continue.dev** | `.continue/config.json`, `.continue/prompts/*.prompt.md` | `~/.continue/config.json`, `~/.continue/prompts/` |

## Installation & Deployment Architecture

When `scripts/install.sh` (or `install.ps1`) is executed:
1. Pre-existing user configurations are backed up under `~/.continue/backups/vscodium-ai-<timestamp>/`.
2. Workspace rules (`.clinerules`) and modes (`.roomodes`) are deployed to the workspace root.
3. Continue configuration (`.continue/config.json`) and prompt library (`.continue/prompts/`) are linked or copied to `~/.continue/`.
