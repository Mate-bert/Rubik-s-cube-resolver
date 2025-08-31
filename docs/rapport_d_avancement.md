## 🧩 Date : 6 avril 2025

---

## 🎯 Objectif du jour

Finaliser l’intégration de l’algorithme de résolution de Rubik's Cube (Kociemba) dans le pipeline principal, y compris l’encodage de la solution trouvée dans un format binaire, en assurant une exécution fluide et robuste depuis `main.cpp`.

---

## ✅ Réalisations

### 1. **Intégration de l’algorithme de résolution Kociemba**
- Création d’un nouveau module `kociemba_solver.cpp` + `kociemba_solver.hpp`
- Fonction `solveWithKociembaFile()` appelée automatiquement depuis `main.cpp` avec le fichier `kociemba_test.txt`
- Prise en compte d’un **timeout dynamique** (défini dans `config.yaml`) pour stopper la recherche après un temps maximum (ex : 5s)
- Sauvegarde de la meilleure solution trouvée dans `resolution.txt`, même en cas d’interruption

### 2. **Encodage binaire de la solution**
- Création d’un nouveau module `traduction.cpp` + `traduction.hpp`
- Fonction `encodeResolution()` prenant le fichier `resolution.txt` et générant un fichier binaire `output_encoded.txt`
- Chaque mouvement (`U`, `R'`, `F2`, ...) converti en **code sur 4 bits** (2 fois pour les `X2`)
- Ajout du mot-clé `"LAST"` à la fin du fichier encodé pour indiquer la fin de la résolution

### 3. **Intégration complète dans `main.cpp`**
- Ajout de la phase `📦 Étape 5 : Encodage de la solution...` dans le pipeline
- Vérification du bon enchaînement :
  - Redressement des faces
  - Détection des couleurs
  - Résolution
  - Traduction
- Affichage d’un retour utilisateur à chaque étape, avec emoji de validation ✅

### 4. **Robustesse & débogage**
- Ajout de **logs dans `solveWithKociembaFile()`** pour traquer les retours et les interruptions
- Résolution d’un problème critique où `main()` n’exécutait plus rien après un `timeout` dans le solveur
  - 🔧 Solution : vérifier que `Solve()` retourne proprement sans `exit()` ni `return` anticipé
- Testé avec succès avec :
  - `kociemba.txt` généré automatiquement depuis la détection
  - `kociemba_test.txt` en test manuel

---

## 🧪 Tests réalisés

- ✔️ Résolution automatique via images + détection couleur
- ✔️ Résolution manuelle via fichier `kociemba_test.txt`
- ✔️ Fichier `output_encoded.txt` conforme, contenant tous les mouvements encodés + le mot `LAST`

---

## 🔄 Prochaines étapes

1. 🔍 Ajouter un test automatique de validation du fichier encodé
2. 🧱 Utiliser le fichier encodé pour piloter une simulation hardware ou un modèle physique
3. 🧪 Ajouter un mode “test” dans le `main` pour exécuter uniquement la traduction, sans détection préalable

---

📌 Une étape cruciale de franchie : l’algorithme de résolution et la traduction binaire sont maintenant **entièrement intégrés** et **fonctionnels** au sein du pipeline C++.  
Prochain objectif : exploiter ce fichier `output_encoded.txt` pour animer le cube ou piloter les moteurs.

---

## 🧩 Date : 7 avril 2025

---

## 🎯 Objectif du jour

Renforcer la robustesse de la vérification structurelle de la chaîne Kociemba et affiner l’encodage binaire pour le pilotage de l’exécution matérielle.

---

## ✅ Réalisations

### 1. Amélioration de `check_structure.cpp`
- Ajout de la **gestion automatique des lettres manquantes** dans la chaîne Kociemba générée (`kociemba_test.txt`).
- Le programme identifie les lettres manquantes et corrige intelligemment :
  - S’il manque 1 ou 2 lettres identiques → remplacement direct des `?`
  - S’il manque plusieurs lettres différentes → test de toutes les combinaisons possibles jusqu’à en trouver une valide.
- Intégration complète dans `main.cpp` **avant** l’étape de résolution.
- Affichage clair : `✅ Structure du cube vérifiée et corrigée si besoin.`

