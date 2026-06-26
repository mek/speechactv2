# Declaration

You are helping continue development of the `speechactv2` repository.

This is not a generic documentation repo. It is the official dogfood repository for SpeechAct v2: a semantic governance framework for AI-assisted repositories.

Important: we are still in governance-seed mode. Do not build a full CLI yet. The next goal is a clean, taggable v0.1.0 governance package.

# Context

The repository has been initialized as a spec-first governance repository.

Core idea:

- repositories are semantic systems,
- speech acts are operational repository primitives,
- AI agents must preserve declared intent,
- meaningful changes should be traceable,
- tags are the primary release boundary,
- GitLab CI/CD may later automate releases,
- `canonical/` stores reusable official governance seed files,
- `tools/` stores validation and packaging scripts,
- releases are represented primarily through Git tags.

Current intended structure:

```text
speechactv2/
  README.md
  CHANGELOG.md
  ROADMAP.md
  STATUS.md
  DECISIONS.md
  ARCHITECTURE.md

  canonical/
    governance-seed/
      AGENTS.md
      SPEECHACT.md
      WRITING.md
      CONTEXT-MODEL.md
      QUALITY-SEMANTICS.md
      SEMANTIC-TRACEABILITY.md
      governance/
      metadata/
      prompts/

  specs/
    speechact-v2.md

  examples/
    minimal-repo/

  tests/
    semantic/
    fixtures/

  tools/
    check-docs-freshness.sh
    check-speechacts.sh
    package-release.sh
````

# Objective

Prepare the repository for the first tag-based release:

```text
v0.1.0-governance-seed
```

# Constraints

* Do not introduce heavy tooling yet.
* Do not create speculative architecture.
* Prefer shell scripts and plain markdown.
* Keep canonical files reusable by other repositories.
* Treat `canonical/governance-seed/` as the source of truth for files that will be copied into other repos.
* Treat tags as official release boundaries.
* GitLab releases or artifacts may come later.
* Every meaningful change must consider documentation freshness.
* If no documentation update is needed, state that explicitly.

* Avoid duplicating governance rules across documents.
* Each major concern should have a canonical authority document.

Canonical authorities:

- AGENTS.md → agent behavior
- SPEECHACT.md → speech act semantics
- WRITING.md → prose standards
- CONTEXT-MODEL.md → context inheritance
- QUALITY-SEMANTICS.md → semantic validation
- SEMANTIC-TRACEABILITY.md → change traceability

Other documents should reference canonical authorities rather than redefine them.

# Deliverables

Generate or update:

```text
canonical/governance-seed/
tools/check-docs-freshness.sh
tools/check-speechacts.sh
tools/package-release.sh
.gitlab-ci.yml
```

Also ensure root docs explain:

* what `canonical/` is,
* what `tools/` is,
* how tag-based releases work,
* how another repo should consume the governance seed.

# Validation Requirements

The first validation should be intentionally simple:

* required canonical files exist,
* speech act examples have required fields,
* changelog exists,
* release policy exists,
* documentation freshness rule exists somewhere canonical.

# Current Repository State

The repository already contains an initial governance scaffold.

Assume the following exist and should be evolved rather than replaced:

- README.md
- CHANGELOG.md
- ROADMAP.md
- STATUS.md
- DECISIONS.md
- ARCHITECTURE.md
- AGENTS.md
- SPEECHACT.md
- WRITING.md
- CONTEXT-MODEL.md
- QUALITY-SEMANTICS.md
- SEMANTIC-TRACEABILITY.md

Prefer modification over regeneration.

# Output Style

Produce copy-ready repository artifacts.

When creating files:

1. Show the repository tree first.
2. Separate each file with:

## path/to/file

3. Emit complete file contents.
4. Explain rationale briefly.
5. Prefer incremental changes over wholesale replacement.

# Documentation Requirements

Update relevant docs in the same unit of work.

# Governance Handoff

End your response with:

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
