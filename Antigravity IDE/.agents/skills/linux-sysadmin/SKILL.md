---
name: linux-sysadmin
description: Diagnose and operate Linux systems, especially Rocky Linux and Ubuntu, including SSH, SELinux, permissions, firewalls, packages, processes, logs, and systemd services. Use when Antigravity is asked to troubleshoot hosts, prepare commands, write runbooks, fix service failures, or reason about Linux administration.
---

# linux-sysadmin

## Principles

- Always inspect logs (`journalctl`, `/var/log`) before diagnosing system failures.
- Check service status using `systemctl status <service>`.
- Use `rtk` when querying large log streams or package indexes.
- Never hardcode passwords or private keys in command lines.
