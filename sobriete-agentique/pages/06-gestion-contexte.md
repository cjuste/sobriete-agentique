# Gestion du contexte

Chaque système a un cache interne qui est rappelé si le début du contexte n'a pas changé (10% du prix chez Claude Code).
Mais qui expire quand le contexte déborde.

Contexte trop important : info noyées dans la masse => perte de qualité

## Conseils

- Limiter la taille du contexte
- Limiter le nombre d'allers/retours
- Faire un `/clear` à chaque changement de sujet
