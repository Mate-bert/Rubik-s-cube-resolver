#!/bin/bash

# Boucle principale pour gérer les commits et les push
while true; do
    echo ""
    echo "🔍 Recherche des fichiers modifiés ou non suivis..."
    # Récupère la liste des fichiers modifiés ou non suivis
    mapfile -t files < <(git status -s | awk '{print $2}')

    # Si aucun fichier n'est détecté, on quitte la boucle
    if [ ${#files[@]} -eq 0 ]; then
        echo "✅ Aucun changement détecté."
        break
    fi

    # Affiche la liste des fichiers modifiés
    echo "🗂️  Fichiers modifiés :"
    for i in "${!files[@]}"; do
        printf "  [%d] %s\n" $((i+1)) "${files[$i]}"
    done

    # Demande à l'utilisateur de sélectionner les fichiers à ajouter
    read -p "📌 Sélectionner les fichiers (ex: 1 3 5) ou 'a' pour tout, vide pour quitter : " selection
    [[ -z "$selection" ]] && break

    to_add=()
    if [[ "$selection" == "a" ]]; then
        # Si l'utilisateur choisit 'a', on ajoute tous les fichiers
        to_add=("${files[@]}")
    else
        # Sinon, on ajoute uniquement les fichiers sélectionnés
        for index in $selection; do
            if [[ "$index" =~ ^[0-9]+$ && $index -ge 1 && $index -le ${#files[@]} ]]; then
                to_add+=("${files[$((index-1))]}")
            fi
        done
    fi

    # Si aucun fichier valide n'est sélectionné, on recommence
    if [ ${#to_add[@]} -eq 0 ]; then
        echo "❌ Aucun fichier valide sélectionné."
        continue
    fi

    # Ajoute les fichiers sélectionnés à l'index Git
    echo "➕ Ajout des fichiers :"
    for file in "${to_add[@]}"; do
        echo "  ➤ $file"
        git add "$file"
    done

    echo ""
    echo "📦 Type de commit :"
    # Propose une liste de types de commit à l'utilisateur
    options=("feat" "fix" "docs" "refactor" "style" "test" "chore" "autre")
    select type in "${options[@]}"; do
        if [[ -n "$type" ]]; then break; fi
    done

    # Demande un message de commit à l'utilisateur
    read -p "📝 Message de commit : " msg
    commit_msg="$type: $msg"

    # Effectue le commit avec le message spécifié
    echo ""
    echo "🟩 Commit : $commit_msg"
    git commit -m "$commit_msg"

    # Demande si l'utilisateur souhaite effectuer un autre commit
    echo ""
    read -p "➕ Faire un autre commit ? (y/N) : " again
    [[ "$again" =~ ^[yY]$ ]] || break
done

# Une fois les commits terminés, propose de pousser les changements
echo ""
echo "🌿 Branches disponibles pour push :"
# Récupère la liste des branches locales et distantes
mapfile -t branches < <(
    git for-each-ref --format='%(refname:short)' refs/heads refs/remotes |
    grep -vE 'HEAD|^origin$' |
    sort -u
)

# Permet à l'utilisateur de sélectionner une branche pour le push
select branch in "${branches[@]}"; do
    if [[ -n "$branch" ]]; then
        # Effectue le push sur la branche sélectionnée
        echo "🚀 git push -u origin $branch"
        git push -u origin "$branch"
        break
    fi
done