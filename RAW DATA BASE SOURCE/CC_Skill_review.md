## ✅ Repo safety check

I checked all the URLs you listed. None of them show obvious malware or suspicious activity from their public GitHub pages. Most are active, documented, and maintained. Two links were duplicated in your list:
- `https://github.com/googleworkspace/cli`
- `https://github.com/thedotmack/claude-mem`

---

## Recommended for your use case

### Good to install
- `microsoft/playwright`
  - Official, very safe, excellent docs.
  - Great for browser automation, web-based posting, and building clickable agent workflows.
  - Beginner-friendly with strong tutorials.

- `openai/codex-plugin-cc`
  - Good if you want Codex integration inside Claude Code.
  - Safe and official OpenAI plugin.
  - Useful for delegated code review and task execution from Claude Code.

- `thedotmack/claude-mem`
  - Good if you want persistent memory in Claude Code sessions.
  - Very useful for ongoing projects like campaign planning, brand history, and repeatable ad workflows.
  - Install once in Claude Code and reuse.

- `googleworkspace/cli`
  - Good if you use Google Sheets/Drive/Gmail/Docs as part of your workflow.
  - Useful for automating reports, asset tracking, or content pipelines with Google Workspace.
  - Requires Google Cloud OAuth setup.

- `firecrawl/firecrawl`
  - Good for agents that need real-time web data, scraping, or competitor research.
  - Not a beginner tool for self-hosting, but very useful if you need live web extraction.
  - Requires API key and compliance with website terms.

- `kepano/obsidian-skills`
  - Good if you use Obsidian for notes and want agent integration.
  - Safe, useful for note editing and markdown workflows.
  - Helpful for organizing campaign briefs, scripts, and asset docs.

### Useful reference resources
- `anthropics/skills` (`SKILL.md`)
  - Not an app to install.
  - It is documentation and examples for building Claude skills.
  - Nice to read if you want to create your own skills, but not required to run ads.

- `VoltAgent/awesome-design-md`
  - Not software; it is a curated design doc collection.
  - Useful as inspiration or to feed to an agent when designing UI / brand look.
  - Safe and easy to use.

---

## Repos I would NOT install unless you have a specific need

### Not relevant or too advanced for advertising agents
- `karpathy/autoresearch`
  - Legit and interesting, but this is an ML research experiment.
  - Requires GPU, Python, model training knowledge.
  - Not needed for Instagram/TikTok/Facebook ad agents.

- `HKUDS/RAG-Anything`
  - Powerful RAG framework, but complex.
  - Good only if you need multimodal retrieval / document search pipelines.
  - Overkill for basic ad creation.

- `ruvnet/ruflo`
  - Very ambitious multi-agent orchestration system.
  - Safe, but very complex and steep for beginners.
  - Only install if you want a full agent platform and are ready for a big toolchain.

- `TauricResearch/TradingAgents`
  - Finance/trading-specific.
  - Not relevant to social media ad creation.

---

## Notes on dubious or special cases

- `notebooklm-py`
  - Unofficial project, but well-documented and active.
  - Uses undocumented NotebookLM APIs, so it can break if Google changes them.
  - Fine for experimentation and research workflows, but treat as "use at your own risk."

- `firecrawl/firecrawl`
  - Uses AGPL for core and some MIT SDKs.
  - If you self-host or redistribute, be careful with AGPL obligations.
  - Also obey website terms when scraping.

- `claude-mem`
  - Licensed AGPL.
  - Good for private use, but if you plan team/distribution use, know the AGPL terms.

---

## What each category means

### Skills
- A skill is like an agent "app" for Claude Code / Codex / OpenClaw.
- Usually installed with:
  - `npx skills add <repo>`
  - or via Claude Code skill install commands
- They are made from `SKILL.md` files and give the agent domain-specific behavior.
- Example: Obsidian skills, NotebookLM skill, Firecrawl skill.

### Plugins
- Plugins extend Claude Code or other host apps.
- Install from the plugin marketplace inside Claude Code, or using plugin commands.
- They add commands, UI integration, and deeper app behavior.
- Example: `openai/codex-plugin-cc`, `claude-mem`, Ruflo plugins.

