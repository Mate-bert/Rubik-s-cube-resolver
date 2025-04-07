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

Ce fichier contient des suggestions d'amélioration inspirées des bonnes pratiques exposées dans :

- Clean Code – Robert C. Martin
- The Pragmatic Programmer – Hunt & Thomas
- Pragmatic Thinking and Learning – Andy Hunt

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
