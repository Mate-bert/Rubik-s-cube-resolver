#!/bin/bash

# Vérifie si whiptail est installé
if ! command -v whiptail &> /dev/null; then
    echo "❌ dialog n'est pas installé. Installe-le avec : pacman -S mingw-w64-x86_64-newt"
    exit 1
fi

while true; do
    # Affiche les fichiers modifiés
    changed_files=$(git status -s | awk '{print $2}')
    if [ -z "$changed_files" ]; then
        whiptail --title "Aucun changement" --msgbox "Aucun fichier modifié à commiter." 8 50
        break
    fi

    # Crée une liste à passer à whiptail
    file_list=()
    for file in $changed_files; do
        file_list+=("$file" "" OFF)
    done

    selected_files=$(whiptail --title "🗂️ Sélection des fichiers" \
        --checklist "Sélectionne les fichiers à ajouter au prochain commit :" 20 78 12 \
        "${file_list[@]}" 3>&1 1>&2 2>&3)

    # Si annulation
    if [ $? -ne 0 ]; then
        break
    fi

    # Nettoyage
    selected_files=$(echo $selected_files | sed 's/"//g')

    # Ajout des fichiers
    git add $selected_files

    # Menu du type de commit
    commit_type=$(whiptail --title "📦 Type de commit" --menu "Choisis le type de commit :" 20 60 10 \
        "feat" "Ajout de fonctionnalité" \
        "fix" "Correction de bug" \
        "docs" "Documentation uniquement" \
        "style" "Mise en forme (indentation, etc.)" \
        "refactor" "Refactoring sans ajout de fonctionnalité" \
        "test" "Ajout/modif de tests" \
        "chore" "Tâches diverses (build, conf...)" \
        3>&1 1>&2 2>&3)

    [ $? -ne 0 ] && break

    # Message
    commit_msg=$(whiptail --title "📝 Message du commit" --inputbox "Entre ton message (pas de majuscule ni point final) :" 10 78 3>&1 1>&2 2>&3)
    [ $? -ne 0 ] && break

    full_msg="$commit_type: $commit_msg"

    git commit -m "$full_msg"

    # Boucler ?
    whiptail --yesno "Souhaites-tu faire un autre commit ?" 8 50
    [ $? -ne 0 ] && break
done

# Propose de push
whiptail --yesno "Souhaites-tu pousser tes commits sur la branche actuelle ?" 8 50
if [ $? -eq 0 ]; then
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git push -u origin "$current_branch"
    whiptail --msgbox "✅ Commits poussés sur $current_branch !" 8 50
else
    whiptail --msgbox "📌 Tu pourras pousser plus tard manuellement." 8 50
fi