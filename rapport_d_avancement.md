
# Rapport d'avancement - Projet Rubik's Cube Resolver

## Date : 28 mars 2025

---

## Objectif du jour

Mettre en place un pipeline semi-automatisé pour extraire les faces d'un Rubik's Cube à partir de photos prises avec une seule caméra, dans le but de détecter automatiquement les couleurs de chaque case.

---

## Réalisations

### 1. **Préparation des images**
- Chargement d'une image haute résolution contenant 3 faces visibles (ex: `3face_1.jpg`)
- Redimensionnement automatique à une hauteur fixe (~800px) pour traitement plus fluide

### 2. **Outil de sélection interactive de face**
- Création d'un programme permettant de **cliquer 4 coins** d'une face
- Application d'une **homographie** pour redresser la face
- Sauvegarde automatique dans `face_rectified_X.jpg`
- Enregistrement des 4 points dans un fichier `faces_coords.txt` au format :

```
3face_1.jpg, face_rectified_1.jpg: x1 y1, x2 y2, x3 y3, x4 y4
```

### 3. **Automatisation de la génération des faces**
- Lecture automatique du fichier `faces_coords.txt`
- Chargement et redimensionnement de l'image source (3face_1.jpg ou 3face_2.jpg)
- Application des transformations pour régénérer les `face_rectified_X.jpg`
- Mise en place d'une cache pour ne pas recharger la même image plusieurs fois

---

## Problèmes rencontrés

- ❌ Erreur de chargement d'image (images non trouvées) : dues à un mauvais répertoire courant lors de l'exécution
    - **Solution :** modification du chemin avec `bin/` préfixé dans le code

- ❌ Format initial du fichier `faces_coords.txt` incompatible avec le parser
    - **Solution :** ajout du nom de l'image source en tête de chaque ligne

- ❌ Problème de détection de plusieurs visages sur une image redressée
    - **Remarque :** une image contient 3 faces visibles, mais l'objectif est d'extraire une face à la fois via homographie

---

## Avancement

- ✅ Système d'extraction de faces via clics manuels fonctionnel
- ✅ Enregistrement des coordonnées pour automatisation future
- ✅ Automatisation des redressements de faces depuis les coordonnées validée

---

## Prochaines étapes

1. 🔄 Automatiser la **découpe en 9 stickers** des `face_rectified_X.jpg`
2. 🌟 Détection de la **couleur dominante** dans chaque case
3. 🤖 Génération de la chaîne à passer à l'algorithme de résolution (Kociemba)
4. 🤝 Intégration à l'enchaînement automatique avec les 6 moteurs

---

## Remarques personnelles

- Fixer la caméra + position du cube est la clé pour réutiliser les coordonnées sans re-clics
- Une fois les `face_rectified_X` générées, tout peut s'automatiser facilement

---

📅 Fin de journée productive, prêt à reprendre demain pour la détection couleur !
---

## Date : 29 mars 2025

---

## Nouveaux objectifs atteints

### 4. **Refactorisation complète du projet**
- Refonte complète de l’architecture : séparation en modules (`face_rectifieur_auto`, `split_stickers`, `ColorDetector`)
- Ajout de fichiers `.hpp` et `.cpp` dédiés pour chaque composant
- Centralisation de l’appel des fonctions dans `main.cpp`

### 5. **Makefile multi-cibles**
- Ajout d’un `Makefile` permettant de compiler :
  - `rubiks_resolver` (binaire principal)
  - `test` (binaire secondaire pour expérimentations)
- Optimisation des flags (`CXXFLAGS`, `INCLUDE`, `LIBS`) avec répertoires configurables

### 6. **Chaîne Kociemba générée automatiquement**
- Détection complète des couleurs dominantes pour chaque face du Rubik's Cube
- Attribution automatique des couleurs centrales prédéfinies
- Génération de la chaîne Kociemba dans `kociemba.txt` sous le format attendu :

```
"U:DRLUUBFBR",
"R:BLURRLRUB",
"F:LRDDFDLFU",
"D:FUFFDBRDU",
"L:BRUFLLFDD",
"B:BFLUBLRBD"
```

---

## Amélioration potentielle identifiée

🎯 **Intégration d’une IA pour la détection automatique des coins des faces**
- Objectif : éliminer la sélection manuelle des coordonnées des 3 faces visibles
- Entraînement envisagé en Python (YOLOv8 ou keypoint detection)
- Inférence embarquée prévue dans la partie Linux de la Zybo 7010 (via TFLite ou ONNX)

---

## Bilan

- ✅ Tous les modules du pipeline sont désormais appelables de façon centralisée
- ✅ Processus complet de la photo à la chaîne Kociemba fonctionnel
- 🔄 Dernière dépendance manuelle restante : la sélection des coins → à remplacer par IA
---

## Date : 30 mars 2025

---

## Objectif du jour

Commencer le développement d’une intelligence artificielle capable de détecter automatiquement les trois faces visibles d’un Rubik’s Cube sur une image, en vue d’automatiser la récupération des coordonnées des coins.

---

## Réalisations

### 1. **Choix de la base IA**
- Sélection du modèle **YOLOv8 Segmentation** pour détecter les 3 faces par image
- Justification : exportable en ONNX/TFLite, inférable sur CPU ARM (Zybo 7010)

### 2. **Création de dataset initial**
- Constitution d’un dataset de 30 images comportant 3 faces visibles chacune
- Annotations manuelles réalisées avec **Roboflow** : une seule classe `face`
- Export des données au format **YOLOv8 Segmentation**, avec split train/val

### 3. **Lancement de l’entraînement IA**
- Entraînement d’un modèle `yolov8n-seg.pt` (nano) sur 30 images
- Sauvegarde du modèle dans `runs/rubiks_faces_seg2/weights/best.pt`
- Résultats : mAP50-95 correct (~0.6), bons débuts sur dataset minimal

### 4. **Évaluation des performances**
- Prédiction testée sur une image réelle du jeu de validation
- Sauvegarde de l’image prédite avec masques pour inspection manuelle
- Constats :
  - Détection partielle ou imprécise sur certains cas
  - Décision de capturer ultérieurement des images personnalisées plus représentatives

---

## Limites et axes d'amélioration

- Dataset initial basé sur des images Internet non parfaitement alignées avec les futures caméras du projet
- Amélioration prévue : capturer un **dataset maison** mieux adapté à la situation réelle (cadrage, éclairage, matériel)

---

## Prochaines étapes

1. 📸 Prendre 30–50 nouvelles images avec la caméra réelle
2. 🏷️ Ré-annoter ces images avec Roboflow (même format YOLOv8 Seg)
3. 🔁 Réentraîner le modèle en partant de `best.pt` (fine-tuning)
4. 🤖 Préparer une fonction C++ pour exploiter le modèle en ONNX et associer les 3 polygones aux faces `up/front/right`

---

📌 Une belle étape vers une IA embarquée et automatisée !