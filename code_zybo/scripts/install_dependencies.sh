#!/bin/bash

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Installation des dépendances pour la Zybo...${NC}"

# Vérifier si on est root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Ce script doit être exécuté en tant que root (sudo)${NC}"
    exit 1
fi

# Mettre à jour la liste des paquets
echo -e "${YELLOW}Mise à jour de la liste des paquets...${NC}"
apt-get update
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de la mise à jour des paquets${NC}"
    exit 1
fi

# Installer les bibliothèques de développement nécessaires
echo -e "${YELLOW}Installation des bibliothèques de développement...${NC}"
apt-get install -y \
    libopencv-dev \
    libpng12-dev \
    libjpeg-dev \
    libtiff5-dev \
    zlib1g-dev

if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de l'installation des bibliothèques${NC}"
    exit 1
fi

# Vérifier que les bibliothèques sont bien installées
echo -e "${YELLOW}Vérification des bibliothèques installées...${NC}"

echo -e "\n${GREEN}Bibliothèques PNG:${NC}"
ls -l /usr/lib/arm-linux-gnueabihf/libpng*

echo -e "\n${GREEN}Bibliothèques JPEG:${NC}"
ls -l /usr/lib/arm-linux-gnueabihf/libjpeg*

echo -e "\n${GREEN}Bibliothèques TIFF:${NC}"
ls -l /usr/lib/arm-linux-gnueabihf/libtiff*

echo -e "\n${GREEN}Bibliothèques ZLIB:${NC}"
ls -l /usr/lib/arm-linux-gnueabihf/libz*

echo -e "\n${GREEN}Bibliothèques OpenCV:${NC}"
ls -l /usr/lib/arm-linux-gnueabihf/libopencv*

echo -e "\n${GREEN}Installation terminée avec succès !${NC}" 