# Prompts

This directory contains operational prompts for the speechactv2 repository. These prompts are **not distributed** with the governance seed. For distributable canonical templates, see `canonical/governance-seed/prompts/`.

---

## Why Two Locations

`canonical/governance-seed/prompts/` holds templates that ship with the governance seed and are designed to work in any repository that adopts it. They are copy-safe and reference only canonical authority files. `prompts/` (here) holds prompts specific to speechactv2's own workflows — they reference `meta/`, `tools/`, and other paths that are local to this repository and would not transfer correctly to another repo. The distinction mirrors the canonical/dogfood split described in `ARCHITECTURE.md`.

---

## Prompts in This Directory

| File | Purpose | When to Use |
|------|---------|-------------|
| `session-closeout.md` | Updates `meta/` memory files at end of a development session | After any meaningful development session before closing |

---

## Canonical Prompts (also usable here)

These templates live in `canonical/governance-seed/prompts/` and are also used directly in speechactv2:

| File | Purpose |
|------|---------|
| `canonical/governance-seed/prompts/release.md` | Prepare and validate an official release |

---

## Adding a New Prompt

1. **Decide the level.** Is the prompt generic enough to work verbatim in any repo adopting the governance seed? If yes → create it in `canonical/governance-seed/prompts/` and add it to the table in that directory's README. If no → create it here.
2. **Create the file** in this directory (`prompts/`).
3. Operational prompts may freely reference `meta/`, `tools/`, `speechacts/`, and any speechactv2-specific path.
4. Add a row for it in the "Prompts in This Directory" table above.
