
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
---

## Date : 31 mars 2025

---

## Objectif du jour

Finaliser l'automatisation du pipeline de traitement d’image, fiabiliser l’enchaînement des modules, et améliorer l’analyse des erreurs de reconnaissance des couleurs via un script Python.

---

## Réalisations

### 1. **Fiabilisation du pipeline C++**
- Ajout d’un mécanisme de copie temporaire des images d’entrée (`3face_1.jpg`, `3face_2.jpg`) à partir des deux fichiers les plus récents de `data/raw`
- Suppression conditionnelle uniquement des fichiers temporaires générés, pour ne jamais supprimer un fichier manuel
- Sécurisation de l’écriture des fichiers redressés (`face_rectified_X.jpg`) avec création automatique des dossiers parents

### 2. **Création d’un analyseur d’erreurs**
- Script Python `analyse_erreurs.py` capable de :
  - Lire le fichier `erreurs.json` généré par `analyse_kociemba_v2.cpp`
  - Afficher un aperçu tabulaire des erreurs (face, position, valeur réelle et attendue)
  - Tracer un histogramme des erreurs par couleur ou par face
- Mise en place d’un fallback automatique :
  - Sauvegarde du graphe si `plt.show()` échoue (cas MSYS2/MINGW64)

### 3. **Résolution d’un crash `matplotlib`**
- Problème identifié : crash de `plt.show()` sous MINGW64 ou Git Bash
- Solution : forçage du backend `TkAgg` avec vérification de la présence de `tkinter`
- Vérification faite via `python -m tkinter` (test concluant)
- Activation de l’affichage avec `plt.show()` à nouveau fonctionnel

---

## Bilan

- ✅ Pipeline complet stabilisé, du chargement des images à la génération de `kociemba.txt`
- ✅ Pipeline d’analyse d’erreurs visuelles en Python utilisable et maintenable
- ✅ Confort d’utilisation grandement amélioré pour les tests et les répétitions de runs

---

## Prochaines étapes

1. 📁 Ajouter un fichier `config.yaml` pour centraliser tous les chemins (optionnel)
2. 📊 Ajouter une heatmap des positions d’erreurs fréquentes dans `analyse_erreurs.py`
3. 🧠 Lancer un nouveau fine-tuning du modèle IA avec un dataset maison plus réaliste
4. 📤 Envisager l’export automatique de stats JSON/CSV à chaque run

---

📅 Fin de session très productive, pipeline prêt à être réutilisé sereinement !
---

## Date : 1ᵉʳ avril 2025

---

## Objectif du jour

Poursuivre la consolidation du projet Rubik's Cube Resolver en renforçant les outils d’analyse, de visualisation et d’automatisation via Git et Python.

---

## Réalisations

### 1. **Visualisation des résultats de détection**
- Création d’un script `visu_cube.py` utilisant `matplotlib` pour afficher :
  - Le cube attendu (`kociemba_verif.txt`)
  - Le cube détecté (`kociemba.txt`)
  - Un visuel des erreurs (matchs et mismatches par couleur et position)
- Conversion intelligente des lettres (U, F, R, etc.) en couleurs (`yellow`, `red`, etc.)
- Affichage en 3 lignes de 9 cases, selon les conventions du Rubik’s Cube

### 2. **Optimisation du pipeline d’analyse**
- Conservation du fichier `res.txt` généré par `analyse_kociemba.cpp`
- Décision de le garder pour des raisons de traçabilité (log brut)
- Ajout possible d'une analyse en Python via JSON par la suite

### 3. **Intégration Git améliorée**
- Création d’un script `git_push.sh` sans TUI :
  - Sélection des fichiers à ajouter
  - Choix du type de commit (`feat`, `fix`, `docs`, etc.)
  - Message de commit personnalisé
  - Boucle interactive pour plusieurs commits
  - Push en fin de session
- Ajout d’une version TUI testée mais abandonnée (problèmes de compatibilité avec `dialog`)
- Utilisation finale : simple, robuste, multi-environnement (Git Bash, MSYS2, WSL)

