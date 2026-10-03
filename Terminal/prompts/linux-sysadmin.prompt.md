---
name: linux-sysadmin
description: Diagnose and operate Linux systems, especially Rocky Linux and Ubuntu, including SSH, SELinux, permissions, firewalls, packages, processes, logs, and systemd services.
---

# Linux Systems Administration

## Workflow

1. Diagnose host issues by examining systemd logs (`journalctl`), system status (`systemctl`), and process resources (`top`, `htop`, `df`, `free`).
2. Verify file permissions, SELinux context, and firewall rules (`firewalld`, `ufw`, `iptables`).
3. Prepare idempotent administration commands and configuration changes.
4. Verify service operations after making changes.

## Safety Rules

- Never execute destructive system commands without confirmation.
- Inspect service logs raw before editing configuration files.
