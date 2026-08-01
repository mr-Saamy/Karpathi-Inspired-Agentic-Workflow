# Repository Skills Index

The following skills are managed under `.agents/skills/` and automatically loaded by Antigravity IDE:

## Repository skills
- `ai-project-manager`
- `bash-scripting`
- `forgejo-maintainer`
- `homelab-admin`
- `hugo`
- `linux-sysadmin`
- `mdbook`
- `podman-operator`
- `pr-readiness`
- `python-ai`
- `quickshell`
- `rust-cli`

## Skill Anatomy

Every skill is a self-contained directory under `.agents/skills/<skill-name>/` containing:
1. `SKILL.md`: Required markdown file with YAML frontmatter (`name`, `description`).
2. `assets/` or `references/` (optional): Supporting templates, scripts, or reference docs.

## Invocation

Antigravity auto-selects skills based on the user's intent matching the skill's `description`. You can also trigger skills explicitly in prompts or via subagents.
