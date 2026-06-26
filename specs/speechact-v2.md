# SpeechAct v2 Specification

**Status:** Draft  
**Version:** 0.1.0

## Abstract

SpeechAct v2 defines a lightweight semantic governance model for repositories. It treats repositories as semantic systems and defines speech acts as the primary primitive for capturing intent, commitment, and traceability across agent-assisted work.

## Definitions

**Repository** — a version-controlled collection of files whose meaning is governed by this specification.

**Speech act** — a structured record that captures a meaningful event, intent, or commitment in the repository's lifecycle.

**Governance seed** — a portable set of canonical files that establish SpeechAct v2 governance in any repository.

**Canonical authority** — a file that owns the definition of a specific governance concern. No other file may redefine that concern.

**Semantic drift** — the state where repository implementation or documentation diverges from declared intent without a corresponding governance record.

**Release boundary** — a Git tag that marks an official, validated state of the repository.

## Speech Act Types

SpeechAct v2 defines five speech act types, derived from Austin-Searle speech act theory:

### declaration

A declaration changes the state of the repository by being uttered. The act itself constitutes the change.

Examples:
- Establishing a new policy
- Naming an official release
- Designating a file as a canonical authority

### assertion

An assertion records a fact, belief, or observation about the current state of the repository.

Examples:
- Confirming a property holds
- Documenting observed behavior
- Recording the current version

### directive

A directive issues an instruction for agents or contributors. Accepted directives are binding.

Examples:
- Mandating a validation step before releases
- Constraining future implementation choices
- Requiring documentation updates

### commissive

A commissive commits to future work. It is not binding until accepted, and its fulfillment may be deferred to a later release.

Examples:
- Roadmap items
- Planned features
- Accepted obligations

### expressive

An expressive records intent, rationale, or sentiment behind a decision or event.

Examples:
- Explaining why a trade-off was made
- Capturing the motivation behind an architecture choice
- Recording concerns about a pending change

## Record Format

Speech act records are YAML files stored in a `speechacts/` directory.

**File naming:** `sa-YYYY-MM-DD-NNN.yaml` where `NNN` is a zero-padded sequence number starting at `001`.

**Required fields:**

| Field | Type | Constraint |
|-------|------|-----------|
| `id` | string | Must match `^sa-[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{3}$` |
| `type` | string | One of: `declaration`, `assertion`, `directive`, `commissive`, `expressive` |
| `summary` | string | Minimum 10 characters |
| `status` | string | One of: `draft`, `accepted`, `rejected`, `superseded` |

**Optional fields:** `date` (ISO 8601), `author`, `supersedes` (speech act id), `context`.

Full JSON Schema: `canonical/governance-seed/metadata/speechact-record.schema.json`.

## Lifecycle

```
draft       → accepted    (governance act takes effect)
draft       → rejected    (act was considered and declined)
accepted    → superseded  (a newer accepted act replaces it)
```

Rejected and superseded acts must be preserved for traceability. Do not delete old speech act files.

## Repository Integration Requirements

A repository governed by SpeechAct v2 must:

1. Include `canonical/governance-seed/` (copied from a tagged release of this repository).
2. Maintain a `speechacts/` directory with speech act records for significant events.
3. Have a `CHANGELOG.md` with an entry for each release.
4. Have a `DECISIONS.md` with entries for architectural decisions.
5. Pass `check-docs-freshness.sh` and `check-speechacts.sh` before any official release tag.

## Governance Invariants

These invariants must hold at every release boundary:

1. All canonical authority files are present and non-empty.
2. All speech act records pass schema validation (required fields, valid enum values, correct id format).
3. `CHANGELOG.md` has an entry for the release version.
4. No two canonical authority files define the same governance concern.
5. No accepted `directive` targeting the current release scope is unimplemented without a documented deferral.
