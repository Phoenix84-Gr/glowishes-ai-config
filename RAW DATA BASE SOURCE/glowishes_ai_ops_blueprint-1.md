---
title: "Glowishes AI Ops Blueprint"
subtitle: "Windows-first beginner guide for Codex + Claude Code + Shopify + Notion + Social + Draft Automation"
author: "Prepared for Alex"
date: "2026-05-07"
geometry: margin=0.7in
mainfont: DejaVu Sans
monofont: DejaVu Sans Mono
fontsize: 10pt
colorlinks: true
linkcolor: blue
urlcolor: blue
---

# Glowishes AI Ops Blueprint

## Executive summary

You are on Windows, your Shopify theme/project is not connected to GitHub yet, and your first priorities are:

1. Social content creator system.
2. Product import system.
3. Shopify email campaign drafting.
4. Notion as a light business operating system.
5. ACS and BOX NOW draft logistics workflows.
6. Draft-only mode for now - no automatic posting, product publishing, email sending, price changes, inventory changes, refunds, or fulfillment.

The correct setup is not to let one AI agent control the store. The correct setup is:

```text
Claude Code = planner, writer, content strategist, workflow designer, code explainer.
Codex = technical implementer, reviewer, validator, script builder, Shopify/API checker.
You = final approval before anything touches customers, Shopify, social channels, price, stock, or logistics.
```

The safest beginner architecture:

```text
Windows + VS Code
GitHub private repo
Claude Code in VS Code
Codex CLI / Codex IDE / Codex app
Shopify AI Toolkit via MCP
Notion MCP
Draft files first: CSV, Markdown, JSON, Notion drafts, campaign drafts
Manual approval before publishing/importing/sending
```

---

# 1. What each tool is for

## 1.1 Claude Code

Use Claude Code when the task needs explanation, structure, writing, reasoning, or multi-file understanding.

Best uses for you:

- Build a social content calendar.
- Write Greek/English product page drafts.
- Create campaign concepts for Instagram, TikTok, and Shopify Email.
- Create Notion database structures.
- Explain code line by line.
- Create standard operating procedures.
- Plan bigger automations before Codex implements them.
- Review whether the output makes sense commercially and operationally.

## 1.2 Codex

Use Codex when the task is more technical, validation-heavy, or code-review-heavy.

Best uses for you:

- Create product CSV validators.
- Create Shopify product import preparation scripts.
- Check if a CSV is safe before Shopify import.
- Build scripts that transform supplier Excel/CSV files into Shopify-ready drafts.
- Review theme code later when your Shopify theme is connected to GitHub.
- Check scripts for bugs, risky file access, unsafe API writes, and missing tests.
- Create GitHub pull request reviews.

## 1.3 How they fill each other's gap

| Workflow | Claude Code role | Codex role |
|---|---|---|
| Social content | Strategy, hooks, calendar, captions | Template automation, file generation, QA checks |
| Product import | Field logic, product-page wording, compliance checklist | CSV validator, transformation script, duplicate detection |
| Shopify email | Campaign idea, segmentation copy, subject lines | Template checks, data export validation, QA checklist |
| Notion setup | Database design, SOPs, workflow mapping | Sync scripts, validation scripts, automation checks |
| Logistics | Process map and customer messaging | ACS/BOX NOW CSV draft preparation |
| GitHub workflow | Explains branches and PRs | Reviews diffs and flags technical risk |

---

# 2. Important beginner vocabulary

## Agent

An AI assistant that can use tools, read files, edit files, and sometimes run commands.

## Skill

A reusable folder of instructions, templates, references, and optional scripts. Instead of repeating long prompts every day, you create a skill once and the agent loads it when needed.

## MCP

Model Context Protocol. This connects AI tools to external systems such as Shopify, Notion, GitHub, Figma, browser tools, and documentation.

## Git

A local version history system. If an AI makes a wrong change, Git lets you see what changed and roll back.

## GitHub

A cloud place for your Git repository. It enables pull requests, review, rollback, and later Codex/Claude automation.

## Branch

A safe separate line of work. Never let Claude and Codex edit the same branch at the same time.

## Worktree

A way to have two folders for the same GitHub project, each on a different branch. Perfect for running Claude and Codex in parallel.

---

# 3. Your Windows setup

## 3.1 Install base tools

Open Windows PowerShell as normal user, not admin unless needed.

```powershell
winget install --id Microsoft.VisualStudioCode
winget install --id Git.Git
winget install --id GitHub.cli
winget install --id OpenJS.NodeJS.LTS
```

Restart PowerShell, then check:

```powershell
git --version
node --version
npm --version
gh --version
code --version
```

Login to GitHub:

```powershell
gh auth login
```

Recommended Git identity:

```powershell
git config --global user.name "Alex"
git config --global user.email "your-email@example.com"
git config --global init.defaultBranch main
```

## 3.2 Install Codex CLI

```powershell
npm i -g @openai/codex
codex
```

