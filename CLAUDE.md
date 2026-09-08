# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A [Slidev](https://sli.dev/) slide deck ("Sobriété agentique" — reducing agentic token usage). There is no application code; the repository content is the presentation itself.

## Commands

- `pnpm install` — install dependencies (uses pnpm workspaces; see `pnpm-workspace.yaml`)
- `pnpm run dev` — start the dev server with live reload at http://localhost:3030
- `pnpm run build` — build the static deck into `dist/` (used by both Netlify and Vercel deploys)
- `pnpm run export` — export the deck to PDF/PNG/PPTX (requires `playwright-chromium`, pre-allowlisted for pnpm build scripts in `pnpm-workspace.yaml`)

There is no lint/test/typecheck script configured.

## Structure

- `slides.md` is the deck entry point. It holds the global frontmatter (theme, background, fonts, transitions) and then a sequence of `src: ./pages/NN-slug.md` includes — one file per slide/section. **The slide order is defined entirely by the order of these `src` entries in `slides.md`, not by the numeric filenames** — renumber/reorder both together when inserting or moving slides.
- `pages/*.md` — one file per slide (French filenames/content). Numeric prefixes are for human readability only; the source of truth for ordering is `slides.md`.
- `layouts/default.vue` — custom Slidev layout overriding the default: adds a slide-number footer (`shodo-index`) and a vertical rule (`shodo-rule`). Referenced implicitly by slides unless a slide's frontmatter sets a different `layout`.
- `global-top.vue` — injected above every slide (Slidev global layer convention); currently renders a fixed Shodo logo in the top-right corner.
- `style.css` — deck-wide theme overrides on top of the `seriph` Slidev theme: black background, cream text, pink accent (`#ff175a` via `--slidev-theme-primary`), uppercase bold h1, square bullet points. Read the comments in this file before changing colors/typography — they explain which upstream theme file/selector is being overridden and why.
- `public/` — static assets served as-is (e.g. `shodo-logo.svg` referenced from `global-top.vue`).
- `netlify.toml` / `vercel.json` — both configured to build with `npm run build` and serve `dist/` with an SPA-style catch-all rewrite to `index.html`. Keep both in sync if changing the build/output settings.

## Visual identity

The deck follows a "Shodo" brand style (see comments in `style.css`): black background, cream (`#ffefd4`) text, pink (`#ff175a`) accent, XXL uppercase titles. When adding slides or styles, match this palette rather than the default `seriph` theme colors.