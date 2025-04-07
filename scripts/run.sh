#!/bin/bash

# Affiche un message indiquant le début de la compilation
echo "🔧 Compilation..."

# Compile le fichier analyse_kociemba.cpp avec g++ et génère un exécutable dans le dossier bin
# Inclut également le fichier config.cpp et les fichiers d'en-tête du dossier include
g++ -o bin/analyse_kociemba src/analyse/analyse_kociemba.cpp src/config.cpp -Iinclude

# Vérifie si la compilation a réussi (code de retour 0)
if [ $? -eq 0 ]; then
    # Si la compilation a réussi, affiche un message et exécute le programme
    # Redirige la sortie standard et d'erreur vers un fichier de résultats
    echo "🚀 Exécution..."
    ./bin/analyse_kociemba.exe 2>&1 | tee data/output/analyse/res.txt
else
    # Si la compilation a échoué, affiche un message d'erreur
    echo "❌ Compilation échouée"
fi

# Affiche un message indiquant la fin du script
echo "✅ Fin du script — consultez les résultats dans data/output/res.txt"

# Pause le script en attendant que l'utilisateur appuie sur Entrée
read -p "⏸️ Appuyez sur Entrée pour quitter..."