When asked, sign in with your ChatGPT/OpenAI account.

## 3.3 Install Claude Code

Official Windows PowerShell installer:

```powershell
irm https://claude.ai/install.ps1 | iex
```

Then open VS Code, install the Claude Code extension, and sign in.

## 3.4 Optional but recommended later: WSL2

For now, stay native Windows. Later, if Node/Python tooling becomes painful, install WSL2 with Ubuntu. Do not start with WSL2 unless you are comfortable with terminals.

---

# 4. Create your first private GitHub repo

You said your Shopify code is not connected to GitHub. Start with an operations repo, not the live Shopify theme.

```powershell
mkdir C:\AI
cd C:\AI
mkdir glowishes-ai-ops
cd glowishes-ai-ops
git init
```

Create starter files:

```powershell
ni README.md
ni AGENTS.md
ni CLAUDE.md
ni .gitignore
```

Create the private GitHub repository:

```powershell
gh repo create glowishes-ai-ops --private --source=. --remote=origin --push
```

Open the project:

```powershell
code .
```

---

# 5. Recommended repository structure

Create this structure inside `C:\AI\glowishes-ai-ops`:

```text
glowishes-ai-ops/
  README.md
  AGENTS.md
  CLAUDE.md
  .gitignore
  .env.example

  .agents/
    skills/
      glowishes-social-content-creator/
        SKILL.md
      shopify-product-import-draft-qa/
        SKILL.md
      shopify-email-campaign-drafter/
        SKILL.md
      cosmetics-compliance-guard/
        SKILL.md
      acs-boxnow-logistics-draft/
        SKILL.md
      ai-agent-handoff-review/
        SKILL.md

  .claude/
    skills/
      glowishes-social-content-creator/
        SKILL.md
      shopify-product-import-draft-qa/
        SKILL.md
      shopify-email-campaign-drafter/
        SKILL.md
      cosmetics-compliance-guard/
        SKILL.md
      acs-boxnow-logistics-draft/
        SKILL.md
      ai-agent-handoff-review/
        SKILL.md

  shopify/
    product-import/
      input/
      output/
      templates/
      validators/
    email-campaigns/
      drafts/
      templates/
      segments/
    theme-audits/
      reports/

  social/
    instagram/
      carousel-drafts/
      reel-scripts/
      story-drafts/
    tiktok/
      scripts/
      hooks/
    buffer/
      scheduled-drafts/
    meta/
      drafts/

  notion/
    database-schemas/
    exports/
    sop/

  logistics/
    acs/
      draft-exports/
    boxnow/
      draft-exports/

  compliance/
    inci/
    supplier-docs/
    product-checklists/

  docs/
    daily-routine/
    prompts/
    decisions/
    changelog/
```

Why both `.agents/skills` and `.claude/skills`?

- Codex uses Agent Skills.
- Claude Code also supports skills and the Agent Skills format.
- Keeping a mirrored folder makes the same business workflows available to both agents.
- Later you can simplify this with symlinks or a build script.

---

# 6. Safety rules for draft-only mode

Put these in both `AGENTS.md` and `CLAUDE.md`.

```md
# Glowishes AI Safety Rules

## Business context
Glowishes is a Greece-based Shopify cosmetics and K-beauty e-shop.
Current mode: draft-only.

## Hard rules
- Do not publish products.
- Do not send emails.
- Do not publish social posts.
- Do not change prices.
- Do not change inventory.
- Do not issue refunds.
- Do not fulfill orders.
- Do not change shipping, payment, tax, discount, or checkout settings.
- Do not contact customers, suppliers, influencers, couriers, or partners automatically.
- Do not invent INCI, cosmetic claims, Responsible Person details, CPNP, CPSR, PIF, batch, PAO, country of origin, or supplier approvals.
- Create drafts, reports, CSVs, checklists, and review notes only.

## Approval rule
Any action that affects Shopify, customers, public social channels, email subscribers, logistics, money, compliance, or legal text requires explicit human approval.

## Secrets rule
Never read, print, commit, or expose `.env`, API keys, Shopify tokens, Meta tokens, TikTok tokens, Notion tokens, or courier credentials.
```

---

# 7. `.gitignore` file

Create this file:

```gitignore
# Secrets
.env
.env.*
!.env.example
secrets/
credentials/
*.key
*.pem
*.p12
*.pfx

# Node
node_modules/
npm-debug.log*

# Python
__pycache__/
*.pyc
.venv/

# Exports and temporary files
*.tmp
*.log
.DS_Store
Thumbs.db

# Sensitive business exports - keep local unless intentionally sanitized
shopify/product-import/input/private/
logistics/**/private/
notion/exports/private/
compliance/supplier-docs/private/
```

---

# 8. Connect Shopify safely

## 8.1 Start without write access

At the beginning, do not connect a private app with write permissions. Start with manual exports and draft files:

- Shopify product export CSV.
- Supplier product Excel/CSV.
- Product images folder.
- Draft product import CSV.
- Draft email campaign Markdown.
- Draft social calendar CSV/Markdown.

