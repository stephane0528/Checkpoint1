#!/bin/bash
# Vérifier si au moins un argument est passé
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi
# Parcourir les arguments 
for user in "$@"; do
    # Vérifier si l'utilisateur existe déjà
    if id "$user" &>/dev/null; then
        echo "L'utilisateur $user existe déjà"
    else
        # Créer l'utilisateur
        if sudo useradd "$user"; then
            echo "L'utilisateur $user a été créé"
        else
            echo "Erreur à la création de l'utilisateur $user"
        fi
done

