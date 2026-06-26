# Context Model

This file is the canonical authority for context inheritance in repositories governed by SpeechAct v2.

## The Four Properties

Repository context must be:

| Property | Meaning |
|----------|---------|
| **Explicit** | Written down in a file. Implied context is not valid governance context. |
| **Durable** | Survives across agent sessions and repository clones. Session memory is not governance context. |
| **Minimal** | Contains only what is necessary for an agent to act correctly. Excess context increases drift risk. |
| **Inheritable** | Can be passed to or loaded by any agent operating in the repository. |

## Context Hierarchy

Agents must read context in this order, with later layers able to narrow but not contradict earlier ones:

1. **Repository level** — `README.md`, `ARCHITECTURE.md`, `DECISIONS.md`
2. **Canonical level** — files in `canonical/governance-seed/` relevant to the task domain
3. **Local level** — project-specific files that extend or constrain canonical rules for this repository

If a local file contradicts a canonical authority, the local file must include an explicit decision record (in `DECISIONS.md`) acknowledging the override and its rationale.

## How Agents Load Context

1. Start with repository-level context to understand architecture and declared intent.
2. Load canonical authority files for each concern the task touches (see `AGENTS.md` for the authority map).
3. Apply local overrides only when they are explicitly documented.
4. Reject implicit context: "everyone knows" and "it's obvious" are not valid.

## What Is Not Context

- Session-only information (conversation history, scratch notes)
- Inferred intent not written in any file
- The contents of `.git/` (use `git log` to read history explicitly when needed)
- Files not yet committed to the repository