## 8.2 Shopify AI Toolkit

Install Shopify Dev MCP for Claude Code:

```powershell
claude mcp add --transport stdio shopify-dev-mcp -- npx -y @shopify/dev-mcp@latest
```

For Codex, add to Codex config:

```toml
[mcp_servers.shopify-dev-mcp]
command = "npx"
args = ["-y", "@shopify/dev-mcp@latest"]
```

On Windows, Codex user config is normally under:

```text
%USERPROFILE%\.codex\config.toml
```

Use Shopify AI Toolkit for correct Shopify docs, schemas, and validation. Do not use it to execute store changes until you move out of draft-only mode.

## 8.3 Product import method for now

Use the manual Shopify CSV flow:

```text
Supplier file -> AI cleanup -> draft Shopify CSV -> validation report -> manual Shopify admin import
```

Safe beginner product import workflow:

1. Export official Shopify sample CSV.
2. Put supplier file in `shopify/product-import/input/`.
3. Ask Claude to map fields.
4. Ask Codex to create a CSV validator.
5. Ask Claude to create product copy drafts.
6. Ask Codex to validate handles, prices, images, variants, tags, metafields, SEO titles, and descriptions.
7. Review manually.
8. Import manually in Shopify Admin.

Do not automate direct Shopify product creation yet.

---

# 9. Notion setup for your business brain

You have a Notion account but do not use it yet. Keep it simple.

Create one workspace area:

```text
Glowishes HQ
```

Inside it, create these databases:

## 9.1 Products database

| Property | Type | Example |
|---|---|---|
| Product Name | Title | Beauty of Joseon Relief Sun |
| Brand | Select | Beauty of Joseon |
| Category | Select | Sunscreen |
| Status | Select | Research, Draft, Ready, Imported, Live |
| Supplier | Text | Qogita / other |
| Cost Ex VAT | Number | 7.20 |
| Retail Price Incl VAT | Number | 18.90 |
| VAT | Number | 24 |
| INCI Available | Checkbox | Yes |
| Greek Label Needed | Checkbox | Yes |
| Responsible Person Available | Checkbox | No |
| Shopify Handle | Text | beauty-of-joseon-relief-sun |
| Product Page Draft | URL or page | link |
| Import CSV Status | Select | Missing data, Validated, Ready |

## 9.2 Content calendar database

| Property | Type | Example |
|---|---|---|
| Post Title | Title | Save your skin - SPF carousel |
| Channel | Multi-select | Instagram, TikTok, Facebook |
| Format | Select | Reel, Carousel, Story, Static |
| Product | Relation | Sunscreen product |
| Hook | Text | Stop wearing SPF like makeup |
| Status | Select | Idea, Draft, Design, Approved, Scheduled, Posted |
| Draft Caption | Text | Greek caption |
| Creative Prompt | Text | image/video prompt |
| Scheduled Date | Date | 2026-05-15 |

## 9.3 Email campaigns database

| Property | Type | Example |
|---|---|---|
| Campaign Name | Title | SPF Launch Week |
| Segment | Select | All subscribers, Sunscreen buyers, VIP |
| Goal | Select | Sales, Education, Launch, Retention |
| Subject Line | Text | Το SPF που θα θυμάσαι να βάζεις |
| Preview Text | Text | Lightweight, Korean, summer-ready |
| Status | Select | Draft, Review, Approved, Built in Shopify, Sent |
| Products | Relation | Products |
| CTA | Text | Shop Sunscreens |

## 9.4 Logistics draft database

| Property | Type | Example |
|---|---|---|
| Order Ref | Title | #1054 |
| Courier | Select | ACS, BOX NOW |
| Customer Name | Text | Customer |
| City | Text | Kavala |
| Address | Text | Draft only |
| Locker ID | Text | BOX NOW locker if needed |
| Status | Select | Draft, Checked, Ready to create label, Shipped |
| Notes | Text | Fragile / skincare |

## 9.5 Compliance checklist database

| Property | Type | Example |
|---|---|---|
| Product | Relation | Product |
| INCI | Checkbox | Yes |
| EU Responsible Person | Checkbox | Yes |
| Warnings | Checkbox | Yes |
| Greek Usage Text | Checkbox | Yes |
| Claims Checked | Checkbox | Yes |
| Supplier Docs | Files | PDF docs |
| Risk | Select | Low, Medium, High |

---

# 10. Recommended Claude and Codex skills

Create these as reusable skills. A skill is better than a prompt when you repeat the workflow often.

## 10.1 Skill list

