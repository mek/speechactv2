# Test Fixtures

This directory holds fixtures for semantic tests.

## Intended Contents

- Valid speech act YAML files for positive test cases
- Invalid speech act YAML files (missing fields, wrong enums, bad id format) for negative test cases
- Sample canonical directory structures for docs-freshness tests

## Current State

No fixtures exist yet. Fixtures will be added alongside expanded semantic test coverage in v0.2.0.

## Fixture Naming

| Pattern | Purpose |
|---------|---------|
| `valid-*.yaml` | Speech acts that must pass `check-speechacts.sh` |
| `invalid-missing-*.yaml` | Speech acts missing a required field |
| `invalid-bad-*.yaml` | Speech acts with invalid enum or format values |
