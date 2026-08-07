# Moins de texte en entrée -> contexte plus léger

RTK (Rust Token Killer) : proxy avant l'agent pour réduire le texte
envoyé. [https://www.rtk-ai.app/](https://www.rtk-ai.app/)

Réduit la verbosité. Utile sur les fichiers de logs, les builds, les git log, …

## Sur un build maven

```bash
mvn clean package
rtk mvn clean package
```

|                   | `mvn clean package` | `rtk mvn clean package` |
|-------------------|---------------------|-------------------------|
| Taille du fichier | 99k                 | 5.6k                    |
| Nombre de lignes  | 724                 | 52                      |