| Skill name | Use in Claude | Use in Codex | Priority |
|---|---:|---:|---:|
| `glowishes-social-content-creator` | Yes | Optional QA | Very high |
| `shopify-product-import-draft-qa` | Yes for mapping | Yes for validation | Very high |
| `shopify-email-campaign-drafter` | Yes | Optional QA | High |
| `cosmetics-compliance-guard` | Yes | Yes | Very high |
| `acs-boxnow-logistics-draft` | Yes for SOP | Yes for CSV draft | Medium |
| `ai-agent-handoff-review` | Yes | Yes | High |
| `shopify-theme-seo-auditor` | Later | Yes | Later |
| `notion-business-os-architect` | Yes | Optional | High |

---

# 11. Skill template: social content creator

File:

```text
.agents/skills/glowishes-social-content-creator/SKILL.md
.claude/skills/glowishes-social-content-creator/SKILL.md
```

Content:

```md
---
name: glowishes-social-content-creator
description: Create draft-only social content for Glowishes cosmetics and K-beauty. Use for Instagram carousels, Reels, TikTok scripts, Stories, captions, hooks, and content calendars. Never publish automatically.
---

# Glowishes Social Content Creator Skill

## Role
Act as a senior beauty e-commerce social content strategist for a Greece-based K-beauty Shopify store.

## Output language
Default to Greek for customer-facing copy unless the user asks for English or bilingual.

## Brand tone
- Clean, premium, modern K-beauty.
- Direct hooks.
- No over-explaining.
- No medical claims.
- No miracle claims.
- Make SPF, skincare, and routines feel easy and desirable.

## Draft-only rule
Never post, schedule, publish, or send. Create drafts only.

## Required outputs
For each content request, produce:
1. Hook.
2. Platform.
3. Format.
4. Visual direction.
5. Caption.
6. CTA.
7. Hashtags.
8. Compliance risk notes.

## Instagram carousel format
Use 5 slides by default:
1. Hook slide.
2. Problem / myth.
3. Product or routine angle.
4. Benefit / education.
5. CTA.

## TikTok/Reel format
Use:
1. 0-2 second hook.
2. Visual action.
3. Product moment.
4. Benefit.
5. CTA.

## Cosmetic claim rules
Avoid:
- cures acne
- removes wrinkles
- heals eczema
- guaranteed results
- medical treatment claims

Prefer:
- helps skin feel
- supports the look of
- leaves skin looking
- lightweight finish
- suitable for
- based on available product information

## Final checklist
Before final output, check:
- Is it short enough for social?
- Is the hook strong?
- Is the CTA clear?
- Are claims safe?
- Is it draft-only?
```

---

# 12. Skill template: Shopify product import draft QA

File:

```text
.agents/skills/shopify-product-import-draft-qa/SKILL.md
.claude/skills/shopify-product-import-draft-qa/SKILL.md
```

Content:

```md
---
name: shopify-product-import-draft-qa
description: Prepare and validate draft Shopify product import files for Glowishes. Use for supplier CSV/Excel mapping, Shopify CSV checks, metafields, handles, variants, SEO, and draft import QA. Never upload or publish products automatically.
---

# Shopify Product Import Draft QA Skill

## Role
Act as a Shopify product operations specialist for a cosmetics e-shop.

## Current mode
Draft-only. Do not upload, publish, or modify Shopify.

## Inputs
Possible inputs:
- Supplier CSV or Excel.
- Product descriptions.
- Product image filenames.
- Shopify export CSV.
- Shopify sample CSV.
- Product metafield rules.

## Required validation checks
Check for:
- Missing product title.
- Missing brand/vendor.
- Missing category/product type.
- Missing handle.
- Duplicate handle.
- Missing price.
- Price format errors.
- VAT assumptions clearly marked.
- Missing image URL or image filename.
- Missing alt text.
- Missing SEO title.
- Missing meta description.
- Missing tags.
- Missing variant option fields.
- Missing weight if shipping requires it.
- Missing barcode/SKU if available.
- Missing INCI.
- Missing usage instructions.
- Missing warning text.
- Unsupported cosmetic claims.

## Output format
Always output:
1. Draft import status: Pass / Needs fixes / Blocked.
2. Critical errors.
3. Warnings.
4. Suggested fixes.
5. Clean draft CSV path if a file was created.
6. Human approval checklist.

## Prohibited actions
- Do not connect to live Shopify Admin for writes.
- Do not import CSV automatically.
- Do not publish products.
- Do not invent compliance data.
- Do not invent supplier approvals.

## Greek cosmetics e-shop reminder
For cosmetics, be careful with INCI, usage, warnings, Responsible Person, language, and claims. Missing regulatory data should block publishing, not be guessed.
```

---

# 13. Skill template: Shopify email campaign drafter

File:

```text
.agents/skills/shopify-email-campaign-drafter/SKILL.md
.claude/skills/shopify-email-campaign-drafter/SKILL.md
```

Content:

