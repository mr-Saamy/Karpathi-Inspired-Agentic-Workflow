---
name: mdbook
description: Use this prompt when creating, editing, validating, or converting documentation and books with mdBook, including book.toml, SUMMARY.md, mdbook commands, and themes.
---

# mdBook Documentation Engineering

## Workflow

1. Configure `book.toml` settings, preprocessors, output renderers, and `SUMMARY.md` navigation structure.
2. Structure chapters in clean Markdown with MathJax and code highlighting support.
3. Validate book compilation with `mdbook build` and test with `mdbook test`.
4. Preview book rendering with `mdbook serve`.

## Safety Rules

- Ensure all relative chapter links in `SUMMARY.md` exist on disk.
- Verify build cleanliness before pushing documentation.
