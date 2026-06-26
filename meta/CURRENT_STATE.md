# Current State

## Phase

`v0.1.0-governance-seed` — governance-seed mode

## Implemented

| Component | Status |
|-----------|--------|
| `canonical/governance-seed/` — 6 authority files | Complete |
| `canonical/governance-seed/governance/` | Complete |
| `canonical/governance-seed/metadata/speechact-record.schema.json` | Complete |
| `canonical/governance-seed/prompts/release.md` | Complete |
| `canonical/governance-seed/prompts/README.md` | Complete |
| Root dogfood copies (6 authority files at repo root) | Complete |
| `tools/check-docs-freshness.sh` | Complete |
| `tools/check-speechacts.sh` | Complete |
| `tools/check-canonical-sync.sh` | Complete |
| `tools/package-release.sh` | Complete |
| `examples/minimal-repo/` + speech act record | Complete |
| `.gitlab-ci.yml` (validate + package stages) | Complete |
| Root docs (README, ARCHITECTURE, CHANGELOG, ROADMAP, STATUS, DECISIONS) | Complete |
| `specs/speechact-v2.md` | Draft |
| `meta/` system | Complete |
| `prompts/session-closeout.md` | Complete |
| `prompts/README.md` | Complete |
| `.gitignore` | Complete |

## Not Started / Stub

| Component | Notes |
|-----------|-------|
| `tests/fixtures/` | README stub only |
| `skills/` | Not yet created |
| Schema-based YAML validation | v0.2.0 |
| Drift detection (`check-drift.sh`) | v0.3.0 |

## Validation State

All three check scripts pass clean:

```text
check-docs-freshness: OK
check-speechacts: OK
check-canonical-sync: OK
```