```md
---
name: shopify-email-campaign-drafter
description: Create draft Shopify email marketing campaigns for Glowishes. Use for subject lines, preview text, campaign body, product blocks, CTAs, segmentation ideas, and A/B test ideas. Never send emails automatically.
---

# Shopify Email Campaign Drafter Skill

## Role
Act as an e-commerce email marketing director for a Greece-based K-beauty Shopify store.

## Current mode
Draft-only. Never send, schedule, or publish email campaigns.

## Default campaign structure
1. Campaign goal.
2. Audience segment.
3. Subject line options.
4. Preview text options.
5. Email body.
6. Product block suggestions.
7. CTA.
8. Compliance notes.
9. A/B test idea.

## Style
- Clean and premium.
- Short paragraphs.
- Greek by default.
- Friendly but sales-focused.
- Beauty routine language.
- No medical or miracle claims.

## Useful campaign types
- Welcome email.
- First purchase offer.
- Abandoned checkout.
- Browse abandonment.
- SPF education campaign.
- Routine builder campaign.
- New product arrival.
- Back-in-stock.
- Post-purchase routine education.

## Prohibited actions
- Do not send emails.
- Do not schedule emails.
- Do not change Shopify customer segments.
- Do not create discounts unless asked.
- Do not invent clinical claims.
```

---

# 14. Skill template: cosmetics compliance guard

File:

```text
.agents/skills/cosmetics-compliance-guard/SKILL.md
.claude/skills/cosmetics-compliance-guard/SKILL.md
```

Content:

```md
---
name: cosmetics-compliance-guard
description: Review cosmetics product copy, social content, product import drafts, and email campaigns for claim risk and missing compliance information. Use when content mentions skincare benefits, ingredients, INCI, usage, warnings, SPF, acne, wrinkles, sensitive skin, or EU/Greece selling requirements.
---

# Cosmetics Compliance Guard Skill

## Role
Act as a cautious EU cosmetics compliance reviewer for a Greece-based e-commerce store.

## Important limitation
This is not legal advice. Flag risks and missing information. Do not invent compliance data.

## Check for missing data
- INCI.
- Product function.
- Warnings.
- Usage instructions.
- Net quantity.
- PAO/expiry information if available.
- Batch/lot information if available.
- Responsible Person if needed.
- Supplier documents.
- Country/language needs.

## Claim review
Flag risky wording:
- treats acne
- cures eczema
- removes wrinkles
- medical treatment
- guaranteed result
- dermatologist approved unless documented
- clinically proven unless source is provided
- SPF claims without official source

Prefer safer wording:
- helps skin look smoother
- supports a hydrated feel
- leaves a lightweight finish
- suitable for skin that feels oily/dry/sensitive, if supported
- designed for daily routine use

## Output
Return:
1. Risk level: Low / Medium / High.
2. Risky phrases.
3. Safer alternatives.
4. Missing evidence.
5. Publish blocker list.
```

---

# 15. Skill template: ACS and BOX NOW logistics draft

File:

```text
.agents/skills/acs-boxnow-logistics-draft/SKILL.md
.claude/skills/acs-boxnow-logistics-draft/SKILL.md
```

Content:

```md
---
name: acs-boxnow-logistics-draft
description: Create draft-only logistics checklists and CSV export templates for ACS and BOX NOW orders. Use for order preparation, pickup notes, courier CSV drafts, locker notes, and customer delivery message drafts. Never create shipments or labels automatically.
---

# ACS and BOX NOW Logistics Draft Skill

## Role
Act as a logistics operations assistant for a small Greek Shopify cosmetics e-shop.

## Current mode
Draft-only. Do not create courier labels, bookings, shipments, pickups, or customer notifications automatically.

## Check order readiness
Check:
- Order number.
- Customer name.
- Phone.
- Email.
- Address.
- City.
- Postal code.
- Courier choice.
- BOX NOW locker if applicable.
- Cash on delivery if applicable.
- Product count.
- Fragile/liquid notes.
- Weight estimate.

## Output
Produce:
1. Draft courier row.
2. Missing data list.
3. Packing note.
4. Customer message draft.
5. Human approval checklist.

## Restrictions
- Never send to ACS.
- Never send to BOX NOW.
- Never mark Shopify order as fulfilled.
- Never notify the customer automatically.
```

---

# 16. Skill template: AI agent handoff review

File:

```text
.agents/skills/ai-agent-handoff-review/SKILL.md
.claude/skills/ai-agent-handoff-review/SKILL.md
```

Content:

```md
---
name: ai-agent-handoff-review
description: Review the work of another AI agent before human approval. Use when Claude reviews Codex output or Codex reviews Claude output. Focus on risk, missing assumptions, changed files, and next safe step.
---

# AI Agent Handoff Review Skill

## Role
Act as a strict reviewer of another AI agent's work.

## Review focus
Check:
- Did the agent follow draft-only mode?
- Did it modify files outside scope?
- Did it invent facts?
- Did it create risky claims?
- Did it expose secrets?
- Did it create Shopify/social/email/courier write actions?
- Are outputs beginner-readable?
- Are next steps clear?

## Output
Return:
1. Approved / Needs changes / Blocked.
2. What was reviewed.
3. Main risks.
4. Required fixes.
5. Human approval checklist.
6. Next prompt to give the other agent.
```

