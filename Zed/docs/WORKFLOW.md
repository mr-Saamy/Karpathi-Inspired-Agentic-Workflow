# Zed Agentic Development Workflow

## Overview

Zed AI Assistant pairs LLMs with slash commands, system instructions, and token output compression using `rtk`.

## 1. Context & Planning Workflow

For non-trivial features or refactoring:
1. Inspect workspace docs (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) and code.
2. Outline a technical implementation plan before editing.
3. Verify prerequisites and assumptions.

## 2. Reusable Slash Commands

Invoke domain skills directly in the Zed Assistant panel:
```text
/ai-project-manager
/pr-readiness
/rust-cli
```

## 3. Output Compression with RTK

Prefix noisy terminal build and test runs with `rtk`:
```bash
rtk cargo test
rtk pytest
rtk npm test
```
This saves context tokens and keeps Zed Assistant reasoning sharp and focused.
