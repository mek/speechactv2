# Semantic Tests

Semantic tests verify governance invariants that cannot be checked by syntax validation alone.

## Current Tests

Semantic tests are implemented as shell scripts in `tools/`:

| Script | What It Checks |
|--------|---------------|
| `tools/check-docs-freshness.sh` | Required canonical files are present |
| `tools/check-speechacts.sh` | Speech act records have required fields, valid enums, and correct id format |

## Running Tests

From the repository root:

```sh
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
```

Both scripts exit 0 on pass and non-zero on failure, suitable for CI.

## Future Tests

As the specification matures, semantic tests may expand to cover:

- Schema-based validation of speech act YAML against `speechact-record.schema.json`
- Drift detection: verifying accepted directives are implemented
- Cross-reference integrity: verifying `supersedes` references point to real speech act ids
