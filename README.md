# Projet de Big Data
## Contenu/Quick start
Ce repo comporte :
- Une description des objectifs du projet
- La définition des row keys
- Un script pour entrer les données dans HBase
- Des requêtes Hive pour interroger la base

***à compléter***

## Introduction
Le Big Data correspond au domaine informatique où une importante Variété de données est traitée selon un Volume et une Vitesse conséquante.

Ce sont les trois « V » du Big Data.

En effet, le secteur du Big Data vient répondre essentiellement à des enjeux pleinement contemporains, définis d'une part par l'affluence de données plus ou moins complexes à partir de sources très diverses, et d'autre part par le besoin grandissant d'accès à ces mêmes données dans des proportions et des débits jusqu'alors inégalées dans l'histoire.

C'est dans ce contexte que nous allons mener un (petit) projet de Big Data centré autour du traitement par HBase et Hive de Datasets IMDb. Ci-dessous seront explicités les détails ce travail.

## Objectif(s) du projet
Ce projet de Big Data consiste en une migration des données des datasets IMDb vers Hbase en utilisant Hive pour réaliser les requêtes. En d'autres termes, il faut intégrer intelligemment les datasets IMDb en un format compréhensible par HBase.

### Pour la migration
Prérequis : les identifiants des films/acteurs/réalisateurs/etc. sont connus et seront utilisé dans l'interface Web.
Il faudra penser à une 'métatable'. 
Mais aussi réfléchir aux plus de cas d'usages pour adapter les RowKey => et répondre à la question "Qu'est-ce qu'on _put_ dans notre CF ?"

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

Ainsi, nous avons échafaudé **5 requêtes types auxquelles notre base de données HBase est susceptible de répondre** :
- Tous les films d'un certain genre
- Tous les films d'un certain réalisateur/scénariste
- Les film avec le plus grand nombre de épisodes
- Tous les films sortis d'un film
- Les films/séries dans un intervalle de notes

Nous avons choisi d'implémenter la requête type suivantes :
- Les films/séries dans un intervalle de notes selon son genre 

## Etape 2 : HBase
HBase est un système de gestion de données distribué open source, basé sur Google Bigtable et faisant partie intégrante de l'écosystème Hadoop. Différent des SGBD classiques comme MySQL, HBase propose une gestion basée sur le concept de rows, chacune indexée par une row key.

### Définir les row keys
Pour répondre aux besoins de la requêtes type prédéfinie, nous avons consruit la row key comme suit :
- [note]+[id_genre]+[id_film]
- [id_genre]+[note]+[id_film]

### Entrer les données dans HBase

*put* 

## Etape 3 : Hive
Hive répond à deux besoins, le premier est la traduction de requêtes SQL en Job MapReduce à l'aide d'un langage similaire : le HiveQL.
Le second est de connaître l'emplacement des données dans le système grâce aux métadonnées que Hive stocke dans le MetaStore.
Nous utiliserons Hive pour effectuer nos requêtes, qui seront détaillées dans le paragraphe suivant.
### Traduction des requêtes en HiveQL

- la moyenne des note des films d'horreur
- 

 

___________
## Explication sur les données utilisées
_// faire un schéma explicatif_
