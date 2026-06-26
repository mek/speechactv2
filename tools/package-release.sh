#!/bin/sh
set -e

VERSION=${1:-}

if [ -z "$VERSION" ]; then
  VERSION=$(git describe --tags --exact-match 2>/dev/null || echo "snapshot")
fi

OUTDIR="dist"
PACKAGE="speechactv2-governance-seed-${VERSION}"
TARBALL="${OUTDIR}/${PACKAGE}.tar.gz"
TMPDIR="${OUTDIR}/tmp-${PACKAGE}"

# Run validation before packaging
echo "Running governance validation..."
sh tools/check-docs-freshness.sh
sh tools/check-speechacts.sh
sh tools/check-canonical-sync.sh

mkdir -p "$TMPDIR"

# Copy governance seed
cp -r canonical/governance-seed/. "$TMPDIR/"

# Include root-level distribution files if present
for f in README.md CHANGELOG.md LICENSE; do
  [ -f "$f" ] && cp "$f" "$TMPDIR/$f"
done

mkdir -p "$OUTDIR"
COPYFILE_DISABLE=1 tar czf "$TARBALL" -C "$OUTDIR" "tmp-${PACKAGE}"
rm -rf "$TMPDIR"

echo "Created: $TARBALL"
ls -lh "$TARBALL"
