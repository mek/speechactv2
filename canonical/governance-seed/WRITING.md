# Writing Rules

This file is the canonical authority for prose and documentation standards in repositories governed by SpeechAct v2.

## Two Writing Modes

### Narrative Mode

Used for: README, DECISIONS, CHANGELOG, ROADMAP, rationale sections, speech act `context` fields.

Rules:
- Write in complete sentences.
- Use active voice.
- Explain intent and motivation, not just what happened.
- Maximum two levels of headers.
- No trailing summaries ("In conclusion…").

### Technical Mode

Used for: ARCHITECTURE, specifications, schemas, tool documentation, structured lists.

Rules:
- Prefer tables and lists over prose where information is enumerable.
- Be precise: name types, formats, and constraints explicitly.
- One fact per bullet.
- No filler sentences.

## General Rules

- Define terms on first use.
- Reference canonical authorities rather than redefining their concerns.
- No multi-paragraph docstrings or comment blocks.
- Do not state the obvious. If removing a sentence wouldn't confuse a future reader, remove it.
- Do not reference the current task, issue number, or PR in document prose — that context belongs in commit messages and PR descriptions, where it will decay gracefully.

## Canonical File Tone

Canonical authority files are written in **Technical mode** for their rule sections and **Narrative mode** for introductory paragraphs that explain purpose and scope.
