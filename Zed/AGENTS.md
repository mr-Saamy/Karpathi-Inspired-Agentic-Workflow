# Zed Editor Configuration Instructions

## Scope

This directory contains the portable Zed Editor configuration, assistant settings (`.zed/settings.json`), system instructions (`.zed/assistant-instructions.md`), custom prompt slash commands (`.zed/prompts/`), cross-platform installers, and layout documentation tuned for Zed's AI Assistant.

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

- Run `./scripts/validate.sh` to verify assistant settings, prompt syntax, ShellCheck, and installer integration.
