# ✅ TODO – Détection des couleurs (Rubik's Cube Resolver)

Ce fichier suit l'avancement de la tâche dédiée à la détection des couleurs d’un Rubik's Cube, à partir d’images prises du cube.  
Ce travail fait partie d’un projet global impliquant plusieurs sous-systèmes (FPGA, moteurs, caméras, impression 3D...).

---

## 🎯 Objectif

Identifier les couleurs présentes sur chaque face du Rubik's Cube à partir de deux images, et générer une chaîne représentant l’état du cube pour la transmettre à l’algorithme Kociemba.

---

## 🧩 Étapes du développement

- [x] Définir le fonctionnement global : 2 images → 3 faces visibles par image → 6 faces au total
- [x] Découper chaque image en 3 (manuellement ou via script)
- [ ] Créer 6 programmes (ou fonctions) pour traiter chaque face indépendamment
- [ ] Pour chaque face :
  - [ ] Charger l’image correspondante
  - [ ] Découper en 9 cases (3x3)
  - [ ] Convertir les couleurs en HSV
  - [ ] Moyenniser les pixels par case
  - [ ] Associer chaque moyenne à une couleur (`R`, `G`, `B`, `O`, `Y`, `W`)
  - [ ] Générer une chaîne de 9 caractères représentant la face

---

## 🔧 Structuration du code

- [ ] Décider entre plusieurs fichiers (un par face) ou un seul fichier centralisé avec plusieurs fonctions
- [ ] Si les traitements diffèrent trop entre faces (angles, éclairage), prévoir une fonction spécifique par face :  
  `detect_face1()`, `detect_face2()`, ...
- [ ] Regrouper les chaînes de caractères des 6 faces pour produire l’état global du cube :
  `std::string full_cube = f1 + f2 + ... + f6`

---

## 🧪 Tests et calibrations

- [ ] Vérifier la robustesse de la détection face par face
- [ ] Ajuster les seuils HSV manuellement pour chaque couleur
- [ ] Créer un outil de calibration (optionnel)
- [ ] Sauvegarder les résultats dans un fichier pour vérification

---

## 🚀 Étape finale

- [ ] Transmettre la chaîne `full_cube` à l’algorithme de résolution (Kociemba)

---

_Note : Cette tâche est réalisée en C++ avec OpenCV._
