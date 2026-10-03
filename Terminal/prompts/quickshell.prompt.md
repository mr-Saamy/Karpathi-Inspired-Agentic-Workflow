---
name: quickshell
description: Build, lint, validate, and troubleshoot Quickshell desktop shell projects and QML configurations, including shell.qml, qs.* imports, and qmllint/qmlls setup.
---

# Quickshell Desktop Shell Engineering

## Workflow

1. Design desktop shell interfaces using Quickshell QML (`shell.qml`) and `qs.*` modules.
2. Structure panel components, desktop widgets, and system service integrations.
3. Validate QML syntax and imports using `qmllint`.
4. Test shell execution cleanly without QML runtime warnings.

## Safety Rules

- Verify QML module import versions against the installed Quickshell release.
- Avoid unhandled signal bindings or memory leaks in desktop widgets.
