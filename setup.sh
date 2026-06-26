mkdir -p canonical/governance-seed
git mv AGENTS.md SPEECHACT.md WRITING.md CONTEXT-MODEL.md QUALITY-SEMANTICS.md SEMANTIC-TRACEABILITY.md canonical/governance-seed/
git mv governance metadata prompts canonical/governance-seed/

mkdir -p tools
touch tools/check-docs-freshness.sh
touch tools/check-speechacts.sh
touch tools/package-release.sh
chmod +x tools/*.sh

git add .
git commit -m "refactor: establish canonical governance seed package"
