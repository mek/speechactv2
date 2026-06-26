# Semantic Drift Check

Semantic drift occurs when the repository's implementation, documentation, or behavior diverges from its declared intent without a corresponding update to governance records.

## When to Run a Drift Check

- Before any release
- When onboarding a new agent or contributor
- After any significant refactor
- When a speech act is superseded (verify the superseding act is fully implemented)

## Drift Check Procedure

### 1. Run Automated Validation

```sh
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
```

Both must pass with exit code 0.

### 2. Review Accepted Directives

Read all speech acts with `type: directive` and `status: accepted`. For each:
- Confirm the instruction has been implemented or is explicitly deferred to a future release.
- If deferred, confirm a `commissive` act or roadmap entry documents the deferral.

### 3. Review Accepted Declarations

Read all speech acts with `type: declaration` and `status: accepted`. For each:
- Confirm the declared state still matches the actual repository state.
- If the state has changed, record a new `declaration` and mark the old one `superseded`.

### 4. Check CHANGELOG Completeness

- Every merged change of governance significance should appear in `CHANGELOG.md`.
- The most recent tag should have a corresponding `CHANGELOG.md` entry.

### 5. Check Architecture Conformance

- Review `ARCHITECTURE.md` constraints.
- Confirm no recent change violates a constraint without a corresponding decision record.

## Remediation

When drift is found:

1. If the implementation is wrong: fix the implementation.
2. If the governance record is wrong: update it and record a speech act explaining the correction.
3. If both are valid but diverged: make an explicit decision (record in `DECISIONS.md`) about which is authoritative, then align the other.
