# ✅ TODO pour `check_structure.cpp`

Ce fichier contient des suggestions d'amélioration inspirées des bonnes pratiques exposées dans :

- Clean Code – Robert C. Martin
- The Pragmatic Programmer – Hunt & Thomas
- Pragmatic Thinking and Learning – Andy Hunt

## 🧠 Refactoring suggéré

**Objectif :** Diviser `check_structure.cpp` en plusieurs fichiers pour clarifier les responsabilités de chaque fonction.

---

### 📦 À séparer dans des fichiers dédiés

- **`reader.hpp/cpp`**
  - `readKociembaLines(path)`
  - `saveLines(path, lines)`
  - Objectif : gérer les I/O sur les fichiers Kociemba

- **`structure_checker.hpp/cpp`**
  - `isStructureValid(lines)`
  - Objectif : valider si une structure est correcte

- **`missing_letters.hpp/cpp`**
  - `getMissingColors(stickers)`
  - Objectif : déterminer quelles couleurs manquent

- **`permute_filler.hpp/cpp`**
  - `tryPermutations(...)`
  - Objectif : essayer des combinaisons de correction

- **`check_structure.cpp` (conserve)**
  - `checkAndFixKociembaStructure(path)`
  - Rôle : orchestre les appels précédents

---

### 🛠️ Tâches associées

- [ ] Créer les nouveaux fichiers `.hpp` et `.cpp` dans `src/`
- [ ] Inclure les headers appropriés
- [ ] Adapter le `makefile`
- [ ] Ajouter un test unitaire pour chaque module (si possible)

---

🔗 Code actuel concerné :  
[check_structure.cpp – Branche `feature/detection_resolution`](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/check_structure.cpp)

---

# ✅ TODO pour `ColorDetector.cpp`

## 🧠 Refactoring suggéré

**Objectif :** Améliorer la clarté, testabilité et maintenabilité du fichier.

---

### 📌 Remarques principales

- ✅ **Responsabilité unique :** La classe semble bien concentrée sur la détection de couleur.
- ⚠️ **Mélange responsabilité / affichage :**
  - Les `std::cout` de debug pourraient être désactivables (flag `verbose` ou logger).
- 🔁 **Code dupliqué :**
  - Vérifier s’il y a des blocs similaires dans d’autres fichiers (ex. configuration HSV par couleur).
- 🔤 **Nom des méthodes :**
  - `detectDominantColor(...)` est clair, mais la classe `ColorDetector` pourrait bénéficier d’un nom plus précis (ex: `HSVColorClassifier`) si elle est strictement liée à HSV.
- 🎨 **Couleurs en dur :**
  - Les plages HSV sont codées en dur : possibilité de les extraire dans un fichier de config ou une `ColorProfile` map.
- 🧪 **Tests unitaires :**
  - Ajouter des tests automatisés pour des patchs d’images ou couleurs connues simulées.

---

### 🔧 Tâches associées

- [ ] Ajouter un flag `verbose` dans la classe pour désactiver les `std::cout`
- [ ] Extraire les plages HSV dans un fichier ou structure dédiée
- [ ] Ajouter une fonction d’initialisation des seuils pour séparer la config du comportement
- [ ] Ajouter des tests avec patchs BGR pour valider les résultats

🔗 Code actuel concerné :  
[ColorDetector.cpp – Branche `feature/detection_resolution`](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/ColorDetector.cpp)

---

## ✅ TODO pour `config.cpp`

### 🧠 Refactoring suggéré

**Objectif :** Clarifier la structure du module de configuration et en améliorer la testabilité.

---

### 📌 Remarques principales

- ✅ **Responsabilité unique :** Le module charge bien la configuration depuis un fichier YAML.
- 📦 **Code couplé à `yaml-cpp` :**  
  → Envisager une interface (`IConfigProvider`) pour permettre le test ou le remplacement de backends YAML plus tard.
- 🔁 **Chargement statique / répétitif :**  
  → La fonction `loadYamlConfig()` recharge le fichier à chaque appel. Si la config ne change pas dynamiquement, on pourrait la charger une seule fois et la partager (singleton ou objet global injecté).
