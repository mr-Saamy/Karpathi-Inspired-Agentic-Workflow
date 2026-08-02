---
trigger: always_on
---

# Repository instructions

## Scope

This repository is the source of truth for Antigravity IDE's portable agent
configuration, reusable skills, global instructions, and workflow principles.
The root `AGENTS.md` is the project maintenance file for tools loading it automatically.

## Operating principles

- Working code only. Plausibility is not correctness; verify before reporting done.
- Never fabricate file paths, APIs, commit hashes, command output, or test results.
- Say when a premise appears wrong before implementing around it.
- Ask before proceeding only when a request has multiple plausible interpretations and the choice materially affects the result.
- Touch only what the task requires. Avoid drive-by refactors, formatting, or cleanup.
- Keep communication direct and concise. Skip flattery, filler, ceremonial openings, and emoji.

## Command execution & RTK

- Use `rtk` when command output is likely to be large or repetitive and a filtered summary is sufficient.
- Use raw commands when output is expected to be short, when exact output matters, or when inspecting a specific file.
- Prefer running code, tests, linters, and type checks over guessing.
- Read complete errors, logs, and stack traces before fixing them.

## Knowledge Items & Context

- Before conducting wide research or implementing features, check available Knowledge Items (KIs) in `<appDataDir>/knowledge` to leverage prior documented patterns and avoid reinventing established solutions.

## Before editing

- State the plan or success criteria before editing.
- Read the files you will touch and nearby callers or docs.
- Match existing project patterns, naming, layout, and style.

## Editing

- Use simple ASCII punctuation.
- Keep credentials, tokens, sessions, history, caches, logs, and runtime databases out of this repository.
- Put reusable workflows in `.agents/skills/<name>/SKILL.md`.
- Put portable user configuration in `antigravity-home/`.
- Put project maintenance instructions in this file.
- Do not assume files in `docs/` are loaded automatically.
- Use the minimum code or documentation change that solves the stated problem.

## Documentation routing

- `SPEC.md` for product requirements and acceptance criteria.
- `ROADMAP.md` for ordered outcomes, risks, and phase exit criteria.
- `TASKS.md` for current phase, validation status, and remaining work.
- `docs/ANTIGRAVITY_LAYOUT.md` for Antigravity discovery and installation boundaries.
- `docs/SKILLS.md` when creating or changing skills.
- `docs/WORKFLOW.md` for agent workflow and Planning Mode usage.
- `docs/PROMPT_GUIDE.md` for getting peak performance out of Antigravity AI.

## Verification

- Run `./scripts/validate.sh` after changing configuration, skills, install scripts, or repository layout.
- Run `./scripts/test-install.sh` directly to verify Linux/macOS installer behavior.
