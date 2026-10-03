# VSCodium Agentic Development Workflow

## Overview

Open-source agent extensions in VSCodium pair local or cloud LLMs with custom instructions, modes, and token output compression using `rtk`.

## 1. Context & Planning Workflow

For non-trivial tasks:
1. Inspect project documentation (`SPEC.md`, `ROADMAP.md`, `TASKS.md`) and code.
2. Outline a technical implementation plan before editing.
3. Verify prerequisites and assumptions.

## 2. Modes & Prompts

- Select specialized modes in Roo-Code (`AI Project Manager`, `Axiom`, `PR Readiness`, etc.).
- Use Continue slash commands or prompt attachments for specialized domain logic.

## 3. Output Compression with RTK

Prefix noisy terminal build and test runs with `rtk`:
```bash
rtk cargo test
rtk pytest
rtk npm test
```
This saves context tokens and ensures clean agent reasoning.
