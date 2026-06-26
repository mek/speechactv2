#!/bin/sh
set -e

CANONICAL_ROOT="canonical/governance-seed"
fail=0

check_sync() {
  canonical="$CANONICAL_ROOT/$1"
  root="$1"

  if [ ! -f "$canonical" ]; then
    echo "MISSING canonical: $canonical"
    fail=1
    return
  fi

  if [ ! -f "$root" ]; then
    echo "MISSING root copy: $root (should be a synchronized copy of $canonical)"
    fail=1
    return
  fi

  if ! diff -q "$canonical" "$root" > /dev/null 2>&1; then
    echo "DRIFT: $root differs from $canonical"
    diff "$canonical" "$root" || true
    fail=1
  fi
}

check_sync "AGENTS.md"
check_sync "SPEECHACT.md"
check_sync "WRITING.md"
check_sync "CONTEXT-MODEL.md"
check_sync "QUALITY-SEMANTICS.md"
check_sync "SEMANTIC-TRACEABILITY.md"

if [ "$fail" -eq 0 ]; then
  echo "check-canonical-sync: OK — all root copies match canonical"
fi

exit "$fail"
