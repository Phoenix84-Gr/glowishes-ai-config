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

# [Glowishes AI] recent context, 2026-05-15 12:05am GMT+3

Legend: 🎯session 🔴bugfix 🟣feature 🔄refactor ✅change 🔵discovery ⚖️decision 🚨security_alert 🔐security_note
Format: ID TIME TYPE TITLE
Fetch details: get_observations([IDs]) | Search: mem-search skill

Stats: 42 obs (19,446t read) | 251,699t work | 92% savings

### May 7, 2026
1 11:26p 🔵 Glowishes AI Operations Blueprint reviewed and understood
2 " 🔵 Pre-built skills available in local Skills folder
3 11:27p 🔵 marketing-studio-director skill extracted and examined
4 " 🔵 marketing-studio-director skill detailed architecture and rules documented
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
S23 Update AGENTS.md with shared memory context documenting how Codex and Claude will maintain parallel, synchronized memory using the Obsidian-based memory/ folder (May 10, 10:57 PM)
### May 12, 2026
36 11:50a 🔵 Dual-agent memory architecture with Obsidian integration already established
S24 Update AGENTS.md file to include shared memory context and parallel memory rules for Claude and Codex agents working in the Glowishes AI project (May 12, 11:51 AM)
S25 Update AGENTS.md with memory context and install Higgsfield AI skills package for the Glowishes project (May 12, 12:02 PM)
37 12:02p 🔵 PowerShell Execution Policy Blocks NPX Commands
38 12:04p 🔵 NPM Registry Access Blocked by Permissions/File Access Issues
39 12:05p 🟣 Higgsfield AI Skills Package Successfully Installed
S26 Setup and integration of Higgsfield CLI with Claude Code and Codex agents (May 12, 12:05 PM)
40 12:10p 🔵 Higgsfield CLI integration capabilities and setup procedures
S27 Determine if Higgsfield skill, CLI, and MCP need to be installed twice (once for Codex, once for Claude) or if a single installation suffices for both agents (May 12, 12:10 PM)
S28 How to open Claude chat inside VS Code (May 12, 10:30 PM)
### May 13, 2026
S29 Reviewed OpenAI Codex Hooks documentation and identified configuration changes needed for faster, safer operation of the Glowishes workspace (May 13, 10:31 PM)
41 11:19p 🔵 Global Codex Configuration and Marketplace Setup
S30 Set up Codex hooks for the Glowishes AI project to enforce workspace policies and prevent unsafe operations (May 13, 11:29 PM)
42 11:33p 🟣 Glowishes workspace hooks configured for policy enforcement
S31 User asked if they can work with both CLAUDE and CODEX tools together in the same "Glowishes AI" folder and requested organization suggestions for the workspace structure (May 13, 11:37 PM)
### May 14, 2026
S32 User asked about folder organization for Obsidian vault and clarified the purpose of RAW and SHARED folders in the Glowishes AI project structure (May 14, 12:01 AM)
**Investigated**: Explored the role of .obsidian/ folder, purpose of RAW DATA BASE SOURCE folder for draft/messy materials, and SHARED folder for cleaned working files between agents

**Learned**: .obsidian/ contains only Obsidian app settings (workspace, plugins, themes) not content; RAW DATA BASE SOURCE holds unprocessed inputs (photos, product files, supplier info, screenshots); SHARED contains cleaned files trusted by both Claude and Codex agents; separation of raw product claims from approved/compliant claims is critical for marketing safety

**Completed**: Designed comprehensive folder structure for Glowishes AI project with clear separation: memory/ for decisions/history, RAW DATA BASE SOURCE/ for messy inputs, SHARED/ for inter-agent working files, CLAUDE/ and CODEX/ for agent-specific outputs, .obsidian/ for settings only; established rule that raw materials must be cleaned before moving to approved/shared status

**Next Steps**: Implementation of the recommended folder hierarchy in the Glowishes AI project; organization of existing files into appropriate folders; potentially rename RAW DATA BASE SOURCE to cleaner convention like RAW_SOURCE or SOURCE_LIBRARY


Access 252k tokens of past work via get_observations([IDs]) or mem-search skill.
</claude-mem-context>
