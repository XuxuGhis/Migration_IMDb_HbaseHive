# grossesdonnees
Projet de Big Data.

## Données IMDb
https://www.imdb.com/interfaces/

## Option 1

Ce projet de Big Data consiste en une Migration  des données IMBd vers Hbase en utilisant Hive pour les requêter.
(ligne import.csv)

Autrement dit, à partir des données qu'on a sur il va falloir les réintégrer intélligement dans Hbase. 



### Pour la migration

Prérequis : les identifiants des films/acteurs/réalisateurs/etc. sont connues et seront utilisé dans l'interface Web.
Il faudra penser à une 'métable'. 
Mais aussi réfléchir aux plus de cas d'usages pour adapter les RowKey => et répondre à la question "Qu'est-ce qu'on _put_ dans notre CF ?"


## Option 2
Une deuxième option est possible pour la réalisation de ce projet : "reprendre tout depuis 0".
C'est-à-dire : faire implémentations ( _put_)et plusieurs CF intelligement (pour ~10 films; ~10 acteurs et ~10 réalisateurs)
Puis les réquêter avec Hive pour prouver que ça fonctionne et que la base est fonctionnel en expliquant comment ça fonctionne sur le _README_.
