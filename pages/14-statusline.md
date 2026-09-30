# La statusline : garder l'œil sur le contexte

Une ligne de statut personnalisable, affichée en permanence en bas du terminal (script exécuté à chaque prompt)

<div class="term-mock">
  <div class="term-dots"><span></span><span></span><span></span></div>
  <div class="term-line">
    <span class="chip sonnet">Sonnet 5</span>
    <span class="sep">|</span>
    <span class="chip green">Context: 34%</span>
  </div>
  <div class="term-legend">
    <span>Modèle : <span class="chip sonnet">Sonnet</span> <span class="chip opus">Opus</span> <span class="chip fable">Fable</span></span>
    <span class="dot-sep">·</span>
    <span>Contexte : <span class="chip green">&lt;50%</span> <span class="chip yellow">50-69%</span> <span class="chip red">&ge;70%</span></span>
  </div>
</div>

<v-click>

- Modèle actif, coût de la session, branche git
- % de contexte utilisé, nombre de tokens restants
- Mise à jour à chaque échange, sans commande à lancer

</v-click>

<v-click>

=> Un signal continu, complémentaire du canari : on voit la dérive du contexte venir avant qu'elle ne devienne un problème

</v-click>

<v-click>

Et chez les autres agents ?

- Gemini CLI : commande native `/statusline` (ou `/footer`), mais limitée à des éléments prédéfinis (lignes de code, % de contexte, tokens) — pas encore de commande personnalisée
- ChatGPT / Codex CLI : `status_line` avec une liste fixe d'éléments intégrés (modèle, dossier courant, contexte utilisé, limites 5h/hebdo) — pas de hook vers une commande externe

</v-click>

<v-click>

=> La statusline pilotée par un script arbitraire reste une spécificité de Claude Code

</v-click>

<style scoped>
p {
  margin: 0.4em 0;
  line-height: 1.3;
}

ul {
  margin: 0.15em 0;
}

li {
  margin: 0.1em 0;
  line-height: 1.25;
}

.term-mock {
  display: inline-block;
  margin: 0.4em 0;
  border-radius: 8px;
  background: #0d0d0d;
  border: 1px solid #2a2a2a;
  padding: 0.4em 0.9em;
  font-family: 'Space Grotesk', monospace;
}

.term-dots {
  display: flex;
  gap: 5px;
  margin-bottom: 0.4em;
}

.term-dots span {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: #444;
}

.term-dots span:nth-child(1) { background: #ff5f56; }
.term-dots span:nth-child(2) { background: #ffbd2e; }
.term-dots span:nth-child(3) { background: #27c93f; }

.term-line {
  font-size: 0.9em;
  font-weight: 700;
}

.term-legend {
  margin-top: 0.35em;
  font-size: 0.65em;
  opacity: 0.7;
}

.dot-sep {
  margin: 0 0.6em;
  opacity: 0.5;
}

.sep {
  opacity: 0.4;
  margin: 0 0.6em;
}

.chip {
  font-weight: 700;
}

.chip.sonnet { color: #27c93f; }
.chip.opus { color: #ffbd2e; }
.chip.fable { color: #ff5f56; }
.chip.green { color: #27c93f; }
.chip.yellow { color: #ffbd2e; }
.chip.red { color: #ff5f56; }
</style>
