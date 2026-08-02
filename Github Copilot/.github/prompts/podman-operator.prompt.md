---
name: podman-operator
description: Build, deploy, and troubleshoot Podman services, Quadlet units, rootless containers, container networking, volumes, systemd integration, and production container operations.
---

# Podman Container Operations

## Workflow

1. Design rootless Podman container deployments and Quadlet systemd service files (`.container`, `.network`, `.volume`).
2. Manage container networking, port publishing, and persistent storage volumes.
3. Validate Quadlet syntax with `podman system service` or systemd generators.
4. Verify container logs with `podman logs` and `journalctl --user`.

## Safety Rules

- Run containers in rootless mode wherever possible.
- Avoid storing raw passwords in Containerfiles or unit definitions.
