# Specification: Universal Multi-Environment Agentic Framework

## 1. Problem Statement & Objectives

Modern AI coding agents exhibit disparate discovery models, configuration paths, prompt formats, and tool contracts across different development environments. A developer moving between Google Antigravity IDE, VS Code with GitHub Copilot, Zed Editor, VSCodium with open-source agents (Cline, Roo-Code, Continue.dev), and terminal/CLI workflows (Neovim Avante, Claude Code, Aider) must manually reconfigure rules, prompt libraries, and behavioral constraints. Furthermore, divergent platform conventions across Linux, macOS, and Windows cause configuration drift and broken tool execution.

The objective of this specification is to define a unified, portable, multi-environment architecture that allows the **Karpathy-inspired agentic workflow** to operate identically across all supported IDEs, editors, and operating systems.

---

## 2. Core Working Principles

All target environment adapters, generated configurations, and agent behaviors must strictly enforce:
1. **Working Code Only**: Plausibility is not correctness. Agents must empirically verify code through builds, linters, or test suites before declaring tasks complete.
2. **Strict Anti-Fabrication**: Never fabricate file paths, APIs, commit hashes, command outputs, or test results.
3. **Challenge Invalid Premises**: Identify and state incorrect assumptions, broken specifications, or flawed instructions before implementing around them.
4. **Surgical Edits**: Touch only what the task requires. Prohibit unsolicited refactors, formatting sweeps, and cosmetic whitespace churn.
5. **Direct & Concise Communication**: Eliminate flattery, conversational filler, ceremonial openings, and emojis.
6. **Context Window Economy**: Filter noisy build and test outputs using `rtk` to preserve LLM reasoning tokens.

---

## 3. Supported Environment Taxonomy & Boundaries

### 3.1 Target Coding Environments

| Target Environment | Agent Engine / Extension | Discovery Mechanism & Target Paths | Prompt & Skill Format |
| :--- | :--- | :--- | :--- |
| **Antigravity IDE** | Gemini 3.6 / 3.8 Flash & Pro | Global: `~/.gemini/config/AGENTS.md`, `~/.gemini/config/skills/`<br>Workspace: `.agents/skills/`, `.agents/rules/` | `SKILL.md` (YAML frontmatter + markdown) + native tool calling + Planning Mode |
| **VS Code (GitHub Copilot)** | GitHub Copilot Chat & Agent Mode | Global: `~/.config/github-copilot/`<br>Workspace: `.github/copilot-instructions.md`, `.github/prompts/` | Prompt files (`.github/prompts/*.prompt.md`) + modular instructions (`.github/instructions/`) |
| **VSCodium / Open VS Code** | Cline / Roo-Code / Continue.dev / OpenCode | Workspace: `.clinerules`, `.roomodes`, `.continue/config.json`, `.continue/prompts/` | System prompt injection + custom mode prompts (`.prompt.md`) |
| **Zed Editor** | Zed AI Assistant | Workspace: `.zed/settings.json`, `.zed/prompts/`<br>Global: `~/.config/zed/settings.json` | Slash commands (`/`), Context Servers (MCP), custom assistant system instructions |
| **Terminal / CLI / Neovim** | Avante.nvim, CodeCompanion.nvim, Claude Code CLI, Aider | Workspace: `CLAUDE.md`, `.aider.conf.yml`, `.avante/templates/`<br>Global: `~/.claude.json`, `~/.config/nvim/` | Markdown conventions, system prompt files, rule injection |

### 3.2 Target Operating Systems

1. **Linux**: Debian/Ubuntu, RHEL/Rocky Linux, Arch Linux, Fedora.
   - Toolpaths: `$HOME/.local/bin`, `$HOME/.cargo/bin`, `/usr/local/bin`.
   - Init/Services: systemd, POSIX `/bin/sh` and `/bin/bash`.
2. **macOS**: Darwin architecture (Apple Silicon / Intel).
   - Configuration paths: `~/Library/Application Support/`, `~/.config/`.
   - Shell: `/bin/zsh`, `/bin/bash` (Homebrew).
   - Package manager integration: Homebrew (`/opt/homebrew` or `/usr/local`).
