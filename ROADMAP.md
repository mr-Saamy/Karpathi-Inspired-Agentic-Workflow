# Roadmap: antigravity-ai

## Phase 1: Foundation & Core Layout
- [x] Establish repository structure (`AGENTS.md`, `SPEC.md`, `ROADMAP.md`, `TASKS.md`, `.gitignore`).
- [x] Create managed global configuration under `antigravity-home/` (`AGENTS.md`, `skills.json`, `rules/default.rules`).

## Phase 2: Skills Porting & Antigravity Native Optimization
- [x] Port core reusable skills to `.agents/skills/`:
  - `ai-project-manager`
  - `pr-readiness`
  - `bash-scripting`
  - `linux-sysadmin`
  - `python-ai`
  - `rust-cli`
  - `homelab-admin`
  - `forgejo-maintainer`
  - `podman-operator`
  - `hugo`
  - `mdbook`
  - `quickshell`
- [x] Update skill instructions to reference Antigravity native tools and planning mode artifacts.

## Phase 3: Reference Documentation
- [x] Create `docs/ANTIGRAVITY_LAYOUT.md` explaining Antigravity discovery roots.
- [x] Create `docs/SKILLS.md` documenting skill trigger patterns.
- [x] Create `docs/WORKFLOW.md` detailing the AI development workflow.
- [x] Create `docs/PROMPT_GUIDE.md` for getting maximum value out of Antigravity AI.
- [x] Write top-level `README.md`.

## Phase 4: Installer & Validation Suite
- [x] Implement POSIX Bash installer (`scripts/install.sh`).
- [x] Implement PowerShell installer (`scripts/install.ps1`).
- [x] Implement `scripts/validate.sh` and integration tests `scripts/test-install.sh` / `scripts/test-install.ps1`.
- [x] Add GitHub Actions workflows.
