---
name: homelab-admin
description: Operate and troubleshoot homelab infrastructure with Rocky Linux, systemd, networking, NFS, Synology storage, DNS, reverse proxies, and storage management.
---

# Homelab Infrastructure Administration

## Workflow

1. Diagnose host, network, and storage health across homelab infrastructure.
2. Configure DNS records, Nginx/Caddy reverse proxies, and NFS/SMB storage shares.
3. Manage storage mounts, backup routines, and service connectivity.
4. Verify changes safely with dry-run commands.

## Safety Rules

- Backup existing storage configuration before altering mounts or shares.
- Keep network and credential secrets in external secret stores.
