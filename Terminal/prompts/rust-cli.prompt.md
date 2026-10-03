---
name: rust-cli
description: Design, implement, test, document, and release Rust command line applications using Cargo, clap, integration tests, error handling, and CLI UX conventions.
---

# Rust CLI Engineering

## Workflow

1. Design command-line interface arguments using `clap` (derive API).
2. Structure Rust CLI binaries with clear library decoupling (`main.rs` + `lib.rs`).
3. Handle errors idiomaticly with `anyhow` or `thiserror`.
4. Validate builds and tests with `cargo test`, `cargo clippy`, and `cargo fmt`.

## Safety Rules

- Ensure clean exit codes and informative error messages on stdout/stderr.
- Run `cargo check` and `cargo test` before submitting changes.
