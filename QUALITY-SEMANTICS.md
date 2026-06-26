# Semantic Quality

This file is the canonical authority for semantic validation in repositories governed by SpeechAct v2.

## Definition

A change is **semantically valid** when it:

1. Is consistent with all speech acts having `status: accepted`.
2. Preserves or intentionally updates constraints declared in `ARCHITECTURE.md`.
3. Updates affected documentation in the same work unit — or explicitly states that no update is needed.
4. Is traceable to an intent (a speech act, an issue, or a documented decision).
5. Does not duplicate a concern owned by a canonical authority file.

A change that violates any of these conditions is a **semantic defect**, distinct from a syntactic or functional bug.

## Semantic Quality Checks

Before committing or releasing, verify:

| Check | Pass Condition |
|-------|---------------|
| Intent alignment | No accepted speech act is contradicted |
| Architecture conformance | No `ARCHITECTURE.md` constraint is violated |
| Documentation freshness | Affected docs updated, or non-update explicitly stated |
| Traceability anchor | A speech act, issue, or decision record exists for the change |
| No authority duplication | No concern is redefined that a canonical file already owns |

## Common Semantic Defects

- Implementing something that contradicts an accepted `directive` without superseding it first.
- Changing the meaning of a canonical file without recording a speech act.
- Leaving `CHANGELOG.md` out of date when releasing.
- Adding governance rules to a non-authority document (e.g., writing agent rules in README).

## Remediation

When a semantic defect is found:

1. Identify which invariant was violated.
2. Determine whether the code or the governance record needs correction.
3. If the change is intentionally diverging from an existing act, record a new `declaration` or `directive` that supersedes it and update `status: superseded` on the old act.
4. Update documentation and re-run validation tools.
