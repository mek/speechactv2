# Declaration

You are preparing an official SpeechAct v2 release.

# Context

Read the following files before acting:

1. `ARCHITECTURE.md` — understand release model and constraints
2. `CHANGELOG.md` — understand what is already released
3. `canonical/governance-seed/governance/release-policy.md` — understand the release process
4. `canonical/governance-seed/AGENTS.md` — understand your operating rules
5. `STATUS.md` — understand current completion state
6. `speechacts/` — review accepted speech acts relevant to this release

# Release Checklist

Before tagging, verify each item:

- [ ] `sh tools/check-docs-freshness.sh` passes (exit 0)
- [ ] `sh tools/check-speechacts.sh` passes (exit 0)
- [ ] `CHANGELOG.md` has an entry for this version with today's date
- [ ] All accepted `directive` speech acts for this release scope are implemented or explicitly deferred
- [ ] `STATUS.md` reflects the current completion state

# Actions

1. Run both validation scripts and report results.
2. If validation fails, identify and fix each failure before proceeding.
3. Update `CHANGELOG.md` with the release entry if not already done.
4. Record a `declaration` speech act for the release:
   - `id`: next available `sa-YYYY-MM-DD-NNN`
   - `type`: declaration
   - `summary`: Release vX.Y.Z[-label]
   - `status`: accepted
   - `date`: today's date
5. Report the exact tag command to run. Do not create the tag yourself unless explicitly instructed.

# Constraints

- Do not tag if any validation script fails.
- Do not modify canonical files during a release unless a pre-release speech act authorizes the change.
- State explicitly if any item on the checklist cannot be verified.
