---
name: memory
description: Time-filtered memory recall agent. Reads current time, calculates a cutoff, scans all memory/ files by their date frontmatter, and returns a structured summary of what happened in that window. Trigger: "remember last X hours", "what did we do last 12 hours", "recall today", "what happened this session".
---

# Memory Recall Skill

## Trigger phrases
- "remember last 12 hours"
- "remember last [N] hours"
- "what did we do today"
- "recall this session"
- "what happened in the last [timeframe]"

## Workflow

### Step 1 — Get current time
Read the current date/time from system context or note in session.
Calculate cutoff: `now - N hours`.

### Step 2 — Scan memory files
Read these index and file locations:
- `memory/INDEX.md` — master list of all memory entries
- `memory/sessions/` — session recaps (most relevant for "last N hours")
- `memory/decisions/` — decisions made
- `memory/social/` — social content notes
- `memory/products/` — product notes
- `memory/orders/` — order notes
- `memory/b2b/` — B2B notes
- `memory/seo/` — SEO notes
- `memory/email/` — email notes
- `memory/dev/` — dev notes
- `memory/experiments/` — experiment logs

### Step 3 — Filter by time window
Check each file's frontmatter `date:` field.
Include files where: `file_date >= cutoff_date`.

For "last 12 hours": include today's files + yesterday's files if session crossed midnight.
For "last 24 hours": include today + yesterday.
For "today": include files with today's date.
For "this session": read the most recent session file in `memory/sessions/`.

### Step 4 — Summarize
Output structure:

```
## Memory Recall — Last [N] hours ([start] → [now])

### Sessions
[Brief summary of session files in window]

### Decisions made
[List decisions from decisions/ files in window]

### Work done
[Categorized by domain: Social / Products / Email / Orders / B2B / Dev / SEO]

### Files created/modified
[List paths of memory files in window]

### Next steps (from latest session)
[Pull next steps from most recent session recap]
```

### Step 5 — If no files match
Say: "No memory files found for that time window. The memory/ folder may need populating — use the `glowishes-memory` skill at the end of each session."

## Reading approach
1. Read `memory/INDEX.md` first (fast overview)
2. Glob `memory/**/*.md` to find all files
3. Read only files whose date matches the window
4. Synthesize into the output structure above

## Haiku note
For heavy summarization of many files, prefer claude-haiku-4-5-20251001 (fast, cheap).
For complex synthesis or multi-session analysis, use Sonnet.

## Memory file date format
All memory files use frontmatter:
```yaml
---
date: YYYY-MM-DD
category: sessions|decisions|social|products|...
---
```

Match files where `date >= cutoff_date` (date-only precision — good enough for 12-24h windows).
For sub-day precision, also check `session_start` and `session_end` fields if present.

## Example output
```
## Memory Recall — Last 12 hours (2026-05-07 12:00 → 2026-05-08 00:30)

### Sessions
- 2026-05-08: Foundation session — built Glowishes Agentic OS

### Decisions made
- Chose Claude+Codex dual-agent architecture
- Priority: Social → SEO → Products
- Draft-only mode enforced

### Work done
Social: 3 platform skills created (Instagram, TikTok, Facebook)
Dev: 8 skills total created + Excalidraw diagram
Memory: System seeded with INDEX + decision log

### Files created
- memory/sessions/2026-05-08-session-recap.md
- memory/decisions/2026-05-07-agentic-os-architecture.md
- diagrams/glowishes-agentic-os.excalidraw

### Next steps
1. Set up Codex CLI
2. Open Excalidraw diagram
3. First Instagram content session
```
