# Decisions

## D-0001: SpeechAct v2 is spec-first

The governance framework is defined through specifications and canonical documents before any tooling is built. Implementation must conform to the spec, not drive it.

## D-0002: Tags are the only official release boundary

GitLab releases and CI artifacts may be added later, but the Git tag is the authoritative record of a release. This keeps the release process portable across hosting platforms and independent of CI availability.

## D-0003: Shell scripts over heavy tooling

Validation tools are POSIX sh scripts with no external dependencies. This ensures the tools run in any environment that can execute shell (including minimal CI images like `alpine:latest`) without a package install step.

## D-0004: Canonical files must be copy-safe

Files in `canonical/governance-seed/` must contain no references to this repository's name, URL, or structure. They are designed to be copied verbatim into any repository and remain correct.

## D-0005: Each concern has exactly one canonical authority

Each governance concern (agent behavior, speech act semantics, writing standards, etc.) is owned by exactly one file. Other documents reference canonical authorities; they do not redefine concerns. This prevents governance drift from duplicated, potentially contradictory rules.

## D-0006: Root-level governance files are synchronized dogfood copies

The six canonical authority files (`AGENTS.md`, `SPEECHACT.md`, `WRITING.md`, `CONTEXT-MODEL.md`, `QUALITY-SEMANTICS.md`, `SEMANTIC-TRACEABILITY.md`) appear at the repository root as exact copies of their counterparts in `canonical/governance-seed/`. `check-canonical-sync.sh` enforces they remain identical. This demonstrates in-repo adoption of the governance seed while keeping `canonical/` as the single authoritative source.