---

# 17. Claude vs Codex daily workflow

## 17.1 Daily social content workflow

Ask Claude:

```text
Use the glowishes-social-content-creator skill.
Create 5 Instagram carousel ideas in Greek for Glowishes sunscreens.
Goal: education + sales.
Tone: premium, direct, modern K-beauty.
Output: hook, slide-by-slide text, visual direction, caption, CTA, hashtags, compliance notes.
Draft-only. Do not publish or schedule.
```

Then ask Codex:

```text
Use ai-agent-handoff-review.
Review the carousel drafts for clarity, claim risk, and whether they can be converted into a structured content calendar CSV.
Do not publish or schedule.
```

## 17.2 Product import workflow

Ask Claude:

```text
Use shopify-product-import-draft-qa and cosmetics-compliance-guard.
Map this supplier file into Shopify product fields.
Do not create the final CSV yet.
First output missing fields, risky claims, and recommended product categories/tags/metafields.
```

Ask Codex:

```text
Use shopify-product-import-draft-qa.
Create a draft Shopify CSV from the mapped product file.
Also create a validation report with critical errors and warnings.
Do not upload to Shopify.
```

Ask Claude after Codex:

```text
Use ai-agent-handoff-review.
Review Codex's draft CSV and validation report from a business and cosmetics compliance perspective.
Block anything with missing INCI, unsupported claims, missing usage, missing warnings, or unclear supplier data.
```

## 17.3 Shopify email campaign workflow

Ask Claude:

```text
Use shopify-email-campaign-drafter.
Create a draft Shopify Email campaign in Greek for sunscreen launch week.
Audience: existing subscribers.
Goal: educate + sell.
Include 5 subject lines, 5 preview texts, body copy, CTA, product block suggestions, A/B test idea.
Draft-only. Do not send.
```

Ask Codex:

```text
Review this email draft for structure, missing product data, unsafe claims, CTA clarity, and whether it can be pasted into Shopify Messaging.
Do not send or schedule.
```

---

# 18. Parallel operation in one project

## 18.1 Do not do this

Do not open one folder and let both Claude and Codex edit the same files at the same time.

Bad:

```text
C:\AI\glowishes-ai-ops
  Claude edits files
  Codex edits same files
  Merge conflict / confusion
```

## 18.2 Do this instead: Git branches and worktrees

From your repo:

```powershell
cd C:\AI\glowishes-ai-ops

git checkout main
git pull

git worktree add ..\glowishes-claude-social -b claude/social-content-system

git worktree add ..\glowishes-codex-import -b codex/product-import-validator
```

Open both:

```powershell
code ..\glowishes-claude-social
code ..\glowishes-codex-import
```

Run Claude in the Claude folder:

```powershell
cd C:\AI\glowishes-claude-social
claude
```

Run Codex in the Codex folder:

```powershell
cd C:\AI\glowishes-codex-import
codex
```

## 18.3 Safe handoff loop

```text
Claude plans -> Codex builds -> Claude reviews business/compliance -> Codex fixes -> you approve -> Git commit
```

Or:

```text
Codex validates -> Claude rewrites copy -> Codex checks structure -> you approve -> draft saved
```

---

# 19. First 30-day implementation plan

## Week 1 - Foundation

Goal: make your AI workspace safe and organized.

Actions:

1. Install Windows tools.
2. Create private GitHub repo.
3. Create folders.
4. Create `AGENTS.md`, `CLAUDE.md`, `.gitignore`.
5. Add skills.
6. Create Notion databases manually.
7. Keep all workflows draft-only.

Deliverables:

```text
Private repo ready
Skills installed
Notion HQ created
Daily routine doc created
No live Shopify writes
```

## Week 2 - Social content creator system

Goal: produce weekly social drafts.

Build:

```text
social/instagram/carousel-drafts/
social/instagram/reel-scripts/
social/tiktok/scripts/
social/buffer/scheduled-drafts/
notion/content-calendar-schema.md
```

Weekly output:

- 3 Instagram carousels.
- 3 Reels/TikTok scripts.
- 5 Story ideas.
- 1 promotional post.
- 1 educational post.
- 1 product routine post.

## Week 3 - Product import draft system

Goal: transform supplier data into Shopify-ready draft files.

Build:

```text
shopify/product-import/templates/shopify-product-template-notes.md
shopify/product-import/output/draft-products.csv
shopify/product-import/output/validation-report.md
compliance/product-checklists/
```

Manual approval only.

## Week 4 - Shopify email campaign draft system

Goal: create campaigns, not send them.

Build:

```text
shopify/email-campaigns/templates/welcome-series.md
shopify/email-campaigns/templates/spf-launch.md
shopify/email-campaigns/templates/abandoned-cart.md
shopify/email-campaigns/drafts/
```

Create these drafts first:

1. Welcome email.
2. SPF education email.
3. New product arrival email.
4. Abandoned checkout email.
5. Post-purchase routine education email.

