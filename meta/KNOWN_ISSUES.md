# Known Issues

## Tools

### check-speechacts.sh uses grep, not a YAML parser

Risk: multi-line field values or non-standard YAML formatting can produce false negatives (field present but not detected).

Scope: accepted for v0.1.0. Fix in v0.2.0 with proper schema-based validation.

## Releases

### v0.1.0-governance-seed tag predates fleshed-out content

The tag was created during the initial scaffold commit before canonical files had real content.

Fix: delete and re-tag at current HEAD after committing bootstrap work.

## Spec

### specs/speechact-v2.md is Draft

Not yet formally reviewed or accepted via a speech act.

Fix: review against canonical files, record an `assertion` or `declaration` speech act to accept it.

## Tests

### tests/fixtures/ and tests/semantic/ are stubs

No executable test scripts exist beyond the tools/ validation scripts. The `tests/` directory has README files only.

Scope: accepted for v0.1.0. Expand in v0.2.0.
