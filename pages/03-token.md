---
transition: fade-out
---

# Qu'est-ce qu'un token ?

Token = 1..n caractères : 1 mot, un espace, …

Tokenizer : transforme 1 phrase en n tokens

## Tokenizers classiques

| Type            | Phrase                      | Tokens extraits                            |
|-----------------|-----------------------------|--------------------------------------------|
| Whitespace      | "Je m'appelle Clément !"    | ["Je", "m'appelle", "Clément", "!"]        |
| Standard        | "Je m'appelle Clément !"    | ["Je", "m", "appelle", "Clément"]          |
| Alpha-numérique | "maVariable1 est un entier" | ["maVariable", "1", "est", "un", "entier"] |
| Camel case      | "maVariable1 est un entier" | ["ma", "Variable1", "est", "un", "entier"] |