### CLI tools
- Command-line programs you install on your computer.
- Useful for automation, scripting, and agent workflows.
- Install via `npm`, `pip`, or binary releases.
- Example: `googleworkspace/cli`, `playwright`, `notebooklm-py`.

### MCP
- Model Context Protocol servers expose tools to an LLM client.
- They are not plugins, but servers/tools that agents call.
- Example: Playwright MCP, Firecrawl MCP.
- You configure MCP servers in your client like Claude Code or VS Code.

---

## How to install each type

### Playwright
- CLI:
  - `npm install -g @playwright/cli`
- MCP:
  - `claude mcp add playwright npx @playwright/mcp@latest`
- If you want browser automation in Claude Code, install both CLI and MCP.

### Google Workspace CLI
- Recommended:
  - `npm install -g @googleworkspace/cli`
- Or download GitHub release binary.
- Then:
  - `gws auth setup`
  - `gws auth login`

### NotebookLM Python tool
- Install:
  - `pip install notebooklm-py`
- If you need browser login:
  - `playwright install chromium`
- Then:
  - `notebooklm login`
- For Claude Code:
  - `notebooklm skill install` or `npx skills add teng-lin/notebooklm-py`

### Firecrawl
- Hosted version needs API key from firecrawl.dev.
- MCP install example:
  - Add MCP config
    ```
    {
      "mcpServers": {
        "firecrawl-mcp": {
          "command": "npx",
          "args": ["-y", "firecrawl-mcp"],
          "env": {"FIRECRAWL_API_KEY":"fc-YOUR_API_KEY"}
        }
      }
    }
    ```
- Or use their CLI/skill installation via `npx`.

### Obsidian skills
- `npx skills add git@github.com:kepano/obsidian-skills.git`
- Or install via Claude Code plugin marketplace if available.

### Claude-Mem
- Inside Claude Code:
  - `/plugin marketplace add thedotmack/claude-mem`
  - `/plugin install claude-mem`
- Or:
  - `npx claude-mem install`

---

## Your specific question: Higgsfield MCP and Claude Code

If you already installed Higgsfield MCP in your Claude Code desktop app:
- **You do not need to reinstall it for the same Claude Code app and same machine.**
- It is available to that Claude Code environment once installed.
- If you want to use Higgsfield from another client or another machine, then that separate client will need its own MCP setup.

So for your current Claude Code desktop workflow, no repeat install needed unless you switch client or the MCP config changes.

---

## What I'd recommend for social media ad agent work

### Must-haves
- `microsoft/playwright`
  - for automating web workflows and posting flows
- `thedotmack/claude-mem`
  - for remembering campaign context over time
- `microsoft/playwright` MCP
  - for real browser interaction from agents

### Good additions
- `googleworkspace/cli`
  - if you manage assets or reports in Google Sheets/Drive
- `firecrawl/firecrawl`
  - if you want live web research and competitor scraping
- `kepano/obsidian-skills`
  - if you use Obsidian for campaign planning
- `openai/codex-plugin-cc`
  - if you want Codex to help with code and automation tasks inside Claude Code

### Not needed for ads unless you want a special advanced workflow
- `RAG-Anything`
- `Ruflo`
- `TradingAgents`
- `autoresearch`

---

## Final recommendation

### Install if you want:
- browser automation + scraping + memory + Google Workspace automation
- a real ad agent workflow
- reliable, documented tools

### I would install:
1. `microsoft/playwright`
2. `thedotmack/claude-mem`
3. `openai/codex-plugin-cc` (if you use Codex)
4. `googleworkspace/cli` (if you use Google Sheets/Drive)
5. `firecrawl/firecrawl` only if you need web scraping or live competitor feeds

### I would skip for now:
- `karpathy/autoresearch`
- `HKUDS/RAG-Anything`
- `ruvnet/ruflo`
- `TauricResearch/TradingAgents`

If you want, I can next give you the exact install commands for the tools I recommend for your Windows Claude Code setup.