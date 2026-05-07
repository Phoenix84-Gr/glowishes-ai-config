---
name: glowishes-git-daily
description: Daily git commit and push habit skill for Glowishes AI repo. Use at end of any work session, when user says "commit", "save to git", "push", "end session", or "what should I commit?". Reviews what changed, suggests a commit message, and reminds user to push.
---

# Glowishes Daily Git Skill

## Core rule (from Daily Habit commands.txt)
Push is manual. Nothing is automatic. Git never pushes without you telling it to.

The 3-command daily habit:
```powershell
git add .
git commit -m "feat(scope): what you built"
git push
```

That's it. `git push` alone works because the branch tracks `origin/main`.

## Workflow when triggered

### Step 1 — Check what changed
Run:
```powershell
git status
git diff --stat
```

Report to user: which files changed, which are new, which are deleted.

### Step 2 — Categorize changes
Determine the commit type and scope:

| Type | When |
|------|------|
| `feat` | New skill, new diagram, new content draft |
| `content` | Social content drafts, email drafts, blog drafts |
| `mem` | Memory files added or updated |
| `fix` | Fixed a skill, corrected a template |
| `chore` | Folder cleanup, .gitignore updates |
| `docs` | CLAUDE.md, AGENTS.md, README updates |
| `exp` | Experiments, tests |
| `shopify` | Product CSVs, import drafts, validators |

Scope = the area of work: `social`, `instagram`, `tiktok`, `products`, `email`, `orders`, `b2b`, `memory`, `dev`, `seo`

### Step 3 — Suggest commit message
Format:
```
<type>(<scope>): <imperative summary under 50 chars>

- what changed (bullet 1)
- why it matters (bullet 2)
```

Examples:
```
feat(social): add instagram reel skill with algorithm rules
content(instagram): add 3 SPF carousel drafts for May
mem(decisions): log choice to prioritize social over product import
shopify(products): add Beauty of Joseon draft CSV
feat(memory): add glowishes-memory skill with Haiku integration
```

### Step 4 — Confirm with user
Show:
- Files being committed
- Proposed commit message

Ask: "Commit with this message? (yes/edit/skip)"

### Step 5 — Run git commands
When user confirms:
```powershell
git add .
git commit -m "$(cat <<'EOF'
<type>(<scope>): <summary>

- <bullet 1>
- <bullet 2>

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"
git push
```

### Step 6 — Confirm push
After push succeeds, report:
```
✓ Committed: <commit hash short>
✓ Pushed to origin/main
Next: [suggest what to work on next or mention portfolio update if feature is significant]
```

## Safety rules
- Never commit `.env` files or files containing API keys
- Never commit `node_modules/`
- Never force push (`git push --force`)
- Never rebase published commits
- Always check `git status` before committing
- If there's nothing to commit, say so

## Branch conventions
For experimental work:
```powershell
git checkout -b exp/<short-tag>
# e.g.: exp/instagram-hook-test
# e.g.: exp/tiktok-reel-format-v2
```

Log experiments in `experiments.tsv`:
```
<commit_hash> | <metric> | keep/discard/crash | <description>
```

For Claude tasks (safe separate branch):
```powershell
git checkout -b claude/<task>
# e.g.: claude/social-content-system
```

For Codex tasks:
```powershell
git checkout -b codex/<task>
# e.g.: codex/product-import-validator
```

## .gitignore reminder
The following should NEVER be committed:
```
.env
.env.*        (except .env.example)
node_modules/
*.key
*.pem
shopify/product-import/input/private/
```

## Portfolio update reminder
After any significant feature (new skill, working content system, diagram, automation):
> Remind user: "Update portfolio — add this to README.md or LinkedIn project entry if it's showcase-worthy."

## Quick reference
```powershell
# Daily habit
git add .
git commit -m "type(scope): summary"
git push

# Check what will be committed
git status
git diff --stat

# New branch for experiment
git checkout -b exp/<tag>

# See recent commits
git log --oneline -10

# Undo last commit (keep changes)
git reset --soft HEAD~1
```
