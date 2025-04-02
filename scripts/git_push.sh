#!/bin/bash

while true; do
    echo ""
    echo "🔍 Recherche des fichiers modifiés ou non suivis..."
    mapfile -t files < <(git status -s | awk '{print $2}')

    if [ ${#files[@]} -eq 0 ]; then
        echo "✅ Aucun changement détecté."
        break
    fi

    echo "🗂️  Fichiers modifiés :"
    for i in "${!files[@]}"; do
        printf "  [%d] %s\n" $((i+1)) "${files[$i]}"
    done

    read -p "📌 Sélectionner les fichiers (ex: 1 3 5) ou 'a' pour tout, vide pour quitter : " selection
    [[ -z "$selection" ]] && break

    to_add=()
    if [[ "$selection" == "a" ]]; then
        to_add=("${files[@]}")
    else
        for index in $selection; do
            if [[ "$index" =~ ^[0-9]+$ && $index -ge 1 && $index -le ${#files[@]} ]]; then
                to_add+=("${files[$((index-1))]}")
            fi
        done
    fi

    if [ ${#to_add[@]} -eq 0 ]; then
        echo "❌ Aucun fichier valide sélectionné."
        continue
    fi

    echo "➕ Ajout des fichiers :"
    for file in "${to_add[@]}"; do
        echo "  ➤ $file"
        git add "$file"
    done

    echo ""
    echo "📦 Type de commit :"
    options=("feat" "fix" "docs" "refactor" "style" "test" "chore" "autre")
    select type in "${options[@]}"; do
        if [[ -n "$type" ]]; then break; fi
    done

    read -p "📝 Message de commit : " msg
    commit_msg="$type: $msg"

    echo ""
    echo "🟩 Commit : $commit_msg"
    git commit -m "$commit_msg"

    echo ""
    read -p "➕ Faire un autre commit ? (y/N) : " again
    [[ "$again" =~ ^[yY]$ ]] || break
done

# Pousser les changements
echo ""
echo "🌿 Branches disponibles pour push :"
# ℹ️ On affiche les branches locales + distantes (connues via fetch)
# ⚠️ Certaines branches distantes peuvent ne pas être suivies localement (ex: origin/foo)
#    -> pour les pousser, il faut les avoir déjà trackées localement (git checkout -t origin/foo)
mapfile -t branches < <(
    git for-each-ref --format='%(refname:short)' refs/heads refs/remotes |
    grep -vE 'HEAD|^origin$' |
    sort -u
)
select branch in "${branches[@]}"; do
    if [[ -n "$branch" ]]; then
        echo "🚀 git push -u origin $branch"
        git push -u origin "$branch"
        break
    fi
done