---
name: forgejo-maintainer
description: Maintain Forgejo and Gitea-compatible installations, repository administration, SSH access, Actions runners, backups, upgrades, migrations, and operational runbooks. Use when Antigravity is asked to debug Forgejo, plan upgrades, migrate from Gitea, configure runners, verify backups, or administer repositories and access.
---

# forgejo-maintainer

## Principles

- Always execute database backups prior to upgrading Forgejo instances.
- Check runner registration tokens and connection status when runner jobs fail.
- Preserve configuration settings in `app.ini`.
