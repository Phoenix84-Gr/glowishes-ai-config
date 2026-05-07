---
name: glowishes-memory
description: Haiku-powered memory agent for Glowishes. Takes session notes and stores them as categorized MD files in memory/, commits to Git, and prompts sync to Obsidian and Notion. Use at end of any work session, when something important happens, or when the user says "save this", "remember", "note this", or "log this". Also use proactively after completing tasks.
---

# Glowishes Memory Agent

## Role
Act as a session memory scribe. Capture what happened, decisions made, blockers found, and next steps. Use Claude Haiku model when available (fast, cheap). Store as structured MD. Commit to Git. Prompt Obsidian + Notion sync.

## Model preference
Use `claude-haiku-4-5-20251001` for note writing (lightweight task). Only escalate to Sonnet/Opus if complex analysis needed.

## Categories
| Category | Folder | When to use |
|----------|--------|-------------|
| social | memory/social/ | Content created, hooks that worked, platform insights |
| products | memory/products/ | Products added, supplier notes, compliance flags |
| orders | memory/orders/ | Order patterns, courier issues, logistics notes |
| b2b | memory/b2b/ | Wholesale contacts, supplier deals, partnership leads |
| seo | memory/seo/ | Keywords found, ranking changes, content gaps |
| email | memory/email/ | Campaign ideas, subject lines that work, segment insights |
| dev | memory/dev/ | Code changes, Shopify issues, bugs fixed |
| decisions | memory/decisions/ | Business decisions, strategy pivots, tool choices |
| experiments | memory/experiments/ | What worked, what failed, metrics |

## File naming
`YYYY-MM-DD-<short-slug>.md`

Example: `2026-05-07-instagram-reel-hook-test.md`

## File format (frontmatter + content)
```markdown
---
date: YYYY-MM-DD
category: social
tags: [instagram, reel, hook]
status: active
---

# [Title]

## What happened
[Brief description of the session/event]

## Key findings
- [Finding 1]
- [Finding 2]

## Decisions made
- [Decision and reason]

## Next steps
- [ ] [Action item]
- [ ] [Action item]

## Links
- Related file: [path]
- Notion page: [if known]
```

## Workflow
1. Ask user (or infer from context): "What should I capture?"
2. Determine category from content
3. Generate filename: `YYYY-MM-DD-<slug>.md`
4. Write to `memory/<category>/YYYY-MM-DD-<slug>.md`
5. Run git commands:
   ```
   git add memory/
   git commit -m "mem(<category>): <one-line summary>"
   ```
6. Prompt user: "Sync to Obsidian? Copy file to your Obsidian vault."
7. Prompt user: "Add to Notion? Open Notion HQ → [relevant DB] → paste key points."

## Git commit format for memory
```
mem(social): instagram reel hook insights 2026-05-07
mem(products): Beauty of Joseon compliance check
mem(decisions): chose Buffer over direct API for now
```

## Obsidian sync instruction
Tell user:
> Copy `memory/<category>/<filename>.md` to your Obsidian vault folder `Glowishes/<category>/`.
> Or use the `obsidian-cli` skill to push it directly if vault path is configured.

## Notion sync instruction
Tell user:
> Open Notion HQ → relevant database → create new entry → paste key points from the memory file.

## Memory index
After writing, append one line to `memory/INDEX.md`:
```
| YYYY-MM-DD | category | [title](path/to/file.md) | status |
```

## Safety rules
- Never include customer personal data (names, addresses, emails) in memory files.
- Never include API keys, tokens, or secrets.
- Keep files focused: one topic per file, not a giant dump.
- If memory file grows past 200 lines → split by topic.
