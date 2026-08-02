---
name: bash-scripting
description: Design, implement, review, test, and debug Bash and POSIX shell scripts with safe quoting, error handling, portability, ShellCheck, shfmt, and predictable command behavior. Use when Antigravity is asked to create or modify .sh files, automate command-line workflows, fix shell bugs, improve script safety, remove bashisms, or validate Linux and CI shell scripts.
---

# bash-scripting

## Principles

- Always use `set -euo pipefail` for Bash scripts.
- Quote all variables (`"$var"`).
- Run `bash -n <script>` to check syntax before execution.
- Validate with `shellcheck` when available.
- Use `rtk` when running broad script test suites or verbose outputs.
