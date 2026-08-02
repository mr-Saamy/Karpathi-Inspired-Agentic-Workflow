# GitHub Copilot Prompt & Instruction Guide

## Maximizing Copilot Efficiency

1. **Workspace Scope (`@workspace`)**:
   - Always reference `@workspace` when asking questions about codebase architecture or cross-file dependencies.
2. **RTK Integration**:
   - Use `rtk` commands (`rtk pytest`, `rtk cargo test`, `rtk ruff check`) in VS Code tasks or terminal windows to compress command outputs.
3. **Custom Instruction Activation**:
   - Ensure `.github/copilot-instructions.md` is active in VS Code (`github.copilot.chat.codeGeneration.useInstructionFiles: true`).
