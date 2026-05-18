---
date: 2026-05-14
category: sessions
tags: [recap, worktree, education, git]
status: complete
---

# Session Recap — 2026-05-14

## Topic
- Babis asked for explanation of "Hand off chat to worktree" concept and its purpose
- Covered: git worktrees, isolated branches, parallel Claude sessions on same repo
- Use case: run experimental feature in worktree without touching main branch

## Key concept
Worktree = separate checkout of same repo in different folder.
Claude can work on `exp/instagram-hook-test` in a worktree while main stays clean.
No stash, no branch switch, no lost context.

## Action taken
- Education only — no code changes this session

## Next steps
- [ ] Try first worktree experiment: exp/ branch for Instagram hook generator
