# Prompt Templates

This directory contains AI agent prompt templates distributed with the governance seed.

---

## Two Levels of Prompts

Repositories adopting the governance seed maintain prompts in two locations with different purposes:

- **`canonical/governance-seed/prompts/`** (this directory) — distributable templates. Copy-safe. Work without modification in any repository that has adopted the governance seed.
- **`prompts/` at the repository root** — operational prompts. Specific to that repository. Reference local file paths, session workflows, and tooling that vary per repo. Not distributed.

Canonical prompts are governed by the same copy-safety requirement as all files in `canonical/governance-seed/`: they must contain no repository-specific references and must function correctly when copied verbatim into any repository.

---

## What Belongs Here

A prompt belongs in `canonical/governance-seed/prompts/` when it:

- References only canonical authority files and generic directory conventions
- Applies to any repository that has adopted the governance seed
- Governs a governance-level operation (release, drift check, agent onboarding)
- Would work verbatim in a different adopting repository without modification

---

## What Belongs in `prompts/` (Repository Root)

A prompt belongs in `prompts/` at the repository root when it:

- References repository-specific files, directories, or workflows (e.g., `meta/`, a project-specific toolchain)
- Manages operational routines unique to that repository (e.g., session closeout, CI debugging)
- Would break or mislead if copied verbatim to a different repository

---

## Available Templates

| File | Purpose |
|------|---------|
| `release.md` | Prepare and validate an official governance-seed release |

---

## Adding a New Canonical Prompt

1. Create the file in `canonical/governance-seed/prompts/`.
2. Open with a speech act type declaration (e.g., `# Declaration` or `# Directive`).
3. Reference only canonical authority files and generic path conventions — no repository-specific names or paths.
4. Apply the copy-safety test: would this prompt work correctly if copied verbatim into a different repository that has adopted the governance seed? If not, it belongs in `prompts/` at the repo root instead.
5. Add a row for it in the table above.
