#!/bin/sh
set -e

fail=0
found=0

# Search under root speechacts, examples, and metadata/records for speech act records
for dir in speechacts examples metadata/records; do
  if [ -d "$dir" ]; then
    for f in $(find "$dir" -name '*.yaml' -o -name '*.yml' 2>/dev/null); do
      found=$((found + 1))

      for field in id type summary status; do
        if ! grep -q "^${field}:" "$f"; then
          echo "MISSING field '${field}' in: $f"
          fail=1
        fi
      done

      # Validate id format: sa-YYYY-MM-DD-NNN
      id_val=$(grep "^id:" "$f" | head -1 | sed 's/^id:[[:space:]]*//')
      if ! echo "$id_val" | grep -qE '^sa-[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{3}$'; then
        echo "INVALID id format in: $f (got: $id_val, want: sa-YYYY-MM-DD-NNN)"
        fail=1
      fi

      # Validate type
      type_val=$(grep "^type:" "$f" | head -1 | sed 's/^type:[[:space:]]*//')
      case "$type_val" in
        declaration|assertion|directive|commissive|expressive) ;;
        *) echo "UNKNOWN type '$type_val' in: $f"; fail=1 ;;
      esac

      # Validate status
      status_val=$(grep "^status:" "$f" | head -1 | sed 's/^status:[[:space:]]*//')
      case "$status_val" in
        draft|accepted|rejected|superseded) ;;
        *) echo "UNKNOWN status '$status_val' in: $f"; fail=1 ;;
      esac
    done
  fi
done

if [ "$found" -eq 0 ]; then
  echo "WARNING: no speech act records found under examples/ or metadata/records/"
  exit 1
fi

if [ "$fail" -eq 0 ]; then
  echo "check-speechacts: OK — $found record(s) valid"
fi

exit "$fail"
