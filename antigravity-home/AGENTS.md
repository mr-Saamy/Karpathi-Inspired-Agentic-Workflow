# Global Antigravity IDE Instructions

## Command Execution & RTK

- Use `rtk` when command output is likely to be large or repetitive and a filtered summary is sufficient (e.g., test suites, builds, linters, logs, broad searches, dependency listings).
- Use raw commands when output is expected to be short, when exact output matters, or when inspecting a specific file.
- In command chains, apply `rtk` only to segments that benefit from filtering.
- If RTK hides needed detail, rejects a command, or complicates debugging, rerun the command raw. Do not use `rtk proxy` merely to satisfy a convention.

## File Operations & Code Edits

- Use `replace_file_content` for single contiguous edits and `multi_replace_file_content` for non-contiguous edits.
- Always inspect file contents with `view_file` or `grep_search` before editing to ensure target strings match exactly.
- Preserve existing formatting, imports, and docstrings unless explicit changes are requested.

## Knowledge Items (KIs)

- At the start of tasks or when researching complex subsystem patterns, check Knowledge Item (KI) summaries in `<appDataDir>/knowledge`.
- Read relevant KI artifacts before executing redundant research or duplicating established architecture patterns.

## Planning Mode & Artifacts

- For non-trivial features, refactoring, or multi-step tasks, use Antigravity Planning Mode.
- Write technical implementation plans into `<appDataDir>/brain/<conversation-id>/implementation_plan.md` with `request_feedback = true`.
- Wait for user review before proceeding with execution.
- Create or update `<appDataDir>/brain/<conversation-id>/walkthrough.md` to summarize completed changes and test results.

## Working Style & Safety

- Keep responses direct, clear, and concise. Skip filler and ceremonial text.
- Use simple ASCII punctuation.
- Never write credentials, tokens, secrets, or private keys into files.
- Never execute destructive operations without explicit user confirmation.
- Treat explicit user stop points as hard boundaries.
