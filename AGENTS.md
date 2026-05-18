# Social Agent Rules -  Operating Instructions

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## Business Context

Glowishes is a Greece-based Shopify cosmetics, Skin Care and K-beauty store.


## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.

Primary channels:

- Instagram
- TikTok
- Meta / Facebook
- Meta Ads

## Operating Mode

Current mode: draft-only with human approval.

Future mode: semi-autonomous with APIs, but still human-confirmed before publishing.

## Hard Rules

- Do not publish social posts, send DMs or comment replies,  launch, pause, or change ads automatically.
- Suggest and let human know for changes at Shopify product data, prices, stock, discounts, checkout, shipping, or customer data.
- Suggest and let human know for  invent INCI, SPF proof, clinical evidence, supplier approval, or cosmetic compliance data.
- Do not expose, print, commit, or store API keys, access tokens, client secrets, cookies, or `.env` values.
- Create drafts, reports, checklists, and approval packages only.

## Approval Rule

Any action that affects public social channels, customers, ads, Shopify, money, legal/compliance text, or brand reputation requires explicit human approval.

## Cosmetic Claim Rules

Avoid risky claims such as:

- cures acne
- treats eczema
- removes wrinkles
- guaranteed results
- medical treatment
- dermatologist approved, unless documented
- clinically proven, unless source evidence is provided

Prefer safer wording such as:

- helps skin feel hydrated
- supports the look of smoother skin
- leaves a lightweight finish
- suitable for daily routine use, if supported
- helps skin look more radiant

## Platform Separation

Each platform lane must produce its own draft package:

- Instagram package
- TikTok package
- Meta / Facebook package
- Meta Ads package

Do not mix platform-specific publishing rules in one file unless the file is a cross-platform workflow.


<claude-mem-context>
# Memory Context

# [Glowishes AI] recent context, 2026-05-19 12:00am GMT+3

Legend: 🎯session 🔴bugfix 🟣feature 🔄refactor ✅change 🔵discovery ⚖️decision 🚨security_alert 🔐security_note
Format: ID TIME TYPE TITLE
Fetch details: get_observations([IDs]) | Search: mem-search skill

Stats: 50 obs (20,960t read) | 229,385t work | 91% savings

