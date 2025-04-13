####################################################
#!/bin/bash
#   version : 0.0
#   Auteur : Strephane 
#   Script de création d'utilisateurs
#######################################################

# Vérifion si un argument est passé

if [ $# -eq 0 ]; then 
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1

fi

#Vérifions l'existence des arguments dans le systrème

for user1 in "$@" ;
do
#Vérification de l'existence
if id "$user1" ; 
then
    echo "L'utilisateur $user1 existe déjà"
    else
    echo "l'utilisateur $user1 n'existe pas encore."

    #Création d'utilisateur
    sudo useradd "$user1"

#Vérification de la création 
if [ $? -eq 0 ] ; then
    echo "L'utilisateur $user1 a été crée"
    else
    echo "Erreur à la création de l'utilisateur $user1"
fi 
    fi
done     


