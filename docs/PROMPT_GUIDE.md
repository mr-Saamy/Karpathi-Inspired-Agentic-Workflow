# Antigravity Prompting & Productivity Guide

To get the absolute best performance out of **Antigravity IDE** and Gemini 3.6, follow these best practices:

## 1. Clear Intent & Explicit Verification

- **Be specific about acceptance criteria**: Tell Antigravity how you plan to verify the outcome (e.g. "Run `pytest tests/test_core.py` and verify all pass").
- **Provide context up front**: If you have existing design docs or specific files, point Antigravity directly to them (e.g. "Follow the design in `SPEC.md`").

## 2. Leverage Planning Mode for Major Features

- If working on multi-file refactors, ask Antigravity to create an implementation plan first.
- Review the proposed diff targets in `implementation_plan.md` before authorizing execution.

## 3. Use RTK for High-Volume Commands

- When running linting, build pipelines, or wide tests, remind the agent to use `rtk` (e.g. "`rtk cargo test`").

## 4. Use Interactive Slash Commands

- Need interactive clarification? Type `/grill-me`.
- Need to teach the agent a new preference? Type `/learn`.
- Long build or deployment? Use `/schedule` or set a timer.

## 5. Keep Knowledge Items Updated

- Knowledge Items in `<appDataDir>/knowledge` provide instant repository context across sessions. Let Antigravity index key architecture docs as KIs for zero-shot context recall.
