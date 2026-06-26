# Repository Memory System

## Declaration

The `meta/` directory provides persistent working memory for long-running AI-assisted development.

It exists to reduce:

- architectural drift
- repeated repository exploration
- wasted context window usage
- stale conversational assumptions
- implementation inconsistency across sessions

This directory is part of the repository architecture.

It is not optional documentation.

---

# Why This Exists

AI-assisted development sessions are often stateless.

Without persistent repository memory, each new session tends to repeat the same cycle:

```text
re-open repository
re-learn architecture
re-discover current implementation state
re-find known problems
reconstruct roadmap
```

This wastes:

* time
* tokens
* attention
* architectural continuity

The `meta/` system exists to preserve concise, durable repository cognition.

---

# Design Philosophy

The repository should store:

* architectural truth
* implementation state
* active work context
* known issues
* future intentions

inside the repository itself.

The goal is:

```text
small active context
+ persistent repository memory
```

NOT:

```text
massive persistent chat context
```

The repository becomes self-describing and resumable.

---

# Directory Structure

```text
meta/
  README.md
  SESSION.md
  CURRENT_STATE.md
  NEXT_STEPS.md
  KNOWN_ISSUES.md
  ARCHITECTURE_SUMMARY.md
```

---

# File Responsibilities

## SESSION.md

Short-lived active work state.

Contains:

* current feature
* current branch
* current implementation status
* failing tests
* immediate next task

This file changes frequently.

Think of it as:

> active engineering context

---

## CURRENT_STATE.md

High-level implementation snapshot.

Tracks:

* implemented systems
* missing systems
* major runtime capabilities
* parser status
* compatibility progress

This file should remain concise and stable.

Think of it as:

> repository status memory

---

## NEXT_STEPS.md

Ordered future work queue.

Tracks:

* immediate implementation priorities
* upcoming roadmap items
* deferred tasks
* blocked work

This prevents roadmap drift and random feature improvisation.

Think of it as:

> directional memory

---

## KNOWN_ISSUES.md

Repository problem tracking.

Tracks:

* parser conflicts
* runtime bugs
* architectural concerns
* compatibility gaps
* technical debt

This prevents repeated rediscovery of the same problems.

Think of it as:

> operational memory

---

## ARCHITECTURE_SUMMARY.md

Compressed architecture overview.

Tracks:

* package responsibilities
* runtime boundaries
* parser boundaries
* repository design constraints

This file should remain:

* small
* dense
* stable

It is intended to be loaded at the beginning of nearly every AI-assisted session.

Think of it as:

> architectural memory

---

# Session Workflow

## Beginning a Session

Before starting implementation work, review:

```text
AGENTS.md
meta/ARCHITECTURE_SUMMARY.md
meta/CURRENT_STATE.md
meta/SESSION.md
```

Then load the relevant implementation prompt.

---

## During a Session

Use:

* `prompts/`
* `skills/`

to constrain implementation behavior.

Do not rely on conversational memory alone.

---

## Ending a Session

At the end of implementation work, run:

```text
prompts/session-closeout.md
```

Update:

```text
meta/SESSION.md
meta/CURRENT_STATE.md
meta/NEXT_STEPS.md
meta/KNOWN_ISSUES.md
```

This step is mandatory for meaningful repository changes.

---

# Repository Memory Rules

## Keep Entries Concise

The `meta/` system is compressed operational memory.

Do not write:

* essays
* speculative plans
* large retrospectives

Prefer:

* short status summaries
* direct statements
* factual updates

---

## Remove Stale Information

Do not accumulate obsolete session data.

The repository memory should reflect:

> current truth

not historical sediment.

---

## Preserve Architectural Truth

Do not record speculative architecture as implemented reality.

Distinguish clearly between:

* implemented
* planned
* experimental
* uncertain

---

## Update Memory With Code Changes

Meaningful changes to:

* runtime behavior
* architecture
* parser structure
* compatibility
* roadmap direction

must update the relevant `meta/` files.

---

# Relationship To Other Repository Systems

## prompts/

Prompts define:

> what task is being executed

---

## skills/

Skills define:

> how implementation should behave

---

## meta/

The `meta/` system defines:

> repository memory across sessions

---

# Important Principle

This repository intentionally avoids relying on:

* giant persistent AI sessions
* unbounded conversational memory
* hidden context accumulation

Instead, repository state is externalized into durable files.

The repository itself becomes the long-term memory system.

---

# Final Thought

Large software projects fail slowly.

Architectural drift accumulates quietly.

AI-assisted development accelerates both:

* good structure
* bad entropy

The `meta/` system exists to ensure the repository remembers what it is trying to become before the implementation forgets.
