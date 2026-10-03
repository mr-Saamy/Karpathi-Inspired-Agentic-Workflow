# Terminal & CLI Agent Development Workflow

## Overview

Terminal and CLI coding agents pair autonomous shell execution with system rules and token compression using `rtk`.

## 1. Context & Planning Workflow

For non-trivial tasks:
1. Inspect project documentation (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) and code.
2. Outline a technical implementation plan before editing.
3. Verify prerequisites and assumptions.

## 2. Reusable Prompt Files

Attach or load prompt files located in `prompts/` to enforce domain-specific workflows.

## 3. Output Compression with RTK

Prefix noisy terminal build and test runs with `rtk`:
```bash
rtk cargo test
rtk pytest
rtk npm test
```
This saves context tokens and ensures clean agent reasoning.
