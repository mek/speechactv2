# Declaration

You are concluding a development session.

# Objective

Update repository memory files.

# Update

- `meta/SESSION.md`
- `meta/CURRENT_STATE.md`
- `meta/NEXT_STEPS.md`
- `meta/KNOWN_ISSUES.md`

# Constraints

- Keep concise
- Remove stale state
- Preserve architectural truth
- Do not speculate
- Distinguish clearly between: implemented, planned, experimental, uncertain

# Process

1. Read current state of each meta file.
2. Read `CHANGELOG.md` and recent git log to understand what changed this session.
3. Update each file to reflect current truth only.
4. Remove any entries that are no longer accurate.

# Deliverables

- Updated `meta/SESSION.md` — clear the active work, note what was completed
- Updated `meta/CURRENT_STATE.md` — move completed items to implemented, add new gaps
- Updated `meta/NEXT_STEPS.md` — remove completed steps, re-order by priority
- Updated `meta/KNOWN_ISSUES.md` — remove resolved issues, add newly discovered ones
- Concise session summary (one paragraph, spoken to the next agent)
