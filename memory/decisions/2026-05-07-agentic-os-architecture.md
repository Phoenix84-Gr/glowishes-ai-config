---
date: 2026-05-07
category: decisions
tags: [architecture, claude, codex, skills, social, shopify]
status: active
---

# Glowishes Agentic OS Architecture Decision

## What happened
First session designing the full AI operating system for Glowishes K-beauty Shopify store.

## Key decisions made
- Claude Code = strategist, content, compliance. Codex = builder, validator (when API ready).
- 7 domains: Social, SEO+Blog, Products, Email, Orders/Logistics, B2B/Wholesale, Dev/Shopify
- Priority order: A (Social growth) → C (SEO+Email) → B (Products)
- Draft-only mode: nothing publishes without manual Babis approval
- Memory system: Haiku-powered MD files → Git → Obsidian + Notion
- Platform skills: separate Instagram / TikTok / Facebook skills per algorithm

## Skills created this session
- `excalidraw-architect` — diagram generator
- `glowishes-memory` — Haiku memory agent
- `glowishes-instagram` — Instagram algorithm-tuned
- `glowishes-tiktok` — TikTok algorithm-tuned
- `glowishes-facebook` — Facebook/Meta + Ads
- `glowishes-git-daily` — daily commit habit

## Context
- Store: glowishes.com (live, selling)
- Instagram: @glowishes_com (~350 followers)
- TikTok: @glowishes (~15 followers)
- Facebook: new page
- B2B: wholesale (suppliers provide products to sell)
- Codex API: not set up yet

## Next steps
- [ ] Set up Codex CLI with OpenAI API key
- [ ] Install marketing-studio-director + gpt-image-2-director skills from Desktop/Skills/
- [ ] Connect Facebook Shop to Shopify catalog
- [ ] Create first 14-day Instagram content calendar using glowishes-instagram skill
- [ ] Set up Notion HQ databases (Products, Content Calendar, Email, Logistics, Compliance)
- [ ] Open the Excalidraw diagram at excalidraw.com

## Links
- Diagram: `diagrams/glowishes-agentic-os.excalidraw`
- Blueprint: `C:\Users\Babis\Desktop\MD Files\glowishes_ai_ops_blueprint.md`
