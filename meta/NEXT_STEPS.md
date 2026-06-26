# Next Steps

## Immediate

1. Commit all current changes
2. Re-tag `v0.1.0-governance-seed` at HEAD (existing tag predates real content)
3. Record `sa-2026-06-26-002.yaml` — `declaration` for the dogfood sync pattern (D-0006)

## Near Term (v0.1.x)

4. Promote `specs/speechact-v2.md` from Draft to Accepted via speech act
5. Add `tests/fixtures/` with valid and invalid speech act YAML samples
6. Extend `check-speechacts.sh` with enum validation against `speechact-record.schema.json`

## Roadmap

- v0.2.0 — Schema-based YAML validation of speech act records
- v0.3.0 — Governance drift detection (`check-drift.sh`)
- v1.0.0 — Stable API, migration guide for consuming repositories
