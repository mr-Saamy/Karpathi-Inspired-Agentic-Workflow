---
name: pr-readiness
description: Validate local or published changes from final diff through pull-request merge readiness, including project gates, local review, CI, independent review, thread resolution, and manual-test evidence in GitHub Copilot.
---

# PR Readiness Verification

## Workflow

1. Inspect uncommitted changes (`git status`, `git diff`) and active branch.
2. Run project verification commands using `rtk` where appropriate (tests, linters, type checks).
3. Review code changes for security issues, unexpected diffs, or leftover debug lines.
4. Verify project gates and documentation updates (`SPEC.md`, `ROADMAP.md`, `TASKS.md`).
5. Generate a pull-request summary with test results and validation evidence.

## Safety Rules

- Never commit secrets or credentials.
- Never claim tests passed without empirical terminal verification.
- Keep diffs clean and scoped to the stated task.
