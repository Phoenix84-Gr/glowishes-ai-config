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

# [Glowishes AI] recent context, 2026-05-19 9:54am GMT+3

Legend: 🎯session 🔴bugfix 🟣feature 🔄refactor ✅change 🔵discovery ⚖️decision 🚨security_alert 🔐security_note
Format: ID TIME TYPE TITLE
Fetch details: get_observations([IDs]) | Search: mem-search skill

Stats: 50 obs (19,467t read) | 136,651t work | 86% savings

### May 8, 2026
20 12:11a 🟣 Glowishes Agentic OS Foundation — Skills Framework
21 " ⚖️ Agentic OS Architecture — Role Division
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
### May 15, 2026
45 12:20a 🚨 Firecrawl API Key Exposed in Git History
46 12:23a ✅ Firecrawl API Key Removed from Git Tracking
47 " ✅ Exposed API Key Removed from Remote Git History
S43 User asked about an unspecified repository and whether it enables WiFi-based people movement tracking (May 15, 1:12 AM)
48 1:13a 🔵 GitHub CLI repo view command does not support readme field
49 " 🔵 Ruflo is an agent orchestration platform for Claude, not a WiFi tracking tool
50 1:14a 🔵 Ruflo installation is straightforward; unrelated to WiFi tracking
S44 Review GLOWISHES AI folder structure to determine if entire folder should be an Obsidian vault vs creating a separate vault inside it (May 15, 1:14 AM)
### May 17, 2026
51 10:52p 🔵 Obsidian vault already configured in GLOWISHES AI folder
52 " 🔵 GLOWISHES AI workspace has organized memory and shared content structure
S45 Clarify scope and requirements for agentic orchestrator system v1 (5-day target) for Shopify store management and content creation (May 17, 10:52 PM)
### May 18, 2026
53 11:41p 🔵 Codex plugin cache access blocked by Windows sandbox isolation
54 11:46p ⚖️ V1 Agentic Dashboard Architecture Decisions
55 11:49p ⚖️ V1 Data, Scheduling, and Approval Infrastructure Decisions
### May 19, 2026
S46 Prepare caveman-commit for skill consolidation and higgsfield reference updates (May 19, 12:00 AM)
56 12:01a 🔄 Major skill cleanup and directory consolidation
S47 Investigate and resolve Obsidian vault configuration for automated memory management (May 19, 12:01 AM)
57 12:02a 🔵 Glowishes AI workspace uses Obsidian vault with standard plugin stack
58 " 🔵 Glowishes AI uses structured memory system with auto-indexed sessions and decisions
S48 Review and plan improvements for an Excalidraw blueprint of an agentic operating system orchestrating a Shopify store, marketing, social media, and more. Define structure and approach for a cleaner, more buildable design. (May 19, 12:03 AM)
59 12:04a 🔵 Glowishes AI is agentic OS for K-beauty e-commerce with 9 skills and multi-domain architecture
60 12:05a ⚖️ Glowishes Agentic OS architecture separates Claude (strategy) from Codex (execution)
61 12:07a ✅ Obsidian plugin registration fixed; vault restoration plan created
62 " ✅ obsidian-git auto-sync configured for bidirectional vault synchronization
63 " 🔵 Glowishes AI uses dual-toolchain architecture: Claude Code and Codex with separate MCP servers
64 12:08a 🟣 Higgsfield AI Skills Package deployed; three core generation skills now live
65 " ⚖️ Git worktrees adopted as development pattern for parallel experimental branches
66 " 🚨 Firecrawl API key exposed in GitHub; detected by GitGuardian and remediated
67 " ⚖️ Obsidian vault encompasses entire Glowishes AI project folder for unified knowledge graph
S49 Verify Obsidian works at project folder and determine configuration needed for proper syncing and graph linking (May 19, 12:10 AM)
68 12:11a 🔵 Obsidian vault fully configured in Glowishes AI project
69 12:12a 🔵 Obsidian configured with auto-sync via Git and full knowledge graph linking
70 7:28a ✅ Configured Obsidian graph color groups for semantic folder organization
S50 Review Glowishes AgenticOS blueprint (Excalidraw), provide architectural recommendations, and create an optimization plan for building an agentic dashboard ecosystem to orchestrate Shopify store operations, marketing, and social media creation (May 19, 7:28 AM)
S51 Review and refine Glowishes AgenticOS architectural blueprint to align with hybrid operational preferences and clarify system design dimensions. (May 19, 9:45 AM)
71 9:51a 🔵 Glowishes Obsidian vault already configured with 8 plugins for knowledge management
72 " 🔵 Glowishes AgenticOS project structure reveals tiered organization with Claude, Codex, and Obsidian separation
73 9:52a 🔵 Obsidian graph configured with 5 color-coded knowledge domains: memory (sessions/decisions), CODEX, CLAUDE, SHARED
74 " 🔵 Obsidian Git plugin configured for continuous vault synchronization with 10-second auto-commit and auto-pull intervals
S52 Blueprint review and architectural planning for agentic dashboard ecosystem - User seeks feedback on Excalidraw design for multi-agent orchestration system (Shopify automation, marketing, social media, with Obsidian + Notion integration) (May 19, 9:54 AM)
**Investigated**: User has referenced an Excalidraw blueprint (link provided) for an agentic operation system. The design encompasses: Shopify store orchestration, marketing agents, social media creation, parallel Claude Code and Codex usage, Obsidian memory orchestration connected to Notion and Google Drive. Files mentioned: BluePrint 1.svg and BluePrint.png from local filesystem.

**Learned**: User is designing a comprehensive agentic dashboard ecosystem that integrates multiple services and AI tools. The architecture involves parallel agent execution (Claude Code + Codex), memory management through Obsidian, and external integrations (Notion, Google Drive, Shopify). This is still in the blueprint/design phase.

**Completed**: User has submitted the design review request with reference to the Excalidraw blueprint and local file copies. Request clearly articulates scope, intent, and type of feedback needed (suggestions, clarifications, optimizations, fixes for easier building).

**Next Steps**: Primary session should examine the Excalidraw blueprint via the provided link, review the architectural design, generate clarification questions, identify potential issues or unclear components, suggest optimizations for buildability, and create a structured plan for implementation or redesign based on findings.


Access 137k tokens of past work via get_observations([IDs]) or mem-search skill.
</claude-mem-context>
