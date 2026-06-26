# Semantic Traceability

This file is the canonical authority for change traceability in repositories governed by SpeechAct v2.

## The Traceability Chain

Every significant change must be traceable through this chain:

```
Intent → Decision → Implementation → Release
(speech act)  (DECISIONS.md)  (commit)       (tag)
```

- **Intent**: captured as a speech act (`declaration`, `directive`, or `commissive`)
- **Decision**: recorded in `DECISIONS.md` when an architectural choice is made
- **Implementation**: a commit whose message references the speech act or decision
- **Release**: a Git tag corresponding to a `CHANGELOG.md` entry

Not every commit requires a speech act. Routine maintenance and typo fixes do not. The threshold is: would a future agent reading the repository be surprised by this change without a record of its intent?

## Speech Acts as Traceability Anchors

Speech acts are the primary traceability primitive because they:

- Survive across sessions and agent changes
- Are human-readable and machine-checkable
- Capture intent before implementation (preventing retrofitted justification)
- Form a partial order: later acts can reference and supersede earlier ones

## Traceability Requirements

| Change Type | Required Traceability |
|-------------|----------------------|
| New policy or constraint | Accepted `declaration` speech act |
| Mandatory process change | Accepted `directive` speech act |
| Planned future work | `commissive` speech act (may remain `draft`) |
| Architectural decision | Entry in `DECISIONS.md` |
| Release | Tag + `CHANGELOG.md` entry |
| Breaking change | Prior `directive` or `declaration` that established the new behavior |

## Reading Traceability

To trace a change backward from a release:

1. Find the tag in `git log --tags`.
2. Find the `CHANGELOG.md` entry for that tag.
3. Identify relevant speech acts by scanning `speechacts/` for acts accepted before the tag date.
4. Read `DECISIONS.md` for any decisions that shaped the implementation.

To trace forward from an intent:

1. Find the speech act by `id`.
2. Search commit messages for references to the speech act `id`.
3. Confirm the change appears in a `CHANGELOG.md` release entry.
