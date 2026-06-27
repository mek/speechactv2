#!/bin/sh
set -e

CANONICAL_ROOT="canonical/governance-seed"
fail=0

check() {
  if [ ! -f "$1" ]; then
    echo "MISSING: $1"
    fail=1
  fi
}

# Root documents
check "README.md"
check "CHANGELOG.md"
check "LICENSE"

# Canonical authority files
check "$CANONICAL_ROOT/AGENTS.md"
check "$CANONICAL_ROOT/SPEECHACT.md"
check "$CANONICAL_ROOT/WRITING.md"
check "$CANONICAL_ROOT/CONTEXT-MODEL.md"
check "$CANONICAL_ROOT/QUALITY-SEMANTICS.md"
check "$CANONICAL_ROOT/SEMANTIC-TRACEABILITY.md"

# Governance sub-documents
check "$CANONICAL_ROOT/governance/release-policy.md"
check "$CANONICAL_ROOT/governance/drift-check.md"
check "$CANONICAL_ROOT/metadata/speechact-record.schema.json"

# Verify a documentation freshness rule exists somewhere under canonical/
if ! grep -rl "freshness" "$CANONICAL_ROOT/" > /dev/null 2>&1; then
  echo "MISSING: no documentation freshness rule found under $CANONICAL_ROOT/"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "check-docs-freshness: OK — all required files present and freshness rule found"
fi

exit "$fail"
