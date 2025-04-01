#!/bin/bash

# Demande du message de commit à l'utilisateur
read -p "💬 Entrez le message du commit : " msg

# Étapes Git
echo "🟨 git add ."
git add .

echo "🟩 git commit -m \"$msg\""
git commit -m "$msg"

echo "🚀 git push -u origin feature/gad_detectection_couleur"
git push -u origin feature/gad_detectection_couleur