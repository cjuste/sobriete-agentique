---
transition: fade-out
---

# Tokenizer des LLM : le subword (BPE)

- Pas de découpage par mot ni par règle grammaticale
- Fragments appris statistiquement sur un immense corpus
- Mot fréquent => 1 token, mot rare => plusieurs fragments
- Exemple illustratif : "tokenization" => ["token", "ization"]

Deux modèles peuvent utiliser des corpus d'apprentissages différents.

<v-click>

## Comment réduire leur nombre ?

=> En diminuant la quantité de texte

</v-click>