#!/bin/bash


##
# Requêtes Hive pour intéroger la base IMDB
# auteurs : Sunny YANG & Ghislaine TAOUSSI
#           ING5 APP SI 02
#           promo 2022
##


## Variables
#current_path=$(dirname $dir_path )
#readonly FICHIER_REQUETES="requetes_hive"



echo_bleu () {
  echo -e "[\e[0;94;49m$2\e[0;39;49m] \e[0;94;49m$1\e[0;39;49m"
}
echo_vert () {
  echo -e "[\e[32m$2\e[39m] \e[32m$1\e[39m"
}

echo_orange () {
  echo -e "[\e[33m$2\e[39m] \e[33m$1\e[39m"
}

echo_rouge () { 
  echo -e "[\e[31m$2\e[39m] \e[31m$1\e[39m"
}

echo_rosechelou () {

    echo -e "\e[0;39;49m "
    echo -e "[\e[0;95;49m$2\e[0;39;49m] \e[0;95;49m$1\e[0;39;49m"
    echo -e "\e[0;39;49m "
}

echo_chelou () {

    echo -e "\e[0;39;49m "
    echo -e "[\e[5;30;45m$2\e[0;39;49m] \e[0;30;45m$1\e[0;39;49m"
    echo -e "\e[0;39;49m "
}


function menu {

	  x=0
    echo_rosechelou "(ɔˆ ³(ˆ⌣ˆc) Bienvenue" "♥"
	  while [ $x = 0 ]
	  do
	      #clear
        echo_bleu "Entrer votre choix." "!"
        echo -n "-->"
	      read answer
	      case $answer in
		        1)
                echo_chelou "Execution de la requete en cours." "⚙⚙⚙"
			          echo "requete 1"
			          x=1
			          ;;
		        2)
                echo_chelou "Execution de la requete en cours." "⚙⚙⚙"
			          echo "requete 2"
			          x=1
			          ;;
		        *)
                echo_rouge "Saisie invalide." "✘"
			          x=0
			          ;;
	      esac
	  done
}

menu