---

# 20. Recommended Shopify email campaign types

Start with these five. Do not automate sending yet.

## 20.1 Welcome email

Goal: introduce Glowishes and build trust.

Subject ideas:

```text
Καλώς ήρθες στο Glowishes
Η K-beauty ρουτίνα σου ξεκινά εδώ
Glow skin, χωρίς υπερβολές
```

## 20.2 SPF education campaign

Goal: sell sunscreen through education.

Concept:

```text
Το SPF δεν είναι μόνο για παραλία.
Είναι το προϊόν που προστατεύει τη ρουτίνα σου κάθε μέρα.
```

## 20.3 Product launch campaign

Goal: announce new arrivals.

Structure:

```text
New in -> why we picked it -> who it is for -> how to use -> shop now
```

## 20.4 Abandoned checkout campaign

Goal: recover carts without sounding aggressive.

Tone:

```text
Το άφησες στο καλάθι σου - το κρατήσαμε για λίγο ακόμα.
```

## 20.5 Post-purchase education

Goal: reduce questions and increase repeat purchases.

Structure:

```text
How to use -> what to combine with -> what not to mix -> next product suggestion
```

---

# 21. Social content system

## 21.1 Weekly content buckets

| Bucket | Example |
|---|---|
| Education | Why SPF is daily, not seasonal |
| Problem-aware | Your sunscreen pills because... |
| Product focus | Lightweight Korean SPF for daily use |
| Routine | Morning routine in 4 steps |
| Myth-busting | Oily skin still needs moisturizer |
| Social proof | Customer-style routine feedback, only if real |
| Offer | Bundle, free shipping, limited drop |

## 21.2 Carousel formula

```text
Slide 1: Hook
Slide 2: The mistake/problem
Slide 3: The simple truth
Slide 4: Product/routine solution
Slide 5: CTA
```

Example:

```text
Slide 1: Σώσε το δέρμα σου
Slide 2: Το SPF δεν είναι μόνο για όταν έχει ήλιο
Slide 3: Η καθημερινή έκθεση μετράει
Slide 4: Βρες ελαφριά Korean sunscreens για κάθε ρουτίνα
Slide 5: Δες τα Glowishes SPF
```

## 21.3 TikTok/Reel formula

```text
0-2 sec: Pattern interrupt
2-5 sec: Problem
5-10 sec: Product/routine angle
10-15 sec: Result/feeling
15-20 sec: CTA
```

Example:

```text
Hook: Αν βάζεις SPF μόνο στην παραλία, αυτό είναι για σένα.
Visual: product texture on hand.
Middle: show 2-3 sunscreens.
CTA: Δες ποιο SPF ταιριάζει στη ρουτίνα σου.
```

---

# 22. ACS and BOX NOW draft workflow

Current mode: draft exports only.

## 22.1 ACS draft fields

```text
Order number
Customer name
Phone
Email
Address
City
Postal code
Package count
Weight estimate
COD yes/no
Amount if COD
Notes
```

## 22.2 BOX NOW draft fields

```text
Order number
Customer name
Phone
Email
Locker ID
Locker name/location
Package size
COD yes/no
Amount if COD
Notes
```

## 22.3 Safety checklist

Before creating a real shipping label manually:

```text
Customer phone exists
Address/postal code correct
Courier method matches customer's selected method
BOX NOW locker exists if BOX NOW
COD amount correct if COD
Fragile/liquid packing checked
Order not cancelled/refunded
```

---

# 23. What to connect now vs later

## Connect now

```text
GitHub private repo
Claude Code VS Code
Codex CLI / IDE
Notion workspace manually
Shopify AI Toolkit for docs/schema support
Manual Shopify exports/imports
Meta Business Suite manually
TikTok Business Center manually
```

## Connect later

```text
Shopify Admin API write permissions
Buffer API
Klaviyo / Mailchimp / Omnisend
ACS API or portal automation
BOX NOW API or portal automation
GitHub Actions
Automated PR reviews
```

## Avoid for now

```text
Automatic Shopify product publishing
Automatic email sending
Automatic social posting
Automatic courier label creation
Automatic inventory changes
Automatic refunds or order edits
```

---

# 24. Suggested first prompts

## 24.1 Create the repo folders

Ask Codex:

```text
Create the folder structure described in docs/setup-plan.md.
Add placeholder README.md files inside empty folders.
Do not install packages.
Do not connect external services.
```

## 24.2 Create Notion database plan

Ask Claude:

```text
Design my Notion workspace called Glowishes HQ.
I need databases for Products, Content Calendar, Email Campaigns, Logistics Drafts, and Compliance Checklists.
Output exact database properties, views, and first 10 example entries.
Do not connect to Notion yet.
```

## 24.3 Create social calendar draft

Ask Claude:

```text
Use glowishes-social-content-creator.
Create a 14-day Instagram and TikTok content calendar in Greek for a K-beauty Shopify store.
Focus: sunscreens, gentle cleansers, hydrating toners, serums.
Output as Markdown table and CSV-ready table.
Draft-only.
```

