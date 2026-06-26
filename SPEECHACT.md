# SpeechAct v2 Semantics

This file is the canonical authority for speech act semantics in repositories governed by SpeechAct v2.

## What Is a Speech Act?

A speech act is an **operational repository primitive**: a record that captures intent, commitment, or observation at a semantically significant moment. Speech acts are the primary unit of traceability between intent and release.

Speech acts are stored as YAML files in a `speechacts/` directory, named `sa-YYYY-MM-DD-NNN.yaml`.

## Speech Act Types

| Type | Semantics | When to Use |
|------|-----------|-------------|
| `declaration` | Changes repository state by being uttered | Establishing a policy, naming a release, designating a canonical file |
| `assertion` | Records a fact, belief, or observation | Documenting current state, confirming a property holds |
| `directive` | Issues an instruction for agents or contributors | Mandating a process, constraining future work |
| `commissive` | Commits to future work | Roadmap items, planned features, accepted obligations |
| `expressive` | Records intent, rationale, or sentiment | Explaining a decision, capturing why not how |

## Required Fields

Every speech act record must have:

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier, format: `sa-YYYY-MM-DD-NNN` |
| `type` | enum | One of the five types above |
| `summary` | string | Human-readable summary (minimum 10 characters) |
| `status` | enum | One of: `draft`, `accepted`, `rejected`, `superseded` |

## Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `date` | date | ISO 8601 date the act was recorded |
| `author` | string | Who or what recorded the act |
| `supersedes` | string | ID of the speech act this replaces |
| `context` | string | Rationale or additional background |

## Lifecycle

```
draft → accepted
draft → rejected
accepted → superseded (by a new accepted act)
```

An act in `draft` status has no binding governance effect. An `accepted` act is binding on agents and contributors. A `superseded` act is no longer binding but must be preserved for traceability.

## Example

```yaml
id: sa-2026-06-26-001
type: declaration
summary: Establish SpeechAct v2 governance seed as canonical governance package
status: accepted
date: 2026-06-26
author: bootstrap
context: Initial governance establishment for the speechactv2 repository.
```

## Schema

The full JSON Schema for speech act records is at `metadata/speechact-record.schema.json`.
