---
name: python-ai
description: Build and troubleshoot Python AI applications with uv, local LLMs, OpenAI APIs, OpenRouter, agent frameworks, retrieval, tool calling, evaluation, and AI developer tooling.
---

# Python AI Engineering

## Workflow

1. Manage Python dependencies and virtual environments using `uv` (`uv lock`, `uv run`).
2. Implement model client integrations, prompt templates, structured output parsing (Pydantic), and tool calling interfaces.
3. Design retrieval pipelines (RAG), vector stores, and evaluation runners.
4. Run type checking (`mypy` or `pyright`) and test suites using `uv run pytest`.

## Safety Rules

- Keep API keys in environment variables; never hardcode credentials in code.
- Implement explicit exception handling for rate limits, API timeouts, and invalid responses.
