# Minimal Repo Example

This directory demonstrates the minimum required structure for a repository governed by SpeechAct v2.

## What This Shows

- A `speechacts/` directory containing one speech act record
- Correct `sa-YYYY-MM-DD-NNN.yaml` naming and required fields

## Adopting the Governance Seed

1. Copy `canonical/governance-seed/` from a tagged release of the `speechactv2` repository into your repo.
2. Create a `speechacts/` directory.
3. Record your initial governance declaration as `sa-YYYY-MM-DD-001.yaml`.
4. Reference the canonical authority files from your project docs (do not copy their content).

## Validation

From the `speechactv2` root, run:

```sh
sh tools/check-speechacts.sh
```

This validates all `sa-*.yaml` files found in the repository tree, including those under `examples/`.
