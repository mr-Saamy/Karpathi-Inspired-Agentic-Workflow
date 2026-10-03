---
name: forgejo-maintainer
description: Maintain Forgejo and Gitea-compatible installations, repository administration, SSH access, Actions runners, backups, upgrades, migrations, and operational runbooks.
---

# Forgejo Maintenance

## Workflow

1. Diagnose Forgejo/Gitea service configuration, database state, and SSH key management.
2. Configure Forgejo Runner / Actions workflows and repository mirrors.
3. Manage automated instance backups and migration paths.
4. Verify service status after maintenance windows.

## Safety Rules

- Perform database backup before initiating upgrades or migrations.
- Keep operational keys out of repository source files.
