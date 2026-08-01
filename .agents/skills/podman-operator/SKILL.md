---
name: podman-operator
description: Build, deploy, and troubleshoot Podman services, Quadlet units, rootless containers, container networking, volumes, systemd integration, and production container operations. Use when Antigravity is asked to convert compose files, write Quadlet units, debug Podman networking or volumes, or prepare repeatable container deployment steps.
---

# podman-operator

## Principles

- Prefer rootless Podman containers where feasible.
- Use systemd Quadlet files (`.container`, `.volume`, `.network`) for systemd-managed services.
- Use `rtk` when inspecting long container logs (`podman logs`).
