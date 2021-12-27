# grossesdonnees
Projet de Big Data

## Datasets IMDB
https://datasets.imdbws.com/

## Option 1

Ce projet de Big Data consiste en une Migration des données IMDB vers Hbase en utilisant Hive pour les requêter.
(ligne import.csv)

Autrement dit, à partir des données qu'on a, il va falloir les réintégrer intelligement dans Hbase. 



### Pour la migration

Prérequis : les identifiants des films/acteurs/réalisateurs/etc. sont connus et seront utilisé dans l'interface Web.
Il faudra penser à une 'métatable'. 
Mais aussi réfléchir aux plus de cas d'usages pour adapter les RowKey => et répondre à la question "Qu'est-ce qu'on _put_ dans notre CF ?"


## Option 2
Une deuxième option est possible pour la réalisation de ce projet : "reprendre tout depuis 0".
C'est-à-dire : faire implémentations ( _put_) et plusieurs CF intelligement (pour ~10 films, ~10 acteurs et ~10 réalisateurs)
Puis les requêter avec Hive pour prouver que ça fonctionne et que la base est fonctionnelle en expliquant comment ça fonctionne sur le _README_.

![image](https://user-images.githubusercontent.com/44291961/145956658-3a709c0a-1c86-4fcc-8f94-6ca2b3bc6608.png)
![image](https://user-images.githubusercontent.com/44291961/145956691-4ef9f47f-a0e9-4b62-9146-a6a43c1afb4d.png)



___________
# Explication sur les données utilisées
_// faire un schéma explicatif_
