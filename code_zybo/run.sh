#!/bin/bash

# Vérifier si les fichiers existent
if [ ! -f "./bin/main_zynq" ]; then
    echo "❌ Erreur: ./bin/main_zynq n'existe pas"
    exit 1
fi

if [ ! -f "./bin/mem_test" ]; then
    echo "❌ Erreur: ./bin/mem_test n'existe pas"
    exit 1
fi

# Exécuter main_zynq
echo "🚀 Exécution de ./bin/main_zynq..."
./bin/main_zynq

# Vérifier si main_zynq s'est bien terminé
if [ $? -ne 0 ]; then
    echo "❌ Erreur lors de l'execution de main_zynq"
    exit 1
fi

# Exécuter mem_test
echo "🚀 Execution de ./bin/mem_test..."
./bin/mem_test

# Vérifier si mem_test s'est bien terminé
if [ $? -ne 0 ]; then
    echo "❌ Erreur lors de l'execution de mem_test"
    exit 1
fi

echo "✅ Tests termines avec succes"
