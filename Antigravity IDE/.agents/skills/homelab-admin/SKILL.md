---
name: homelab-admin
description: Operate and troubleshoot homelab infrastructure with Rocky Linux, systemd, networking, NFS, Synology storage, DNS, reverse proxies, and storage management. Use when Antigravity is asked to plan maintenance, diagnose outages, change host or network configuration, document runbooks, or prepare safe commands for homelab servers.
---

# homelab-admin

## Principles

- Always verify network paths and firewall rules (`firewalld`, `ufw`, `iptables`).
- Backup service configurations before making modifications.
- Test service reachability using `curl` or `nc` before concluding setup.
