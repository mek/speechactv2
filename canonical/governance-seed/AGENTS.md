# Agent Operating Rules

This file is the canonical authority for AI agent behavior in repositories governed by SpeechAct v2.

## Before Acting

1. Read `ARCHITECTURE.md` to understand structural constraints.
2. Read `CONTEXT-MODEL.md` to understand how context is inherited.
3. Read accepted speech acts relevant to the task domain.
4. Identify which canonical authority files govern the concerns you will touch.

## Preserving Declared Intent

- Do not introduce changes that contradict any speech act with `status: accepted`.
- If a directive or declaration constrains the task, follow it. If you believe the constraint is wrong, record a new speech act (type: `expressive` or `directive`) and wait for it to be accepted before acting against the original.
- Architecture constraints in `ARCHITECTURE.md` are binding.

## Tracing Changes

- Record significant changes as speech acts in a `speechacts/` directory.
- Use `type: declaration` when establishing a new policy or state.
- Use `type: directive` when issuing an instruction for future work.
- Use `type: commissive` when committing to work not yet done.
- Significant = anything that would surprise a future agent reading the repository.

## Documentation Freshness

- If a change affects the meaning of a canonical authority file's concern, update that file in the same work unit.
- If no documentation update is needed, state that explicitly in the commit message or PR description.
- Never leave canonical files in a state that contradicts the current implementation.

## Canonical Authority Boundary

Do not redefine concerns owned by a canonical authority. The canonical authorities are:

| Concern | Authority File |
|---------|---------------|
| Agent behavior | `AGENTS.md` (this file) |
| Speech act semantics | `SPEECHACT.md` |
| Prose standards | `WRITING.md` |
| Context inheritance | `CONTEXT-MODEL.md` |
| Semantic validation | `QUALITY-SEMANTICS.md` |
| Change traceability | `SEMANTIC-TRACEABILITY.md` |

## Before Releasing

- Run `check-docs-freshness.sh` and `check-speechacts.sh`.
- Ensure `CHANGELOG.md` has an entry for the release version.
- Confirm no accepted directive is left unimplemented for this release scope.

## Scope Discipline

- Do not introduce abstractions beyond what the task requires.
- Do not build for hypothetical future requirements.
- Do not add features, refactor, or clean up outside the explicit task scope.
