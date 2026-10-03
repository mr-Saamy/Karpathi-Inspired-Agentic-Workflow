# Zed Configuration & Layout

## Discovery Roots & Configuration

Zed Editor reads workspace and user assistant configuration and custom prompts from specific paths:

| Purpose | Workspace Scope | Global / User Scope (Linux) | Global / User Scope (macOS) |
| :--- | :--- | :--- | :--- |
| **Assistant Settings** | `.zed/settings.json` | `~/.config/zed/settings.json` | `~/Library/Application Support/Zed/settings.json` |
| **System Instructions** | `.zed/assistant-instructions.md` | `~/.config/zed/assistant-instructions.md` | `~/Library/Application Support/Zed/assistant-instructions.md` |
| **Custom Prompts** | `.zed/prompts/*.prompt.md` | `~/.config/zed/prompts/` | `~/Library/Application Support/Zed/prompts/` |

## Installation & Deployment Architecture

When `scripts/install.sh` (or `install.ps1`) is executed:
1. Pre-existing Zed assistant configuration is backed up under `~/.config/zed/backups/zed-ai-<timestamp>/` (or OS equivalent).
2. Workspace assistant instructions (`.zed/assistant-instructions.md`) and settings (`.zed/settings.json`) are linked or copied to the global config directory.
3. All custom prompt files in `.zed/prompts/` are linked or copied to the global `prompts/` directory.
