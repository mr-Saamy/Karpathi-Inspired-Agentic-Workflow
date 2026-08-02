---
name: rust-cli
description: Design, implement, test, document, and release Rust command line applications using Cargo, clap, integration tests, error handling, and CLI UX conventions. Use when Antigravity is asked to build or review a Rust CLI, add commands or flags, improve tests, package releases, or debug Cargo workflows.
---

# rust-cli

## Principles

- Use `cargo check` and `cargo test` to verify changes.
- Use `rtk` when running `cargo test` or `cargo build` to filter repetitive compilation output.
- Follow idiomatic Rust error handling (`anyhow` / `thiserror`).