### 2. Intégration propre dans le pipeline principal
- Ajout du bloc de vérification structurelle après la détection des couleurs (`étape 3`) et avant la résolution (`étape 4`).
- En cas d’échec de correction structurelle, le programme affiche : `❌ Structure invalide, correction impossible.` et interrompt proprement la suite.

### 3. Révision du README et documentation du dossier `src/`
- Clarification de la structure du dossier `src/`, `src/analyse/`, `src/kociemba/`
- Fusion avec une version alternative pour fournir une **description hiérarchique complète et annotée** du projet.
- Ajout d’une section `USAGE` à venir dans le `README.md`.

### 4. Suivi et versionnement
- Revue des `settings.json`, `tasks.json` et `c_cpp_properties.json` dans `.vscode/` pour garantir une expérience fluide sous VSCode avec `MinGW`.

---

## 🔄 Prochaines étapes

- Ajouter la gestion de cas ambigu où plusieurs combinaisons structurelles seraient valides.
- Permettre à l'utilisateur de **choisir une correction** ou d'accepter automatiquement la première valide.
- Intégrer un mode `--check-only` pour tester uniquement la structure d’un fichier sans exécuter le pipeline.
---

## 🧩 Date : 17 mai 2025

---

## 🎯 Objectif du jour

Améliorer la robustesse et la complétude du système de détection des stickers visibles sur les images d’un Rubik’s Cube, avec génération automatique des coordonnées des 3 faces visibles, même en cas de détections incomplètes.

---

## ✅ Réalisations

### 1. **Extrapolation automatique des points manquants**
- Détection robuste des stickers via modèle YOLO exporté en `.onnx` et utilisé avec OpenCV.
- Ajout d’une stratégie d’extrapolation vectorielle :
  - Si un point comme `"haut-gauche"`, `"droite"`, `"gauche"`, `"bas"` ou `"bas-droite"` est manquant, mais les points voisins sont présents, il est automatiquement extrapolé.
  - Chaque extrapolation est encadrée par des conditions précises pour éviter les conflits (ex. ne pas extrapoler `"droite"` si `"bas-droite"` est déjà là).
- Affichage visuel (avec couleurs et labels) de chaque point détecté ou extrapolé.

### 2. **Écriture automatique du fichier `faces_coords.txt`**
- Génération du fichier `data/config/faces_coords.txt` à chaque exécution du script.
- Le fichier est automatiquement vidé en début de script pour éviter les doublons.
- Les coordonnées sont enregistrées pour les 6 faces visibles à partir de 2 images (`3face_1.jpg` et `3face_2.jpg`).
- Format standardisé :
  ```
  3face_1.jpg, face_rectified_1.jpg: x1 y1, x2 y2, x3 y3, x4 y4
  ...
  ```

### 3. **Traitement automatique de plusieurs images**
- Le script traite en séquence les deux images clés (`3face_1.jpg` et `3face_2.jpg`) depuis le répertoire `data/raw/`.
- Pour chaque image :
  - Détection
  - Extrapolation (si besoin)
  - Dessin des points
  - Enregistrement des faces valides dans le fichier .txt

### 4. **Vérifications et tests**
- Ajout de messages de debug indiquant les faces ignorées (si un ou plusieurs points sont manquants).
- Validation visuelle par les fichiers `.jpg` générés (`*_predicted.jpg`).
- Vérification que chaque exécution produit exactement 6 lignes dans `faces_coords.txt`.

---

## 🧪 Tests réalisés

- ✔️ Image avec tous les points détectés : pas d’extrapolation, fichier .txt complet.
- ✔️ Image avec un ou deux points manquants : extrapolation active, fichier toujours complet.
- ✔️ Images partiellement corrompues : faces ignorées si trop de points absents (loggué proprement).
- ✔️ Test de l’écriture unique dans le fichier `.txt` (pas de duplication).

---

## 🔄 Prochaines étapes

1. 🔗 Connecter cette détection au module de redressement d’image (`face_rectifieur_manuel.cpp`).
2. 🧠 Ajouter une stratégie d’estimation de la qualité ou de la confiance sur les extrapolations.
3. 📸 Intégrer la capture automatique d’images depuis caméra pour automatiser le pipeline complet.
4. 🧪 Tester sur des images prises en condition réelle pour valider la robustesse du système.

---

📌 Cette journée marque une étape essentielle dans l’automatisation du pipeline :  
l’ensemble des **6 faces extrapolées et rectifiées** est désormais généré **sans intervention manuelle**, même en cas de détection partielle.