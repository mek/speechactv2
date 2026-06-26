# How to Adopt the Governance Seed

This guide covers installing SpeechAct v2 governance into a repository. Two scenarios are covered: a new repository and an existing repository.

---

## What "Adopting" Means

Adopting the governance seed means copying the contents of `canonical/governance-seed/` into your repository and committing to its conventions:

- Canonical authority files define agent behavior, speech act semantics, writing standards, context model, semantic quality rules, and traceability requirements.
- Speech acts record meaningful intent and changes.
- Tags are the official release boundary.
- Validation scripts confirm governance invariants before release.

You do not need to adopt everything at once. The minimum viable adoption is the six authority files plus one speech act recording the decision to adopt.

---

## Scenario A: New Repository

### 1. Initialize the repository

```sh
git init my-repo
cd my-repo
```

### 2. Copy the governance seed

From a tagged release of the governance seed, copy the `canonical/governance-seed/` directory into your repository. The recommended placement is directly at the root as `.governance/`, or inline (copying the files directly to root level):

```sh
# Option 1: dedicated subdirectory
cp -r /path/to/governance-seed/.  .governance/

# Option 2: inline at root (dogfood pattern — the repo governs itself)
cp /path/to/governance-seed/AGENTS.md .
cp /path/to/governance-seed/SPEECHACT.md .
# ... repeat for all six authority files
```

The six authority files are: `AGENTS.md`, `SPEECHACT.md`, `WRITING.md`, `CONTEXT-MODEL.md`, `QUALITY-SEMANTICS.md`, `SEMANTIC-TRACEABILITY.md`.

### 3. Create the minimum required root documents

```sh
touch README.md CHANGELOG.md DECISIONS.md
```

At minimum, `README.md` and `CHANGELOG.md` must exist (required by `check-docs-freshness.sh`).

### 4. Create the speech acts directory and record your first act

```sh
mkdir -p speechacts
```

Create `speechacts/sa-YYYY-MM-DD-001.yaml`:

```yaml
id: sa-YYYY-MM-DD-001
type: declaration
summary: Adopt SpeechAct v2 governance seed
status: accepted
date: YYYY-MM-DD
author: your-name
context: Initial governance adoption. Establishes canonical authority files as the source of truth for agent behavior, speech act semantics, writing standards, context model, semantic quality, and traceability.
```

### 5. Optionally copy the validation tools

```sh
mkdir -p tools
cp /path/to/governance-seed-repo/tools/check-docs-freshness.sh tools/
cp /path/to/governance-seed-repo/tools/check-speechacts.sh tools/
chmod +x tools/*.sh
```

Run them to confirm your setup is valid:

```sh
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
```

### 6. Commit

```sh
git add .
git commit -m "adopt: SpeechAct v2 governance seed"
```

---

## Scenario B: Existing Repository

Adopting governance into an existing repository is incremental. The goal is to establish canonical authority files without disrupting existing work.

### 1. Audit for conflicts

Before copying, check whether your repository already has files named `AGENTS.md`, `SPEECHACT.md`, `WRITING.md`, `CONTEXT-MODEL.md`, `QUALITY-SEMANTICS.md`, or `SEMANTIC-TRACEABILITY.md`. If so, review their content against the canonical versions and decide whether to:

- Replace them with the canonical versions (preferred)
- Merge content into the canonical format
- Keep them under a different name and reference the canonical authority

Document your decision in `DECISIONS.md`.

### 2. Copy the governance seed

Place the governance seed files where they will not collide with existing structure. A dedicated subdirectory is safer for existing repositories:

```sh
cp -r /path/to/governance-seed/. .governance/
```

Alternatively, copy the six authority files to root if there are no conflicts.

### 3. Record the adoption decision

Create `speechacts/sa-YYYY-MM-DD-001.yaml` (or the next available sequence number):

```yaml
id: sa-YYYY-MM-DD-001
type: declaration
summary: Adopt SpeechAct v2 governance seed
status: accepted
date: YYYY-MM-DD
author: your-name
context: Governance adoption into existing repository. Canonical authority files placed at [location]. Existing [conflicting file] superseded/merged/retained — see DECISIONS.md D-000X.
```

### 4. Align existing documentation

Existing documentation does not need to be rewritten immediately. The priority is:

1. Ensure no existing document *contradicts* a canonical authority file.
2. Add references from existing docs to the relevant canonical authority where they overlap.
3. Remove duplicate governance rules from non-authority files over time.

### 5. Add validation tools

Copy `check-docs-freshness.sh` and `check-speechacts.sh` to `tools/` and confirm they pass. Adjust `check-docs-freshness.sh` if your canonical files live in a subdirectory rather than root.

### 6. Commit incrementally

Each meaningful step (authority files added, first speech act recorded, existing doc aligned) is a separate commit. This preserves traceability through git history.

---

## Staying in Sync

When the governance seed releases a new version:

1. Review the release changelog for breaking changes to canonical authority files.
2. Copy updated files from the new release into your repository.
3. If you use the dogfood pattern (root-level copies), update both the canonical location and the root copies.
4. Record a speech act noting the governance seed version bump.

---

## Minimum Viable Adoption Checklist

- [ ] Six canonical authority files are present
- [ ] `README.md` and `CHANGELOG.md` exist
- [ ] At least one speech act records the adoption decision
- [ ] `check-docs-freshness.sh` passes (if using validation tools)
- [ ] `check-speechacts.sh` passes (if using validation tools)
