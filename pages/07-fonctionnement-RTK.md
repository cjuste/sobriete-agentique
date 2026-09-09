# Fonctionnement de RTK

- Préfixé aux commandes bash lancées par l'agent

- Supporte nativement certaines commandes (git/docker/read/...)
=> Va filtrer les colonnes, ajouter des options, ...

Opérations :
- Réduction du bruit (commentaires, espaces)
- Regroupe les éléments similaires
- Remplace les doublons par un décompte.

<v-click>

Traitement 100% local : rien n'est envoyé à un service tiers, seule la sortie filtrée part vers l'agent.

</v-click>