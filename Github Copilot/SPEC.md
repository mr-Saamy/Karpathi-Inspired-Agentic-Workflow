# GitHub Copilot Specification

## Goal
Provide a production-grade, portable GitHub Copilot configuration and prompt library tuned for VS Code with agentic principles (planning workflows, strict empirical verification, RTK output compression, and skill parity).

## Components
1. Master system prompt: `.github/copilot-instructions.md`
2. Custom prompt library: 13 prompt files in `.github/prompts/*.prompt.md`
3. Domain instruction modules: `.github/instructions/*.md`
4. Automated installers: `scripts/install.sh` and `scripts/install.ps1`
5. Documentation suite: `docs/` (`COPILOT_LAYOUT.md`, `SKILLS.md`, `WORKFLOW.md`, `PROMPT_GUIDE.md`)
