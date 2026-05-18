# Install Log — 2026-05-05

## Session Goal
Set up the full AI agency tool stack: CLIs, MCP servers, plugins, and skills in Claude Code on Windows 11.

---

## CLIs Installed

| Tool | Command | Version | Notes |
|---|---|---|---|
| Higgsfield CLI | `hf` / `higgs` | v0.1.28 | Binary manually downloaded via curl — npm postinstall fails on Windows due to tar DNS issue. Binary placed at `C:\Users\Babis\AppData\Roaming\npm\hf.exe` |
| Playwright | `playwright` | v1.59.1 | + Chromium browser downloaded (~180MB) |
| Google Workspace CLI | `gws` | v0.22.5 | Installed cleanly |
| Ruflo | `ruflo` | v3.7.0-alpha.3 | Required separate install after partial failure in batch run |
| Bun | `bun` | v1.2.13 | Required by claude-mem MCP server |

### Install commands used
```bash
npm install -g playwright
npm install -g @googleworkspace/cli
npm install -g ruflo@latest
npm install -g bun
# Higgsfield CLI — manual:
curl -L -o /tmp/hf.tar.gz "https://github.com/higgsfield-ai/cli/releases/download/v0.1.28/hf_0.1.28_windows_amd64.tar.gz"
tar -xzf /tmp/hf.tar.gz -C /tmp
cp /tmp/hf.exe "C:/Users/Babis/AppData/Roaming/npm/hf.exe"
```

---

## MCP Servers Added to Claude Code

| Server | Command | Status |
|---|---|---|
| Playwright | `npx @playwright/mcp@latest` | ✅ Connected |
| Ruflo | `npx ruflo@latest mcp start` | ✗ Alpha — unstable |
| Firecrawl | `npx -y firecrawl-mcp` | ✅ Connected |
| Higgsfield (cloud) | `https://mcp.higgsfield.ai/mcp` | ✅ Connected (pre-existing) |
| Google Drive / Gmail | googleapis | ✅ Connected (pre-existing) |
| claude-mem MCP search | `bun scripts/mcp-server.cjs` | ✅ Bun installed — needs restart |

### Commands used
```bash
claude mcp add playwright -- npx @playwright/mcp@latest
claude mcp add ruflo -- npx ruflo@latest mcp start
claude mcp add firecrawl -e FIRECRAWL_API_KEY=fc-02f7a1c7260542d186371fb35855b2ca -- npx -y firecrawl-mcp
```

---

## Plugins Installed (Claude Code)

| Plugin | Version | Scope | What it does |
|---|---|---|---|
| `caveman@caveman` | ef6050c5 | user | Compresses agent responses 65-75% — trigger with `/caveman` |
| `claude-mem@thedotmack` | 12.6.2 | user | Persistent memory across Claude Code sessions |
| `codex@openai-codex` | 1.0.4 | user | OpenAI Codex integration inside Claude Code |

### Commands used
```bash
claude plugin marketplace add thedotmack/claude-mem
claude plugin install claude-mem
claude plugin marketplace add openai/codex-plugin-cc
claude plugin install "codex@openai-codex"
claude plugin marketplace add JuliusBrussee/caveman
claude plugin install caveman
```

---

## Skills Installed

### Higgsfield Skills (4 skills)
Installed via: `npx skills add higgsfield-ai/skills --yes`
Location: `~\Desktop\Glowishes AI\.agents\skills\`

| Skill | Use case |
|---|---|
| `higgsfield-generate` | Images + videos, 30+ models (Flux 2, Soul V2, Kling 3.0) |
| `higgsfield-marketplace-cards` | Shopify/Amazon A+ product cards |
| `higgsfield-product-photoshoot` | 10 modes: studio, lifestyle, hero banner, virtual try-on, ad packs |
| `higgsfield-soul-id` | Train a face identity model from 5-20 photos |

### Obsidian Skills (5 skills)
Installed via: `npx skills add kepano/obsidian-skills --yes`

| Skill | Use case |
|---|---|
| `obsidian-cli` | Agent control of Obsidian vault |
| `obsidian-markdown` | Read/write Obsidian markdown notes |
| `obsidian-bases` | Obsidian database views |
| `json-canvas` | JSON canvas files |
| `defuddle` | Web content extraction to markdown |

---

## Pending — Auth Steps Required

These require you to run interactively:

```bash
# 1. Higgsfield CLI
hf auth login

# 2. Google Workspace
gws auth login

# 3. Codex (inside Claude Code chat)
!codex login
```

Also: **restart Claude Code** for plugins and claude-mem MCP to fully activate.

---

## Skipped / Deferred

- `npm init @shopify/app@latest` — Shopify app scaffold, deferred to next session
- `HKUDS/RAG-Anything` — heavy ML install, no current use case
- `karpathy/autoresearch` — GPU/training required, not relevant to ads

---

## Known Issues

- **Higgsfield CLI npm install broken on Windows**: The `@higgsfield/cli` npm postinstall script downloads a binary using the system `tar`, which fails to resolve the GitHub URL on Windows. Workaround: download with `curl` and place binary manually. Binary lives at `C:\Users\Babis\AppData\Roaming\npm\hf.exe`.
- **Ruflo MCP unstable**: Alpha version (`v3.7.0-alpha.3`) MCP server fails to connect. Ruflo CLI itself works fine.
- **claude-mem MCP needs bun**: Installed `bun v1.2.13` as a fix. Needs Claude Code restart to connect.
