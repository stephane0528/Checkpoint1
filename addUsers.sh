#!/bin/bash

# Vérification de la présence d'arguments
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

# Parcours des arguments (noms d'utilisateurs)
for user in "$@"; do
    # Vérification de l'existence de l'utilisateur
    if id "$user" &>/dev/null; then
        echo "L'utilisateur $user existe déjà"
    else
        # Création de l'utilisateur
        useradd "$user"
        
        # Vérification de la création
        if [ $? -eq 0 ]; then
            echo "L'utilisateur $user a été créé"
        else
            echo "Erreur à la création de l'utilisateur $user"
        fi
    fi
done
