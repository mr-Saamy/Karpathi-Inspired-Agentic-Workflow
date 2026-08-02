# Specification: antigravity-ai

## Overview

`antigravity-ai` is a portable configuration, instruction rules, and skills hub tailored for **Antigravity IDE**. It brings the engineering rigor, cross-platform installer, validation scripts, and clean separation of config vs. runtime state from `titus-ai`, while optimizing for Antigravity's native agent capabilities:
- Native tool execution (`replace_file_content`, `multi_replace_file_content`, `view_file`, `write_to_file`, `grep_search`, `ask_question`, `ask_permission`, `browser_subagent`, `read_url_content`, `search_web`, `manage_task`, `schedule`).
- Antigravity Planning Mode artifacts (`implementation_plan.md`, `walkthrough.md`) and slash commands (`/goal`, `/schedule`, `/grill-me`, `/learn`).
- Knowledge Items (KI) discovery and utilization.
- Output compression via `rtk`.

## Scope & Boundaries

### Managed Artifacts
- Global instructions linked to `~/.gemini/config/AGENTS.md` (or `%USERPROFILE%\.gemini\config\AGENTS.md`).
- Reusable skills linked to `~/.gemini/config/skills/` (and `.agents/skills/`).
- Registered skills via `~/.gemini/config/skills.json`.
- Default execution policy rules.

### Excluded (Unmanaged Runtime State)
- API credentials, OAuth tokens, session histories, binary caches, database files (`*.sqlite`), transcripts, and local scratch files.

## Acceptance Criteria

1. **Native Compatibility**: Instructions and skills use valid Antigravity tool contracts and artifact paths.
2. **Cross-Platform Installer**: `install.sh` (Linux/macOS) and `install.ps1` (Windows) support dry-run, backup creation, and link target verification without data loss.
3. **Automated Validation**: `validate.sh` checks Bash & PowerShell syntax, YAML frontmatter on all skills, and documentation alignment.
4. **Documentation**: Clear guide for users to maximize productivity with Antigravity AI.