### 4. **Makefile unifié et multi-cibles**
- Ajout des targets :
  - `build` : compilation des binaires (`main`, `analyse_kociemba`, `analyse_kociemba_v2`)
  - `run-main`, `run-analyse1`, `run-analyse2` : exécutions automatisées
  - `clean` : suppression des exécutables et objets
- Intégration des chemins nécessaires à OpenCV compilé manuellement (via MSYS2)
- Résolution des problèmes d’accès temporaire sous Git Bash via MSYS2

---

## Problèmes rencontrés

- ❌ Crash `plt.show()` sous Git Bash → résolu par `TkAgg`
- ❌ Compilation impossible dans Git Bash (erreur TMPDIR) → contournement : build dans MSYS2
- ❌ `dialog` non disponible ou instable sur Git Bash/MSYS2 → TUI abandonné
- ❌ Problème de détection de fichiers modifiés (`git status`) entre WSL et Git Bash → investigation menée

---

## Bilan

- ✅ Outils d’analyse visuelle très utiles pour la validation des résultats
- ✅ Pipeline d’utilisation Git plus propre, moins de commits désorganisés
- ✅ Base de code propre avec centralisation progressive dans `config.yaml`
- ✅ Utilisation multi-plateforme clarifiée (Git Bash : exécution, MSYS2 : compilation)

---

## Prochaines étapes

1. 🧩 Débuter le lien entre détection IA des faces et génération automatique des coordonnées

---

📌 Journée très dense, axée sur l’outillage du projet pour aller plus vite ensuite.  
Prochaine étape : automatiser la fin du pipeline et relancer l’IA !
---
## Date : 2 avril 2025

---

## 🎯 Objectifs de la journée

- Créer une interface interactive pour saisir manuellement un cube
- Valider la structure du cube (coins, arêtes, permutations) automatiquement
- Exporter l'état du cube dans différents formats (`etat_cube.txt`, `kociemba_verif.txt`)
- Centraliser les fonctions de visualisation dans un module réutilisable

---

## ✅ Réalisations

### 1. **Interface interactive de saisie du cube**
- Développement d’un outil en `Tkinter` (`edition_cube_interactif.py`) permettant :
  - La saisie des 6 faces du Rubik’s Cube via une grille visuelle
  - La limitation d’une seule lettre parmi les 6 (`U`, `F`, `R`, `D`, `L`, `B`) par case
  - L’ajout de presets rapides : cube résolu, cube tout U

### 2. **Vérification structurelle automatique**
- Intégration du script `check_cube_structure.py`
- Affichage d’un message clair dans une pop-up en cas d’erreur (et non plus dans le terminal)
- Réorganisation complète du script pour :
  - Lever une erreur si la structure est invalide
  - Laisser passer uniquement les configurations valides

### 3. **Export et import depuis les fichiers Kociemba**
- Boutons ajoutés dans l’interface pour :
  - 💾 Sauvegarder l’état dans `etat_cube.txt`
  - 📤 Exporter dans `kociemba_verif.txt`
  - 📥 Importer depuis `kociemba_verif.txt` pour recharger un cube précédemment détecté

### 4. **Modularisation du code**
- Extraction de la fonction `draw_basic_face` et des coordonnées `face_positions` dans `utils/affichage_cube.py`
- Réutilisation dans :
  - `edition_cube_interactif.py` pour visualiser l’état saisi
  - `visu_cube.py` pour afficher la comparaison prédiction/référence

### 5. **Amélioration de `visu_cube.py`**
- Nettoyage du fichier pour éviter l’exécution automatique à l’import
- Ajout d’une protection `if __name__ == "__main__"` pour que la figure complète (réf/prédiction/résultat) ne s’affiche que lors d’une exécution directe

---

## 🐞 Problèmes rencontrés et corrigés

