# SpeechAct v2

SpeechAct v2 is a semantic governance framework for AI-assisted repositories.

It provides a reusable governance seed — a set of canonical files that any repository can copy in to establish consistent agent behavior, speech act traceability, and documentation standards.

## What is `canonical/`?

`canonical/governance-seed/` is the source of truth for governance files intended to be copied verbatim into other repositories. Each file is a **canonical authority** for exactly one concern:

| File | Authority |
|------|-----------|
| `AGENTS.md` | Agent operating rules |
| `SPEECHACT.md` | Speech act semantics |
| `WRITING.md` | Prose standards |
| `CONTEXT-MODEL.md` | Context inheritance model |
| `QUALITY-SEMANTICS.md` | Semantic validation rules |
| `SEMANTIC-TRACEABILITY.md` | Change traceability requirements |

Other documents must reference these authorities rather than redefine their concerns.

## What is `tools/`?

`tools/` contains validation and packaging scripts that run locally or in CI. Scripts are intentionally lightweight — POSIX sh, no external dependencies.

| Script | Purpose |
|--------|---------|
| `check-docs-freshness.sh` | Verify required canonical files are present and a freshness rule exists |
| `check-speechacts.sh` | Validate speech act records have required fields and valid values |
| `check-canonical-sync.sh` | Verify root-level dogfood files match their canonical counterparts |
| `package-release.sh` | Package the governance seed for distribution |

Run all three check scripts before tagging a release.

## Dogfood Pattern

This repository governs itself using the same governance seed it distributes. The six canonical authority files appear at two locations:

- `canonical/governance-seed/AGENTS.md` etc. — the authoritative source, distributed to other repos
- `AGENTS.md` etc. at the root — synchronized copies, demonstrating in-repo adoption

`check-canonical-sync.sh` enforces that these are identical. If you update a canonical file, copy it to the root (or vice versa) before committing.

## Tag-Based Releases

Releases are Git tags. No build artifacts are required for governance-seed releases.

To create a release:

1. Run validation: `sh tools/check-docs-freshness.sh && sh tools/check-speechacts.sh`
2. Update `CHANGELOG.md` with the release entry.
3. Tag the commit: `git tag -a v0.1.0-governance-seed -m "Release v0.1.0-governance-seed"`
4. Push the tag: `git push origin v0.1.0-governance-seed`

GitLab CI runs governance validation on every push and tag. See `.gitlab-ci.yml`.

## Consuming the Governance Seed

See `canonical/governance-seed/HOW-TO.md` for step-by-step instructions covering both new repositories and existing repositories.

The short version:

1. Copy `canonical/governance-seed/` from a tagged release into your repo (as `.governance/` or inline at root).
2. Record a `declaration` speech act in `speechacts/` capturing the adoption decision.
3. Reference canonical authority files from your project docs rather than duplicating their content.
4. Optionally copy `tools/` scripts for local validation.

See `examples/minimal-repo/` for a minimal reference implementation.

## License

SpeechAct v2 and the governance seed are licensed under the MIT License. See `LICENSE`.

## Repository Structure

```text
speechactv2/
  README.md                         this file
  CHANGELOG.md                      version history
  ROADMAP.md                        planned milestones
  STATUS.md                         current phase and completion state
  DECISIONS.md                      architectural decisions
  ARCHITECTURE.md                   system design and constraints

  canonical/governance-seed/        reusable governance files (copy into other repos)
    AGENTS.md                       agent operating rules
    SPEECHACT.md                    speech act semantics
    WRITING.md                      prose standards
    CONTEXT-MODEL.md                context inheritance model
    QUALITY-SEMANTICS.md            semantic validation rules
    SEMANTIC-TRACEABILITY.md        change traceability requirements
    governance/
      release-policy.md             how releases are created and validated
      drift-check.md                how to detect and correct semantic drift
    metadata/
      speechact-record.schema.json  JSON Schema for speech act records
    HOW-TO.md                       step-by-step adoption guide
    prompts/
      README.md                     prompt system concepts and runbook
      release.md                    AI agent prompt template for releases

  specs/speechact-v2.md             formal specification
  examples/minimal-repo/            reference implementation
  tests/semantic/                   semantic validation tests
  tests/fixtures/                   test fixtures
  tools/                            validation and packaging scripts
```
