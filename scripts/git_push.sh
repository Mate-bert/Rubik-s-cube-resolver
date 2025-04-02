#!/bin/bash

# Liste les fichiers modifiés ou non suivis
mapfile -t files < <(git status -s | awk '{print $2}')

if [ ${#files[@]} -eq 0 ]; then
    echo "✅ Aucun changement détecté. Rien à committer."
    exit 0
fi

echo "🔍 Fichiers modifiés ou non suivis :"
for i in "${!files[@]}"; do
    printf "  [%d] %s\n" $((i+1)) "${files[$i]}"
done

echo ""
read -p "🗂️  Entrez les numéros à ajouter (ex: 1 3 4), ou 'a' pour tous : " selection

# Construction de la commande git add
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
    echo "❌ Aucun fichier ajouté. Opération annulée."
    exit 1
fi

echo ""
echo "➕ Fichiers ajoutés :"
for file in "${to_add[@]}"; do
    echo "  ➤ $file"
    git add "$file"
done

# Choix du type de commit
echo ""
echo "📦 Choisissez un type de commit :"
options=("feat" "fix" "docs" "refactor" "style" "test" "chore" "autre")
select type in "${options[@]}"; do
    if [[ -n "$type" ]]; then
        break
    fi
done

# Message personnalisé
read -p "📝 Message de commit : " msg
commit_msg="$type: $msg"

echo ""
echo "🟩 git commit -m \"$commit_msg\""
git commit -m "$commit_msg"

# Récupération de la branche courante
branch=$(git rev-parse --abbrev-ref HEAD)

echo "🚀 git push -u origin $branch"
git push -u origin "$branch"