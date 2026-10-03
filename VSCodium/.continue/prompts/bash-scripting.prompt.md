---
name: bash-scripting
description: Design, implement, review, test, and debug Bash and POSIX shell scripts with safe quoting, error handling, portability, ShellCheck, shfmt, and predictable command behavior.
---

# Bash Scripting

## Workflow

1. Design shell scripts using POSIX standards or safe Bash (`set -euo pipefail`).
2. Ensure explicit variable quoting, array safety, and exit status validation.
3. Validate scripts using ShellCheck and syntax verification (`bash -n`).
4. Test script execution in dry-run mode before executing destructive file operations.

## Safety Rules

- Avoid unquoted variable expansions.
- Never hardcode user paths; resolve directories dynamically.
- Use explicit error messaging and cleanup handlers (`trap`).
