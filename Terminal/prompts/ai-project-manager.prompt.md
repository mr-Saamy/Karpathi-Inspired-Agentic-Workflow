---
name: ai-project-manager
description: Turn repository planning docs into actionable AI-agent implementation plans using AGENTS.md, SPEC.md, ROADMAP.md, TASKS.md, approval checkpoints, validation, and incremental execution in CLI and terminal environments.
---

# AI Project Manager

## Workflow

1. **Context & Discovery**:
   - Inspect workspace instructions (`AGENTS.md` or `.github/copilot-instructions.md`), current changes (`git status`), active branch, and project tracking docs (`SPEC.md`, `ROADMAP.md`, `TASKS.md`).
2. **Analysis & Design**:
   - Identify missing requirements, unresolved decisions, dependencies, and risks.
   - Outline proposed changes grouped by component before editing files.
3. **Implementation Plan**:
   - Formulate a clear plan with goal description, affected files, verification steps, and open questions.
   - Seek user review on major architectural decisions.
4. **Incremental Execution**:
   - Execute one reviewable phase at a time.
5. **Validation & PR Readiness**:
   - Run verification commands using `rtk` where output is large.
   - Update `TASKS.md` status only after exit criteria pass.

## Safety Rules

- Never rewrite project requirements unless asked.
- Never mark a task done without verified execution output.
- Keep project-specific knowledge in project docs, not prompt definitions.
- Use `rtk` for noisy test suites, linters, and log outputs.
