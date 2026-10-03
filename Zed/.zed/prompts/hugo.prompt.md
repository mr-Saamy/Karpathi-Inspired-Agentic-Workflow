---
name: hugo
description: Build, edit, validate, and troubleshoot Hugo static sites, content front matter, archetypes, layouts, partials, shortcodes, taxonomies, menus, assets, image processing, RSS/search outputs, redirects, or static-site deployment.
---

# Hugo Static Site Engineering

## Workflow

1. Maintain Hugo site structure (`hugo.toml` / `config.toml`), content archetypes, and template layouts.
2. Build custom shortcodes, partials, and asset pipelines (Pipes / SCSS / JS).
3. Validate site build cleanly using `hugo --gc --minify`.
4. Test local server rendering with `hugo server`.

## Safety Rules

- Verify template syntax and taxonomy declarations before publishing.
- Test build output cleanly without broken internal links.
