# Roadmap

## v0.1.0-governance-seed — 2026-06-26 (current)

Establish the canonical governance seed package.

- Canonical authority files (AGENTS, SPEECHACT, WRITING, CONTEXT-MODEL, QUALITY-SEMANTICS, SEMANTIC-TRACEABILITY)
- Governance sub-documents (release policy, drift check)
- Speech act record schema
- Validation tools (shell scripts)
- GitLab CI governance validation
- Formal specification (speechact-v2.md)

## v0.2.0 — Schema Validation

Strengthen the `check-speechacts.sh` tool with schema-based validation of speech act records against `speechact-record.schema.json`.

- Use a minimal POSIX-compatible YAML parser or lint approach
- Validate enum values for `type` and `status`
- Validate `id` format pattern

## v0.3.0 — Governance Drift Detection

Automate detection of semantic drift between accepted speech acts and the current repository state.

- `check-drift.sh` comparing accepted directives against implementation
- Integration into CI drift-check stage

## v1.0.0 — Stable API

Stabilize the governance seed API:

- Freeze canonical file names and required fields
- Publish versioned releases of the governance seed package
- Provide migration guide from pre-1.0 usage
