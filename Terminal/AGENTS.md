# Terminal & CLI Agent Configuration Instructions

## Scope

This directory contains configuration, rules, and prompt libraries for **Terminal, CLI, and Neovim** AI coding environments:
- **Claude Code CLI** (`CLAUDE.md`)
- **Aider** (`.aider.conf.yml` and `.aider.prompt.md`)
- **Neovim / Avante.nvim** (`.avante/templates/`)

## Operating Principles

- Working code only. Plausibility is not correctness; verify before reporting done.
- Never fabricate file paths, APIs, commit hashes, command output, or test results.
- Say when a premise appears wrong before implementing around it.
- Touch only what the task requires. Avoid drive-by refactors, formatting, or cleanup.
- Keep communication direct and concise. Skip flattery, filler, ceremonial openings, and emoji.

## Command Execution & RTK

- Use `rtk` when command output is likely to be large or repetitive and a filtered summary is sufficient.
- Use raw commands when output is expected to be short or when inspecting exact tracebacks.

## Verification

- Run `./scripts/validate.sh` to verify custom instructions, prompt syntax, ShellCheck, and installer integration.
