#!/bin/bash

echo "🔍 Fichiers modifiés ou non suivis :"
git status -s

while true; do
    echo ""
    read -p "🗂️  Entrez les fichiers à ajouter (ou '.' pour tous, vide pour quitter) : " files

    if [[ -z "$files" ]]; then
        echo "🚫 Fin du script."
        break
    fi

    git add $files

    echo ""
    echo "📦 Types de commit possibles :"
    echo "  1) feat      → ajout de fonctionnalité"
    echo "  2) fix       → correction de bug"
    echo "  3) docs      → documentation"
    echo "  4) style     → mise en forme (indentation, etc.)"
    echo "  5) refactor  → refactoring sans ajout de fonction"
    echo "  6) test      → ajout/modif de tests"
    echo "  7) chore     → tâches diverses (build, conf...)"

    read -p "👉 Choisis un type (1-7) : " type_choice

    case $type_choice in
        1) type="feat" ;;
        2) type="fix" ;;
        3) type="docs" ;;
        4) type="style" ;;
        5) type="refactor" ;;
        6) type="test" ;;
        7) type="chore" ;;
        *) echo "❌ Choix invalide."; continue ;;
    esac

    read -p "📝 Message du commit (pas de majuscule ni point final) : " msg

    full_msg="$type: $msg"
    echo "✅ Commit : $full_msg"
    git commit -m "$full_msg"

    read -p "🔁 Faire un autre commit ? (o/n) : " again
    [[ "$again" != "o" && "$again" != "O" ]] && break
done

# Push ?
read -p "🚀 Pousser sur la branche actuelle ? (o/n) : " push_choice
if [[ "$push_choice" == "o" || "$push_choice" == "O" ]]; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push -u origin "$branch"
    echo "✅ Poussé sur $branch"
else
    echo "📌 Tu pourras faire un git push plus tard."
fi