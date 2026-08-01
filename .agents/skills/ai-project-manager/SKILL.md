---
name: ai-project-manager
description: Turn repository planning docs into actionable AI-agent implementation plans using AGENTS.md, SPEC.md, ROADMAP.md, TASKS.md, Antigravity Planning Mode, approval checkpoints, validation, and incremental execution. Use when Antigravity is asked to plan a project, create or reconcile project docs, derive tasks, coordinate phases, update task status, or manage an AI-assisted development workflow.
---

# ai-project-manager

## Workflow

1. **Context & Discovery**:
   - Inspect repository instructions (`AGENTS.md`), current changes (`git status`), active branch, and relevant Knowledge Items (KIs) in `<appDataDir>/knowledge`.
   - Locate planning documents (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) at repository root or under `docs/`.

2. **Analysis & Clarification**:
   - Identify missing requirements, unresolved decisions, dependencies, and risks.
   - Use interactive feedback or `/grill-me` if key design choices are ambiguous.

3. **Planning & Artifact Creation**:
   - Create technical implementation plans in `<appDataDir>/brain/<conversation-id>/implementation_plan.md` using Antigravity Planning Mode.
   - Set `request_feedback = true` and `user_facing = true` on the plan artifact.
   - Define clear acceptance criteria, automated tests, manual verification, and pause checkpoints.

4. **Approval & Incremental Execution**:
   - Stop and wait for user approval on the implementation plan before writing code.
   - Execute one reviewable phase at a time using native file editing tools (`replace_file_content`, `multi_replace_file_content`, `write_to_file`).

5. **Validation & Walkthrough**:
   - Run verification commands (using `rtk` where output is large).
   - Create or update `<appDataDir>/brain/<conversation-id>/walkthrough.md` with test evidence and summary of changes.
   - Update `TASKS.md` status only after exit criteria pass.

## Diagnostics

```bash
git status --short
git branch --show-current
rg --files -g 'AGENTS.md' -g 'SPEC.md' -g 'ROADMAP.md' -g 'TASKS.md'
```

If asked to create missing project documents, adapt the templates under `assets/project-docs/`.

## Safety Rules

- Never rewrite project requirements unless asked.
- Never mark a task done without verified execution output.
- Stop at plan approval boundaries and wait for explicit confirmation.
- Keep project-specific knowledge in project docs, not reusable skills.
- Use `rtk` for noisy test suites, linters, and log outputs.