- ❌ La visualisation se lançait toute seule à l’import → corrigé avec un bloc `__main__`
- ❌ Les erreurs de structure ne bloquaient pas l’interface → corrigé en levant une `ValueError`
- ❌ Les lettres n’étaient plus affichées dans la visualisation → réintégrées dans `draw_basic_face()`
- ❌ Inversion des couleurs (F = green, R = red, etc.) → corrigée selon convention U=yellow, F=red, R=green, etc.
- ❌ Décalage visuel sur la figure de comparaison → alignement vertical corrigé

---

## 🔄 Prochaines étapes

1. 🖼️ Ajouter la possibilité de sauvegarder une visualisation du cube saisi
2. 🔎 Lier cette interface avec les résultats de détection couleur
3. 📊 Exporter un résumé Markdown ou HTML des tests réalisés
4. 🤖 Continuer l’entraînement de l’IA sur un dataset maison pour détecter automatiquement les faces

---

📌 Interface fonctionnelle, validation structurelle fiable, et outils bien modulés.  
Le projet est prêt pour l’intégration complète des étapes d’analyse !
---
## Date : 3 April 2025

---

## 🎯 Objectif du jour

- Capturer automatiquement des images 640×640 du Rubik’s Cube via webcam sur un PC Linux
- Enrichir le dataset pour l’IA à partir d’images réelles et faciliter leur annotation
- Finaliser le redressement automatique des faces via `face_rectifieur_auto.cpp` et `faces_coords.txt`

---

## ✅ Réalisations

### 1. **Capture d'images depuis la webcam (PC Linux)**  
- Mise en place d’un script C++ (`main.cpp`) utilisant OpenCV pour :
  - Capturer une image en 640×480
  - La transformer automatiquement en format 640×640 (padding noir)
  - L’afficher en temps réel avec OpenCV
  - La sauvegarder à la pression de la touche `ESPACE`
- Compilation sous Linux avec :
  ```bash
  g++ main.cpp -o capture_cube `pkg-config --cflags --libs opencv4`
  ```

### 2. **Logique d’annotation simplifiée pour l’IA**
- Le Rubik's Cube physique et la webcam étant désormais disponibles, un dataset réel peut être constitué pour améliorer les performances du modèle IA.

- Choix stratégique : n’utiliser qu’une **seule classe `face`** pour toutes les faces visibles
- Attribution des identités (`up`, `front`, `right`) des faces basée sur :
  - Le **nom de l’image** (`3face_X.jpg`)
  - La **position relative** du polygone détecté
- Cela permet d’entraîner plus rapidement le modèle IA sans avoir à distinguer manuellement les 6 faces dans les labels

### 3. **Adaptation complète du pipeline à la nouvelle taille 640×640**
- Suppression de tout redimensionnement intermédiaire à 800px
- Adaptation de `face_rectifieur_manuel.cpp` et `face_rectifieur_auto.cpp` :
  - Les coordonnées sont désormais définies dans l’espace 640×640 directement
  - Tous les fichiers de traitement ont été mis à jour en conséquence (`split_stickers`, `ColorDetector`, etc.)
- Centralisation de la taille des images dans `config.yaml` (paramètre `image_size` ajouté)

---

## 🔍 Problèmes rencontrés et corrigés

- ❌ Image noire lors du redressement automatique → résolu en corrigeant l’échelle des coordonnées
- ❌ Mauvais nom d’output dans `face_rectifieur_auto.cpp` → ajusté avec le nom réel attendu

---

## 🧠 Prochaines étapes

1. ✨ Automatiser la génération du fichier `faces_coords.txt` à partir des prédictions de l’IA
2. 🏷️ Annoter les images capturées avec Roboflow (polygones pour chaque face visible)
3. 🧠 Réentraîner un modèle YOLOv8 plus adapté (ex : `yolov8s-seg.pt`) avec ce nouveau dataset
4. 🤖 Intégrer l’inférence IA sur la Zybo 7010 en C++ (via ONNX et OpenCV DNN)

---

📸 Capture d’images fonctionnelle, annotations pensées pour l’embarqué, et pipeline homogénéisé sur 640×640.
Le projet est maintenant prêt pour un entraînement IA efficace !