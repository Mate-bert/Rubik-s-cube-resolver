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
https://github.com/Mate-bert/Rubik-s-cube-resolver/blob/feature/detection_resolution/src/check_structure.cpp
