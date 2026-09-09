# Comment "vit" le contexte ?

Le contexte s'enrichit au fil du temps :
- Informations initiales (MCP, CLAUDE.md/AGENTS.md, ...)
- Skills activés
- Questions posées
- Informations récupérées (code, fichiers locaux, recherches web, ...)
- Réponses données

Chaque échange avec le modèle renvoie tout le contexte, enrichi des nouveaux éléments.

<v-click>

=> Il peut finir par dépasser la capacité du modèle

=> Chaque aller-retour est coûteux

</v-click>
