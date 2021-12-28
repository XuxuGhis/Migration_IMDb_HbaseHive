# Projet de Big Data
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

### HBase
HBase est un système de gestion de données distribué open source, basé sur Google Bigtable et faisant partie intégrante de l'écosystème Hadoop. Différent des SGBD classiques comme MySQL, HBase propose une gestion basée sur le concept de rows, chacune indexée par une row key.

### Hive
Kezako

### Datasets IMDb
Les datasets IMDb seront obtenus via le lien suivant : https://datasets.imdbws.com/

« IMDb » signifiant Internet Movie Database, les données que nous allons traiter concernent exclusivement l'univers cinématographique.

Nous allons utiliser les six datasets suivants : name_basics, title_basics, title_crew, title_episode, title_principals et title_ratings.

- name_basics : informations standards à propos des personnes (nom, prénom, date de naissance, profession, etc.)
- title_basics : informations à propos des entrées du dataset (titre, genre, etc.)
- title_crew : informations sur le(s) réalisateur(s) et le(s) scénariste(s) des films de title_basics
- title_episode : informations concernant un épisode en particulier d'une série (série duquel est issu l'épisode, saison, numéro d'épisode, etc.)
- title_principals : informations sur le cast et le crew des films de title_basics
- title_ratings : informations sur la note moyenne d'un film

Les datasets sont téléchargées en .gz, mais une rapide extraction avec un logiciel dédié comme WinZip ou WinRAR nous donne accès au fichier .tsv pour Tabulation-Separated Values.

## Option 2
Une deuxième option est possible pour la réalisation de ce projet : "reprendre tout depuis 0".
C'est-à-dire : faire implémentations ( _put_) et plusieurs CF intelligement (pour ~10 films, ~10 acteurs et ~10 réalisateurs)
Puis les requêter avec Hive pour prouver que ça fonctionne et que la base est fonctionnelle en expliquant comment ça fonctionne sur le _README_.

![image](https://user-images.githubusercontent.com/44291961/145956658-3a709c0a-1c86-4fcc-8f94-6ca2b3bc6608.png)
![image](https://user-images.githubusercontent.com/44291961/145956691-4ef9f47f-a0e9-4b62-9146-a6a43c1afb4d.png)



___________
# Explication sur les données utilisées
_// faire un schéma explicatif_
