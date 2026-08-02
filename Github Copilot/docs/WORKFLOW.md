# GitHub Copilot Agent Workflow

## Core Development Loop

1. **Context & Planning**:
   - Query `@workspace` to inspect existing project requirements (`SPEC.md`, `ROADMAP.md`, `TASKS.md`).
   - Request Copilot Chat to formulate a structured implementation plan prior to code generation.
2. **Incremental Execution**:
   - Review proposed diffs and code suggestions step-by-step.
3. **Output Compression & Verification**:
   - Use `rtk` to run test suites or linters in the integrated VS Code terminal to avoid context saturation.
4. **Task Update & PR Readiness**:
   - Run `/prompt pr-readiness` to verify diff cleanliness and update tracking documents before submitting pull requests.
