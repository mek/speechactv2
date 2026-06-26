# Architecture

## Core Design

SpeechAct v2 treats a repository as a **semantic system**: a collection of files whose meaning, intent, and change history must be explicitly managed and traceable.

The repository has two roles:

1. **Dogfood** — it governs itself using the same governance seed it distributes.
2. **Distribution** — it publishes `canonical/governance-seed/` as a reusable package for other repositories.

## Directory Responsibilities

| Directory | Responsibility |
|-----------|---------------|
| `canonical/governance-seed/` | Authoritative governance files for distribution |
| `tools/` | Validation and packaging scripts (POSIX sh, no external dependencies) |
| `specs/` | Formal specification of the SpeechAct v2 model |
| `examples/` | Reference implementations showing correct usage |
| `tests/` | Semantic validation tests and test fixtures |
| `prompts/` | Repo-operational prompt templates (not distributed with the governance seed) |
| `meta/` | Persistent session memory: architecture summary, current state, known issues, next steps |

Root documents (`README.md`, `ARCHITECTURE.md`, `DECISIONS.md`, etc.) govern this repository specifically and are not distributed as part of the governance seed.

## Canonical Authority Pattern

Each governance concern is owned by exactly one file in `canonical/governance-seed/`. Other documents reference these authorities; they do not redefine their concerns. See `canonical/governance-seed/AGENTS.md` for the complete list.

Canonical files must be **copy-safe**: they contain no repository-specific references and function correctly when copied verbatim into any repository.

## Prompt System

Prompts exist at two locations with intentionally different scopes:

- **`canonical/governance-seed/prompts/`** — distributable templates that ship with the governance seed. Copy-safe. Applicable to any adopting repository.
- **`prompts/`** (repository root) — operational prompts specific to speechactv2. Reference local paths (`meta/`, `tools/`, etc.) and are not distributed.

See `canonical/governance-seed/prompts/README.md` for the full conceptual model and criteria. See `prompts/README.md` for the speechactv2-specific inventory and runbook.

## Release Model

- Releases are Git tags in the format `vMAJOR.MINOR.PATCH[-label]`.
- Tags are the only official release boundary.
- No build artifacts are required for governance-seed releases.
- GitLab CI enforces governance validation before tagging is effective (runs on `$CI_COMMIT_TAG`).
- See `canonical/governance-seed/governance/release-policy.md` for the full release process.

## Tooling Constraints

- Scripts must be POSIX sh. No Bash-specific syntax, no Python, no Node.
- No package managers or lock files.
- No build systems.
- External dependencies are forbidden in `tools/`.

## Invariants

- `canonical/governance-seed/` must always pass `check-docs-freshness.sh`.
- All speech act records must pass `check-speechacts.sh`.
- No canonical authority file may redefine a concern owned by another canonical authority file.
- Tags must correspond to a `CHANGELOG.md` entry.
