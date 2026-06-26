# Architecture Summary

## Repository Role

Dogfood + distribution repository for SpeechAct v2 governance framework.

## Core Pattern

```text
canonical/governance-seed/  →  authoritative source, distributed to other repos
Root AGENTS.md etc.         →  synchronized dogfood copies (check-canonical-sync.sh enforces)
```

## Directory Map

```text
canonical/governance-seed/   6 authority files + governance/ + metadata/ + prompts/
tools/                       4 POSIX sh scripts: freshness, speechacts, sync, package
specs/                       speechact-v2.md (Draft)
examples/minimal-repo/       reference implementation with speech acts
tests/semantic/              semantic test descriptions (tool scripts are the actual tests)
tests/fixtures/              stub — test fixtures for v0.2.0
meta/                        persistent session memory (this)
prompts/                     repo-operational prompts (session-closeout)
dist/                        packaged releases (should be gitignored)
```

## Six Canonical Authorities

| File | Owns |
|------|------|
| `AGENTS.md` | Agent behavior |
| `SPEECHACT.md` | Speech act semantics |
| `WRITING.md` | Prose standards |
| `CONTEXT-MODEL.md` | Context inheritance |
| `QUALITY-SEMANTICS.md` | Semantic validation |
| `SEMANTIC-TRACEABILITY.md` | Change traceability |

Each file exists at both `canonical/governance-seed/<FILE>` and `<FILE>` (root dogfood copy).

## Release Model

- Tags are the only official release boundary
- Tag format: `vMAJOR.MINOR.PATCH[-label]`
- Must pass all 3 check scripts before tagging
- CI enforces on every tag push and branch/MR

## Tooling Constraints

- POSIX sh only — no Bash-isms, no external dependencies
- No build system, no package manager
- Canonical files must be copy-safe (no repo-specific references)