## 24.4 Create product import validator plan

Ask Codex:

```text
Plan a beginner-friendly Node.js script that validates a Shopify product import CSV.
Do not code yet.
List columns to check, errors, warnings, output files, and how I will run it on Windows.
```

## 24.5 Create Shopify email campaign draft

Ask Claude:

```text
Use shopify-email-campaign-drafter.
Create a Shopify Email draft in Greek for an SPF-focused campaign.
Include 5 subject lines, 5 preview texts, full email body, CTA, product block guidance, and compliance notes.
Do not send.
```

---

# 25. Recommended model and agent usage

## 25.1 Claude Code

Use Claude Code for:

```text
Plan
Explain
Write copy
Create SOPs
Create content calendars
Review business logic
Review compliance wording
Understand what happened
```

Recommended beginner mode:

```text
Ask for plan first.
Review plan.
Then allow edits.
Use small tasks.
```

## 25.2 Codex

Use Codex for:

```text
Implement scripts
Validate files
Review pull requests
Check code changes
Create tests
Find bugs
Make technical changes
```

Recommended beginner mode:

```text
Use Git before every task.
Ask Codex to explain files changed.
Ask Codex to run validation.
Never give store write permissions at first.
```

---

# 26. Beginner operating rules

1. One task per agent at a time.
2. One branch per task.
3. One commit after each approved result.
4. No live store changes without explicit approval.
5. No secrets in files.
6. Do not let agents guess compliance data.
7. Keep prompts specific.
8. Ask for reports before scripts.
9. Ask for drafts before automation.
10. Use Codex to review Claude's output and Claude to review Codex's output.

---

# 27. Recommended first milestone

Your first real milestone should be:

```text
A draft-only AI content and product operations hub for Glowishes.
```

It should produce:

```text
14-day social content calendar
5 Instagram carousel drafts
5 TikTok/Reel scripts
3 Shopify email campaign drafts
1 product import CSV draft
1 product validation report
1 Notion database blueprint
1 logistics draft export template for ACS
1 logistics draft export template for BOX NOW
```

This gives you immediate business value without risking your live Shopify store.

---

# 28. Source links for current setup and research

Official and high-value sources used for this blueprint:

- OpenAI Codex CLI: https://developers.openai.com/codex/cli
- OpenAI Codex Windows: https://developers.openai.com/codex/windows
- OpenAI Codex AGENTS.md: https://developers.openai.com/codex/guides/agents-md
- OpenAI Codex Skills: https://developers.openai.com/codex/skills
- OpenAI Codex MCP: https://developers.openai.com/codex/mcp
- OpenAI Codex GitHub review: https://developers.openai.com/codex/integrations/github
- Claude Code overview: https://docs.anthropic.com/en/docs/claude-code/overview
- Claude Code VS Code integration: https://docs.anthropic.com/en/docs/claude-code/ide-integrations
- Claude Code skills: https://docs.anthropic.com/en/docs/claude-code/skills
- Claude Code memory / CLAUDE.md: https://docs.anthropic.com/en/docs/claude-code/memory
- Claude Code MCP: https://docs.anthropic.com/en/docs/claude-code/mcp
- Claude Code settings and Windows paths: https://docs.anthropic.com/en/docs/claude-code/settings
- Shopify AI Toolkit: https://shopify.dev/docs/apps/build/ai-toolkit
- Shopify product CSV import: https://help.shopify.com/en/manual/products/import-export/import-products
- Shopify CSV usage: https://help.shopify.com/en/manual/products/import-export/using-csv
- Shopify email campaigns: https://help.shopify.com/en/manual/promoting-marketing/create-marketing/shopify-messaging/email/create-email
- Shopify marketing automations: https://help.shopify.com/en/manual/promoting-marketing/create-marketing/shopify-messaging/marketing-automations/create
- Notion MCP: https://developers.notion.com/guides/mcp/overview
- Notion MCP setup: https://developers.notion.com/guides/mcp/get-started-with-mcp
- Instagram Content Publishing API: https://developers.facebook.com/docs/instagram-platform/content-publishing/
- TikTok Content Posting API: https://developers.tiktok.com/doc/content-posting-api-get-started-upload-content
- Buffer Developer API beta: https://buffer.com/developer-api
- GitHub CLI: https://cli.github.com/
- GitHub Desktop cloning: https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-and-forking-repositories-from-github-desktop

---

# 29. Next edits to make after reviewing this document

Recommended next changes you may want to request:

1. Turn the skill templates into actual folder files in a ZIP.
2. Add a beginner screenshot-style installation checklist.
3. Create the first Node.js Shopify CSV validator.
4. Create a Notion import CSV for the databases.
5. Create a 14-day Glowishes content calendar using your current product categories.
6. Create a Shopify email welcome series in Greek.
7. Create ACS and BOX NOW draft export CSV templates.
