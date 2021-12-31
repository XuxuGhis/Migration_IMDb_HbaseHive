# Projet de Big Data
## Contenu
Ce repo comporte :
- Un rapport de projet
- Un squelette de menu bash destiné à déclencher les requêtes Hive
- Fichier *.tsv* reformaté
- Un script pour générer à partir des *.tsv* des commandes d'insertion de données (_put_) HBase Shell.
- Des requêtes types Hive pour interroger la base

## Notre idée
D'un point de vue de l'utilisateur, nous souhaitions qu'il puisse choisir dans un menu bash des requêtes Hive prédéfinies afin d'interroger des informations du dataset IMDb que nous avons migré sur HBase.

## Difficultés
Depuis le début du projet, nous avons des problèmes de connexion au nœud EDGE. 
Nous pensions que le problème venait de nous et avons tenté de résoudre le problème par nous-même. 
Cela nous a fait perdre beaucoup de temps, sans compter que nous étions tous les deux en entreprise.
Le projet nous a malgré tout donné une bonne vision d'ensemble du Big Data et des imbrications des frameworks en Big Data et dans les sytèmes distribués.
Nous aurions aimé avoir plus de temps à consacrer à l'école au projet.

# Rapport de projet
## Introduction
Le Big Data correspond au domaine informatique où une importante Variété de données est traitée selon un Volume et une Vitesse conséquante.

Ce sont les trois « V » du Big Data.

En effet, le secteur du Big Data vient répondre essentiellement à des enjeux pleinement contemporains, définis d'une part par l'affluence de données plus ou moins complexes à partir de sources très diverses, et d'autre part par le besoin grandissant d'accès à ces mêmes données dans des proportions et des débits jusqu'alors inégalées dans l'histoire.

C'est dans ce contexte que nous allons mener un projet de Big Data centré autour du traitement par HBase et Hive de Datasets IMDb. Ci-dessous seront explicités les détails ce travail.

## Objectif du projet
Ce projet de Big Data consiste en une migration des données des datasets IMDb vers Hbase en utilisant Hive pour réaliser les requêtes. En d'autres termes, il faut intégrer intelligemment les datasets IMDb en un format compréhensible par HBase.

### Pour la migration
Prérequis : les identifiants des films/acteurs/réalisateurs/etc. sont connus et seront utilisés dans une éventuelle interface Web.
Il faudrait penser à une 'métatable'. 
Mais aussi réfléchir aux plus de cas d'usages pour adapter les row keys => et répondre à la question "Qu'est-ce qu'on _put_ dans notre CF ?"

## Etape 1 : Datasets IMDb
### Premiers coups d'œil
Les datasets IMDb seront obtenus via le lien suivant : https://datasets.imdbws.com/

« IMDb » signifiant Internet Movie Database, les données que nous allons traiter concernent exclusivement l'univers cinématographique.

Nous allons utiliser les six datasets suivants : name_basics, title_basics, title_crew, title_episode, title_principals et title_ratings.

- name_basics : informations standards à propos des personnes (nom, prénom, date de naissance, profession, etc.)
- title_basics : informations à propos des entrées du dataset (titre, genre, etc.)
- title_crew : informations sur le(s) réalisateur(s) et le(s) scénariste(s) des films de title_basics
- title_episode : informations concernant un épisode en particulier d'une série (série duquel est issu l'épisode, saison, numéro d'épisode, etc.)
- title_principals : informations sur le cast et le crew des films de title_basics
- title_ratings : informations sur la note moyenne d'un film ainsi que le nombre de votes

Les datasets sont téléchargées en .gz, mais une rapide extraction avec un logiciel dédié comme WinZip ou WinRAR nous donne accès au fichier .tsv pour Tabulation-Separated Values.

### Définition de requêtes types
Il est nécessaire de réfléchir à quels genres de requêtes la base de données pourrait être amenée à répondre. Il est important de mener cette réflexion car la construction de la base de données en dépend. En effet, cela permet de mener à une correcte élaboration des row keys.

Ainsi, nous avons échafaudé **des requêtes types auxquelles notre base de données HBase est susceptible de répondre** :
- Tous les films d'un certain genre
- La moyenne des notes des films d'un certain genre sortis la même année
- Les films/séries dans un intervalle de notes

## Etape 2 : HBase
HBase est un système de gestion de données distribué open source, basé sur Google Bigtable et faisant partie intégrante de l'écosystème Hadoop. Différent des SGBD classiques comme MySQL, HBase propose une gestion basée sur le concept de rows, chacune indexée par une row key.

### Définir les row keys
Pour répondre aux besoins de la requêtes type prédéfinie, nous avons consruit la row key comme suit :
- [date]+[genre]+[titre_film]

Dans ce cas-là, il est intéressant de redonder les données grâce à une recomposition de la row key qui permet une recherche par genre.
- [genre]+[note]+[titre_film]

### Entrer les données dans HBase
Les commandes HBase Shell sont écrites dans le fichier *commandesHBase_et_HiveQL* sous la forme ci-dessous :
```
put ’<table name>’,’row1’,’<colfamily:colname>’,’<value>’
```
Nous avons un script batch, *hbase_script_gen.bat*, qui permet de générer ces commandes automatiquement à partir de la lecture des fichiers *.tsv*

## Etape 3 : Hive
Hive répond à deux besoins, le premier est la traduction de requêtes SQL en Job MapReduce à l'aide d'un langage similaire : le HiveQL.
Le second est de connaître l'emplacement des données dans le système grâce aux métadonnées que Hive stocke dans le MetaStore.
Nous utiliserons Hive pour effectuer nos requêtes, qui seront détaillées dans le paragraphe suivant.

### Traitement des données par Hive
Les commandes Hive Shell et HiveQL sont dans le fichier *commandesHBase_et_HiveQL* sous la forme ci-dessous :
```SQL
SELECT titre_film FROM table_imdb WHERE genres == horror && ratings > 3
```
