# En entrée

[RTK](https://www.rtk-ai.app/) (Rust Token Killer) : proxy avant l'agent pour réduire le texte
envoyé. 

Réduit la verbosité. Utile sur les logs, fichier ou git, les builds, …

## Sur un build Maven

```bash
mvn clean package
rtk mvn clean package
```

|                   | `mvn clean package` | `rtk mvn clean package` |
|-------------------|---------------------|-------------------------|
| Taille du fichier | 99k                 | 5.6k                    |
| Nombre de lignes  | 724                 | 52                      |
