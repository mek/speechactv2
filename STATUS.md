# Status

Current phase: **v0.1.0-governance-seed**

## Deliverable Completion

| Deliverable | Status |
|-------------|--------|
| `canonical/governance-seed/AGENTS.md` | Complete |
| `canonical/governance-seed/SPEECHACT.md` | Complete |
| `canonical/governance-seed/WRITING.md` | Complete |
| `canonical/governance-seed/CONTEXT-MODEL.md` | Complete |
| `canonical/governance-seed/QUALITY-SEMANTICS.md` | Complete |
| `canonical/governance-seed/SEMANTIC-TRACEABILITY.md` | Complete |
| `canonical/governance-seed/governance/release-policy.md` | Complete |
| `canonical/governance-seed/governance/drift-check.md` | Complete |
| `canonical/governance-seed/metadata/speechact-record.schema.json` | Complete |
| `canonical/governance-seed/prompts/release.md` | Complete |
| `tools/check-docs-freshness.sh` | Complete |
| `tools/check-speechacts.sh` | Complete |
| `tools/check-canonical-sync.sh` | Complete |
| `tools/package-release.sh` | Complete |
| Root-level dogfood copies | Complete |
| `specs/speechact-v2.md` | Draft |
| `examples/minimal-repo/` | Complete |
| GitLab CI governance stage | Active |

## Validation

Run before any release:

```sh
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
sh tools/check-canonical-sync.sh
```

## Next

See `ROADMAP.md` for upcoming milestones.
