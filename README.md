# Sobriété agentique

Slide deck built with [Slidev](https://sli.dev/) about reducing agentic token usage.

## Commands

- `pnpm install` — install dependencies
- `pnpm run dev` — start the dev server with live reload at <http://localhost:3030>
- `pnpm run build` — build the static deck into `dist/`
- `pnpm run export` — export the deck to PDF/PNG/PPTX

## Structure

- `slides.md` — deck entry point; slide order is defined by its `src` includes, not by filename numbering
- `pages/*.md` — one file per slide
- `layouts/default.vue`, `global-top.vue`, `style.css` — custom Shodo-branded layout and theme overrides
- `resources/` — skills, hooks, and statusline referenced in the presentation

## Ressources partagées

Les outils et ressources utilisés dans cette présentation :

- [Codebase Memory MCP](https://github.com/DeusData/codebase-memory-mcp) — graphe de code pour l'exploration structurelle
- [RTK](https://www.rtk-ai.app/) — proxy qui filtre les commandes pour réduire les tokens
- [kovoit_rest_api](https://github.com/cjuste/kovoit_rest_api) — projet utilisé pour les exemples d'implémentation agentique

Skills, hooks et statusline présentés : dossier [`resources/`](./resources) de ce repo.

Learn more about Slidev at the [documentation](https://sli.dev/).