3. **Windows**: Windows 11 / Server.
   - Shell: PowerShell 7+ (`pwsh`) and Windows PowerShell 5.1.
   - Configuration paths: `$env:USERPROFILE\.config\`, `$env:APPDATA\`, `$env:USERPROFILE\.gemini\`.

### 3.3 State Boundaries (Managed vs. Ephemeral)
- **Managed by Repository**: Universal skill manifests, adapter templates, prompt definitions, operational instructions, execution policies, installer scripts, and validation test suites.
- **Strictly Excluded (Unmanaged Ephemeral State)**: API tokens, OAuth sessions, SQLite chat caches, active transcripts, model weights, local build artifacts, and private scratchpad directories.

---

## 4. Functional Requirements

### FR-1: Canonical Skill Specification (Single Source of Truth)
- All 13 core skills (`ai-project-manager`, `axiom`, `bash-scripting`, `forgejo-maintainer`, `homelab-admin`, `hugo`, `linux-sysadmin`, `mdbook`, `podman-operator`, `pr-readiness`, `python-ai`, `quickshell`, `rust-cli`) must be defined once in a canonical schema.
- Canonical skills must include:
  - Standard YAML frontmatter (`name`, `description`, optional `triggers` and `metadata`).
  - Structured Markdown workflow (Context & Discovery, Planning & Checks, Execution, Verification).
  - Diagnostic command blocks compatible with POSIX and Windows PowerShell.

### FR-2: Adapter & Projection Engine
- The framework must provide adapters that translate the canonical skills and instructions into environment-native artifacts:
  - **Antigravity Adapter**: Generates `.agents/skills/<name>/SKILL.md` and links global `skills.json`.
  - **GitHub Copilot Adapter**: Generates `.github/prompts/<name>.prompt.md` and `.github/copilot-instructions.md`.
  - **Zed Adapter**: Generates `.zed/prompts/<name>.md` and configures assistant system prompt in `.zed/settings.json`.
  - **VSCodium / Cline / Roo-Code Adapter**: Generates `.roomodes` definitions and `.clinerules` instruction sets.
  - **Terminal / CLI Adapter**: Generates `CLAUDE.md` and `.aider.conf.yml` referencing the core operating principles.

### FR-3: Operational Principle & Rule Projection
- Core operating principles (working code only, anti-fabrication, surgical edits, direct communication, RTK usage) must be injected into the primary instruction file of each target environment.
- Any change to global operating rules must propagate consistently across all environment adapters.

### FR-4: Context Window Compression Layer (`rtk`)
- Each target environment must configure or instruct agents to utilize `rtk` for command execution where terminal output is high-volume (test suites, builds, linters, recursive searches).
- If `rtk` is unavailable or truncates necessary debugging information, the workflow must enforce transparent fallback to raw terminal commands.
- Installers must provide automated installation instructions or checks for `rtk`.

### FR-5: Unified Planning Mode & Artifact Protocol
- Complex tasks across all environments must implement the planning workflow:
  1. Discovery: Inspect repository docs (`SPEC.md`, `ROADMAP.md`, `TASKS.md`).
  2. Planning: Write implementation plan (`implementation_plan.md` or native environment plan file).
  3. Approval checkpoint: Await user approval on design choices before code modification.
  4. Execution: Surgical incremental edits.
  5. Verification: Empirically execute tests and write completion walkthrough (`walkthrough.md`).

### FR-6: Cross-Platform, Non-Destructive Installer Suite
- Installers must be provided in POSIX Bash (`scripts/install.sh`) for Linux/macOS and PowerShell (`scripts/install.ps1`) for Windows.
- Installers must support:
  - `--target <env>` flag (e.g., `antigravity`, `copilot`, `zed`, `cline`, `all`).
  - `--dry-run` flag to preview file system actions without modifying state.
  - Automatic timestamped backups of pre-existing configurations prior to replacement.
  - Symlink deployment by default with fallback to hard copy where symlinks are restricted.
  - Re-run idempotency without duplicate entries or error states.

### FR-7: Comprehensive Verification & Test Suite
- Automated validation (`scripts/validate-all.sh`) must verify:
  - File existence and schema conformity for all required files per target.
  - YAML frontmatter validity (`---`, `name`, `description`).
  - Total skill parity across all supported environment adapters (all 13 skills present in every target).
  - Shell script syntax verification via `bash -n` and static analysis via `shellcheck`.
  - PowerShell script syntax validation via `pwsh` parse check.
  - Sandboxed installer integration tests with automated cleanup.

### FR-8: CI/CD Multi-OS Matrix
- GitHub Actions workflow (`.github/workflows/validate.yml`) must execute validation and installer tests across:
  - `ubuntu-latest` (Linux)
  - `macos-latest` (macOS Darwin)
  - `windows-latest` (Windows PowerShell)

---

## 5. Non-Functional Requirements

- **NFR-1: Determinism & Reliability**: Configurations must produce consistent agent behaviors across disparate LLM backends (Gemini, Claude, GPT-4o).
- **NFR-2: Zero Runtime Overhead**: Skill discovery and instruction parsing must occur natively without requiring resident background daemons.
- **NFR-3: Security & Secret Protection**: No API tokens, private keys, or passwords may be stored, committed, or echoed in shell output. Execution policies must explicitly filter environment variables matching sensitive patterns.
- **NFR-4: Portability & Minimal Tool Dependencies**: Core installer and validation scripts must run using native OS tools (Bash, sed, awk, curl, or standard PowerShell) without requiring heavyweight runtimes.

---

## 6. Acceptance Criteria

1. **Environment Compatibility**:
   - Antigravity IDE successfully discovers all 13 skills via `.agents/skills/` and global config.
   - VS Code / GitHub Copilot successfully loads `.github/copilot-instructions.md` and all 13 `.prompt.md` files.
   - Zed Editor correctly references custom prompts and system instructions in `.zed/`.
   - VSCodium (Cline / Roo-Code) correctly discovers custom mode definitions and rules.
   - Terminal CLI tools (Claude Code / Aider) discover root instruction files (`CLAUDE.md`).
2. **Cross-Platform Verification**:
   - POSIX installer succeeds on Linux and macOS without errors.
   - PowerShell installer succeeds on Windows without errors.
   - Dry-run mode performs zero disk writes across all platforms.
3. **Automated Validation**:
   - `scripts/validate-all.sh` exits with code 0 on all platforms.
   - Skill parity check confirms exactly 13 skills across all target adapters.
   - ShellCheck passes with zero warnings or errors.
