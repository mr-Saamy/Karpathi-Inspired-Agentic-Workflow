# GitHub Copilot Configuration Instructions

## Scope

This directory contains the GitHub Copilot configuration, custom instructions (`.github/copilot-instructions.md`), prompt files (`.github/prompts/`), instruction modules (`.github/instructions/`), installers, and layout documentation tuned for VS Code + GitHub Copilot.

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

- Run `./scripts/validate.sh` to verify custom instructions, prompt syntax, and installer integration.
