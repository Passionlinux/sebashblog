# bbnew.sh

`bbnew.sh` est un générateur de blog statique écrit en Bash, adapté à partir de
[BashBlog](bashblog/README.md) et de son script `bashblog/bb.sh`. Il conserve les
commandes principales de BashBlog tout en ajoutant des fonctions et une
configuration destinées au blog PassionGNU/Linux.

Le script produit des fichiers HTML, un flux RSS et des fichiers de style. Le
site généré peut être publié sur un hébergement web statique.

[![asciinema](https://asciinema.org/a/4nr44km9ipow4s7u2w2eabeik.png)](https://asciinema.org/a/4nr44km9ipow4s7u2w2eabeik)

[![demo](https://github.com/Passionlinux/sebashblog/blob/master/Capture%20d'%C3%A9cran_20261009_011643.png)

## Utilisation

Lancer le script sans argument pour afficher l’aide :

```sh
./bbnew.sh
```

Commandes disponibles :

```sh
./bbnew.sh post                 # créer un billet
./bbnew.sh post -html            # créer un billet en HTML
./bbnew.sh edit billet.html      # modifier un billet publié
./bbnew.sh edit -n billet.html   # modifier le billet et permettre son renommage
./bbnew.sh edit -f billet.html   # modifier le fichier HTML complet
./bbnew.sh delete billet.html    # supprimer un billet
./bbnew.sh rebuild               # régénérer le blog
./bbnew.sh list                  # lister les billets
./bbnew.sh tags                  # lister les étiquettes
./bbnew.sh tags -n               # trier les étiquettes par nombre de billets
./bbnew.sh reset                 # supprimer les fichiers générés, après confirmation
```

Le script essaie d’utiliser un convertisseur Markdown compatible s’il en trouve
un ; `post -html` force l’édition en HTML. L’éditeur est choisi dans l’ordre
`VISUAL`, `EDITOR`, puis la commande système `editor`.

## Configuration

Les valeurs par défaut se trouvent dans `global_variables()` au début du script.
Un fichier `.config` placé dans le répertoire du blog permet de les remplacer
sans modifier le script. Le fichier est du code shell : reprenez la forme des
affectations déjà présentes dans `global_variables()`.

Exemple :

```bash
global_title="Mon blog"
global_description="Quelques notes"
global_url="https://exemple.fr"
global_author="Mon nom"
global_email="moi@exemple.fr"
```

La configuration actuelle de `bbnew.sh` contient déjà des valeurs en français,
une bannière et des chemins pour le pied de page et le bloc de commentaires.
Les fichiers correspondants doivent être présents dans le répertoire du blog
si vous souhaitez utiliser ces contenus personnalisés.

## Différences avec BashBlog (`bashblog/bb.sh`)

`bbnew.sh` part de BashBlog 2.10, mais constitue une adaptation plus large
qu’une simple traduction.

### Personnalisation et langue

- Les textes de l’interface et les paramètres régionaux sont configurés en
  français.
- Le titre, la description, l’auteur, l’URL et la bannière par défaut sont
  adaptés à PassionGNU/Linux.
- Les messages de l’aide, les confirmations et plusieurs erreurs sont
  également traduits.

### Pages et recherche

- Ajoute des chemins configurables pour des pages « À propos », « Liens » et
  « Rechercher ».
- Peut produire des pages statiques à partir de fichiers configurés, avec prise
  en charge de contenu Markdown.
- Génère un index JSON et un script JavaScript pour la recherche dans les
  billets.
- Permet de personnaliser le fragment HTML des commentaires et le pied de page.

### Billets et étiquettes

- Reconnaît `<!-- more -->` en plus de `<hr>` comme marqueur d’extrait.
- Tient compte des libellés français des étiquettes lors de la reconstruction
  des billets.
- Préserve les dates de publication et de création lors de la reconstruction.

### Présentation

- Génère des feuilles de style responsives, avec prise en charge du mode sombre
  et des préférences de réduction des animations.
- Ajoute des styles pour la bannière, la navigation, les formulaires de
  recherche, les résultats et les éléments courants des billets.

### Gestion des erreurs et opérations

- Vérifie davantage la configuration et les arguments des commandes.
- Contrôle les conversions Markdown et plusieurs étapes de génération, avec des
  messages d’erreur explicites.
- Valide la cible de `delete` pour éviter de supprimer les pages générées comme
  l’index ou les pages d’étiquettes.
- Demande la phrase `Oui, je confirme !` avant `reset`.

## Licence et origine

Ce script est adapté de BashBlog, créé par Carlos Fenollosa et ses contributeurs.
BashBlog est distribué sous licence GNU GPL version 3 ou ultérieure. Consultez
les commentaires du script et le [README de BashBlog](bashblog/README.md) pour
les informations d’origine et de licence.
