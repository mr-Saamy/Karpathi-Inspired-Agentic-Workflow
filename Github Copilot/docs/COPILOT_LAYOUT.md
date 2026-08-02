# GitHub Copilot Configuration & Layout

## Discovery Roots & Configuration

GitHub Copilot in VS Code reads instructions, custom prompts, and workspace settings from specific paths:

| Purpose | Workspace Scope | Global / User Scope |
| :--- | :--- | :--- |
| **System Instructions** | `.github/copilot-instructions.md` | `~/.config/github-copilot/copilot-instructions.md` |
| **Custom Prompts** | `.github/prompts/*.prompt.md` | `~/.config/github-copilot/prompts/` |
| **Instruction Modules** | `.github/instructions/*.md` | `~/.config/github-copilot/instructions/` |
| **VS Code Settings** | `.vscode/settings.json` (`github.copilot.chat.codeGeneration.useInstructionFiles`) | User `settings.json` |

## Installation & Deployment Architecture

When `scripts/install.sh` (or `install.ps1`) is executed:
1. Pre-existing GitHub Copilot custom instructions are backed up under `~/.config/github-copilot/backups/copilot-ai-<timestamp>/`.
2. Workspace custom instructions (`.github/copilot-instructions.md`) are installed to `~/.config/github-copilot/copilot-instructions.md`.
3. All custom prompt files in `.github/prompts/` are linked/copied to `~/.config/github-copilot/prompts/`.
4. Domain instruction modules in `.github/instructions/` are linked/copied to `~/.config/github-copilot/instructions/`.