### May 7, 2026
4 11:27p 🔵 marketing-studio-director skill detailed architecture and rules documented
5 " 🔵 gpt-image-2-director skill capabilities and routing logic documented
6 11:51p ✅ Initialize skill and agent directory structure for Glowishes AI project
7 11:52p 🟣 Implement excalidraw-architect skill for diagram generation
8 11:56p 🟣 Glowishes Memory Skill Added: Categorized Session Note Storage
9 " 🟣 Glowishes Instagram Skill Added: Algorithm-Aware Content Creation
10 11:57p 🟣 Glowishes TikTok Skill Added: Algorithm-Optimized Short-Form Video
11 " 🟣 Glowishes Facebook/Meta Skill Added: Organic + Paid Ads Strategy
12 " 🟣 Glowishes Daily Git Skill Added: 6-Step Commit + Push Workflow
13 " ✅ Glowishes Memory Index Created: Decision Catalog System
14 " ⚖️ Glowishes Agentic OS Architecture: Claude + Codex Division of Labor
### May 8, 2026
15 12:03a ⚖️ Glowishes Agentic OS Architecture Established
16 " 🟣 Custom Skills Installed: marketing-studio-director and gpt-image-2-director
17 " 🔵 Complete Skill Inventory Revealed via Git Staging
18 12:04a ✅ Glowishes Agentic OS Committed to Version Control
19 12:06a ✅ Glowishes Agentic OS Deployed to GitHub
20 12:11a 🟣 Glowishes Agentic OS Foundation — Skills Framework
21 " ⚖️ Agentic OS Architecture — Role Division
22 " 🟣 Memory System Infrastructure
23 " 🟣 Agentic OS Architecture Diagram
24 " 🟣 Repository Initialization and First Commit
25 " 🟣 Memory Skill Implementation — Time-Filtered Recall Agent
### May 9, 2026
26 3:53p 🔵 Memory Recall Skill defines time-filtered memory system with categorical organization
27 " 🔵 Glowishes Agentic OS foundation: 8 skills + memory system seeded on 2026-05-08
28 " ✅ Memory INDEX.md established as master tracking table for decisions and sessions
29 3:54p ✅ Obsidian vault configured as project folder — memory files now live-accessible
### May 10, 2026
30 10:34a 🔵 Codex CLI tool not installed on system
31 10:35a ✅ Codex CLI successfully installed and verified
32 10:14p 🔵 Glowishes AI project structure separates Codex and Claude tooling
33 10:15p 🔵 Codex and Claude harnesses configured with distinct MCP servers and plugin suites
34 " 🔵 Complete Glowishes AI system architecture mapped with dual-toolchain separation
35 10:17p ⚖️ Reorganization plan created for tool-based folder separation
### May 12, 2026
36 11:50a 🔵 Dual-agent memory architecture with Obsidian integration already established
37 12:02p 🔵 PowerShell Execution Policy Blocks NPX Commands
38 12:04p 🔵 NPM Registry Access Blocked by Permissions/File Access Issues
39 12:05p 🟣 Higgsfield AI Skills Package Successfully Installed
40 12:10p 🔵 Higgsfield CLI integration capabilities and setup procedures
### May 13, 2026
41 11:19p 🔵 Global Codex Configuration and Marketplace Setup
42 11:33p 🟣 Glowishes workspace hooks configured for policy enforcement
### May 14, 2026
S34 User asked for explanation of "Hand off chat to worktree" concept and its purpose (May 14, 12:01 AM)
### May 15, 2026
S36 Selective git push of essential files (CLAUDE/, CODEX/, memory/, SHARED/, AGENTS.md) with review of staged content before commit (May 15, 12:05 AM)
S37 Selective git push of essential workspace files (CLAUDE, CODEX, SHARED, memory, AGENTS.md) to GitHub (May 15, 12:10 AM)
S38 Remediate exposed Firecrawl API key detected by GitGuardian in GitHub repository (May 15, 12:12 AM)
45 12:20a 🚨 Firecrawl API Key Exposed in Git History
S39 Remediate exposed Firecrawl API key from GitHub repository after manual revocation (May 15, 12:21 AM)
S40 Remove exposed Firecrawl API key from git history and configure repository to prevent future exposure (May 15, 12:21 AM)
S41 Remediate exposed Firecrawl API key from GitHub repository and implement credential rotation (May 15, 12:22 AM)
46 12:23a ✅ Firecrawl API Key Removed from Git Tracking
47 " ✅ Exposed API Key Removed from Remote Git History
S42 User requested information about an unspecified repository and asked whether it enables WiFi-based people movement tracking at their location (May 15, 12:23 AM)
S43 User asked about an unspecified repository and whether it enables WiFi-based people movement tracking (May 15, 1:12 AM)
48 1:13a 🔵 GitHub CLI repo view command does not support readme field
49 " 🔵 Ruflo is an agent orchestration platform for Claude, not a WiFi tracking tool
50 1:14a 🔵 Ruflo installation is straightforward; unrelated to WiFi tracking
### May 17, 2026
51 10:52p 🔵 Obsidian vault already configured in GLOWISHES AI folder
52 " 🔵 GLOWISHES AI workspace has organized memory and shared content structure
S44 Review GLOWISHES AI folder structure to determine if entire folder should be an Obsidian vault vs creating a separate vault inside it (May 17, 10:52 PM)
### May 18, 2026
53 11:41p 🔵 Codex plugin cache access blocked by Windows sandbox isolation
54 11:46p ⚖️ V1 Agentic Dashboard Architecture Decisions
55 11:49p ⚖️ V1 Data, Scheduling, and Approval Infrastructure Decisions

Access 229k tokens of past work via get_observations([IDs]) or mem-search skill.
</claude-mem-context>
