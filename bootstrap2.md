# Declaration

You are continuing work on the `speechactv2` repository.

The repository is in governance-seed mode. We now need to replace zero-length placeholder scripts in `tools/` with minimal working validation scripts.

# Context

SpeechAct v2 uses:

```text
canonical/ = authoritative reusable governance artifacts
repository root = active dogfood integration
tools/ = lightweight validation and packaging scripts
tags = official release boundaries
````

The current scripts may exist as empty placeholder files:

```text
tools/check-docs-freshness.sh
tools/check-speechacts.sh
tools/package-release.sh
```

# Objective

Implement minimal, POSIX-friendly shell scripts suitable for the first taggable release:

```text
v0.1.0-governance-seed
```

# Constraints

* Do not build a full CLI.
* Do not introduce external dependencies.
* Prefer `sh`, not Bash-only features.
* Scripts should fail clearly with useful messages.
* Scripts should be readable and small.
* Scripts should validate repository shape, not enforce complex semantics yet.
* Do not over-engineer.
* Update documentation if script behavior changes documented workflow.

# Deliverables

Implement:

```text
tools/check-docs-freshness.sh
tools/check-speechacts.sh
tools/check-canonical-sync.sh
tools/package-release.sh
```

Update `.gitlab-ci.yml` to run all validation checks.

Update root documentation to mention these scripts.

# Script Requirements

## `tools/check-docs-freshness.sh`

Should verify:

* `CHANGELOG.md` exists,
* `README.md` exists,
* `canonical/governance-seed/AGENTS.md` exists,
* `canonical/governance-seed/SPEECHACT.md` exists,
* the documentation freshness rule appears somewhere under `canonical/governance-seed/`.

## `tools/check-speechacts.sh`

Should verify:

* at least one `*.yaml` or `*.yml` speech act record exists under `examples/` or `metadata/records/`,
* each found record contains:

  * `id:`
  * `type:`
  * `summary:`
  * `status:`

Keep parsing simple. Grep is acceptable.

## `tools/check-canonical-sync.sh`

Should verify that active root dogfood files match canonical files where applicable.

Check these pairs:

```text
canonical/governance-seed/AGENTS.md -> AGENTS.md
canonical/governance-seed/SPEECHACT.md -> SPEECHACT.md
canonical/governance-seed/WRITING.md -> WRITING.md
canonical/governance-seed/CONTEXT-MODEL.md -> CONTEXT-MODEL.md
canonical/governance-seed/QUALITY-SEMANTICS.md -> QUALITY-SEMANTICS.md
canonical/governance-seed/SEMANTIC-TRACEABILITY.md -> SEMANTIC-TRACEABILITY.md
```

If files differ, print a clear message and exit nonzero.

## `tools/package-release.sh`

Should:

* create a temporary package directory,
* copy `canonical/governance-seed/` into it,
* include `README.md`, `CHANGELOG.md`, and `LICENSE` if present,
* create a `.tar.gz` archive under `dist/`,
* name the archive using the current git tag if available, otherwise `snapshot`.

Example output:

```text
dist/speechactv2-governance-seed-v0.1.0-governance-seed.tar.gz
```

# Validation Requirements

After implementing scripts, the following should pass:

```sh
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
sh tools/check-canonical-sync.sh
sh tools/package-release.sh
```

# Documentation Requirements

Update relevant docs to explain:

* scripts are intentionally lightweight,
* canonical files are authoritative,
* root files are dogfood synchronized copies,
* tags define official releases.

# Output Style

Produce copy-ready file contents.

For each changed file, use:

## path/to/file

Then provide the complete file content.

# Governance Handoff

End with:

## Governance Handoff Package

### Repository Intent

### Current Architecture Understanding

### Architecture Constraints

### Agent Operating Rules

### Documentation Freshness Rules

### Metadata Context Rules

### Semantic Quality Rules

### Known Risks

### Required Governance Checks

### Recommended Next Prompts
