#!/bin/bash

echo "🔧 Compilation..."
g++ -o bin/analyse_kociemba src/analyse/analyse_kociemba.cpp

if [ $? -eq 0 ]; then
    echo "🚀 Exécution..."
    ./bin/analyse_kociemba.exe 2>&1 | tee data/output/analyse/res.txt
else
    echo "❌ Compilation échouée"
fi

echo "✅ Fin du script — consultez les résultats dans data/output/res.txt"
read -p "⏸️ Appuyez sur Entrée pour quitter..."