- ⚠️ **Validation implicite :**  
  → Il manque des vérifications sur les clés obligatoires. Ajouter une fonction `validateConfig()` pour alerter si des champs sont manquants.

---

### 🔧 Tâches associées

- [ ] Ajouter une interface virtuelle `IConfigProvider` (facultatif)
- [ ] Ajouter une fonction `validateConfig(const YAML::Node&)`
- [ ] Factoriser un chargement unique (éventuellement dans `main.cpp`)
- [ ] Ajouter des tests unitaires pour simuler des fichiers YAML partiels ou erronés

🔗 Code actuel concerné :  
[config.cpp – Branche `feature/detection_resolution`](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/config.cpp) 

---

# ✅ TODO pour `face_rectifieur_auto.cpp`

## 🧠 Refactoring suggéré

**Objectif :** Isoler les responsabilités de détection de contours, de transformation de perspective, et de validation dans des fonctions ou modules dédiés.

---

### 📌 Remarques principales

- ⚠️ **Trop de responsabilités dans une même fonction**  
  → La fonction principale semble effectuer plusieurs étapes critiques : binarisation, détection de contours, tri, transformation. Il serait plus clair de les séparer.

- 🔁 **Redondance de code possible**  
  → Le tri des points (`std::sort`) et les vérifications géométriques (angles, proportions) peuvent être factorisés.

- 📐 **Nom des fonctions**  
  → Privilégier des noms précis comme `findLargestSquareContour()`, `applyPerspectiveTransform()`, etc.

- 🧪 **Testabilité**  
  → Beaucoup de traitements sont liés à OpenCV, il serait utile de rendre testables les étapes unitaires avec des images simulées.

- 🔍 **Messages de log**  
  → Uniformiser les logs avec des emojis ou un logger central pour aider au debug.

---

### 🔧 Tâches associées

- [ ] Extraire les étapes suivantes dans des fonctions dédiées :
  - [ ] Détection de contours valides
  - [ ] Tri des points
  - [ ] Transformation de perspective
- [ ] Ajouter des vérifications supplémentaires pour s’assurer de la validité du quadrilatère détecté
- [ ] Créer une fonction d’aide pour afficher les quadrilatères détectés en debug
- [ ] Ajouter des tests avec des images binaires simulées

🔗 Code actuel concerné :  
[face_rectifieur_auto.cpp – Branche `feature/detection_resolution`](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/face_rectifieur_auto.cpp)

---

# ✅ TODO pour `kociemba_solver.cpp`

## 🧠 Refactoring suggéré

**Objectif :** Isoler la logique de parsing, de validation et de résolution dans des fonctions ou classes dédiées pour améliorer la clarté et la testabilité.

---

### 📌 Remarques principales

- ⚠️ **Fonction trop longue (`solveWithKociembaFile`)**
  - Actuellement, cette fonction effectue plusieurs tâches : ouverture du fichier, parsing, validation, initialisation et résolution.
  - Elle enfreint le principe de responsabilité unique (Clean Code).

- 🧱 **Pas de séparation I/O / logique**
  - La lecture du fichier et l’analyse sont directement imbriquées. On pourrait extraire le parsing dans une fonction `parseKociembaFile(...)`.

- 🧪 **Pas de testabilité unitaire**
  - Les étapes intermédiaires (validation du cube, parsing, résolution) ne peuvent pas être testées séparément.

- 🗃️ **Hardcoded :**
  - Le chemin de sortie, les logs et messages sont en dur. Prévoir une structure de paramétrage ou de logging.

---

### 🔧 Tâches associées

- [ ] Extraire la lecture du fichier dans une fonction `readKociembaFile(...)`
- [ ] Créer une fonction `validateParsedCube(...)`
- [ ] Créer une fonction `runSolver(...)` ou `solveCube(RubiksCube&)`
- [ ] Ajouter un `verbose` ou `logger` optionnel
- [ ] Ajouter des tests simulés de chaque étape

🔗 Code actuel concerné :  
[kociemba_solver.cpp – Branche `feature/detection_resolution`](https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/kociemba_solver.cpp)