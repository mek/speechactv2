# Release Policy

Official releases must be semantically traceable. This document defines the process.

## Release Boundary

A release is a Git tag. The tag is the authoritative record. No separate release artifact is required for governance-seed releases.

## Tag Format

```
vMAJOR.MINOR.PATCH
vMAJOR.MINOR.PATCH-label
```

Examples: `v0.1.0-governance-seed`, `v1.0.0`, `v1.2.0-beta`

Tags are immutable. If a release has an error, create a new patch tag; do not move or delete the original.

## Release Checklist

Before tagging:

1. All governance validation passes:
   ```sh
   sh tools/check-docs-freshness.sh
   sh tools/check-speechacts.sh
   ```
2. `CHANGELOG.md` has an entry for this version with the release date.
3. No accepted `directive` speech act targeting this release scope is left unimplemented.
4. A `declaration` speech act for the release exists (or is recorded at release time).
5. `STATUS.md` reflects current completion state.

## Creating the Tag

```sh
git tag -a v0.1.0-governance-seed -m "Release v0.1.0-governance-seed"
git push origin v0.1.0-governance-seed
```

## CI Enforcement

GitLab CI runs governance validation on every tag push via the `validate:governance` job. A tag that fails CI is not considered an official release even if the tag exists.

## Consuming Repositories

When a repository consumes the governance seed from a specific tag, it should record the source tag in its own `DECISIONS.md` or a speech act for traceability.
