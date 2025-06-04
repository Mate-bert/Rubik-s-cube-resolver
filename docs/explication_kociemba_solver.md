
# Explication du module `kociemba_solver`

Ce module permet de **résoudre un Rubik’s Cube** à partir d’un fichier texte contenant les **facelets** des 6 faces du cube. Il repose sur le moteur de résolution Kociemba.

---

## 🔧 Fonctionnement général

1. **Chargement du fichier**
   - Le fichier texte contient **6 lignes**, une par face du cube.
   - Chaque ligne contient 9 caractères (couleurs) : `"UUUUUUUUU"`.

2. **Nettoyage**
   - Les guillemets et virgules sont supprimés de chaque ligne.

3. **Validation du format**
   - Si le fichier ne contient pas exactement 6 lignes, une erreur est renvoyée.

4. **Parsing des facelets**
   - `CubeParser` analyse les 6 lignes et les stocke dans un objet `FaceletCube`.

5. **Validation du cube**
   - `FaceletCube::Validate()` vérifie la validité structurelle du cube.

6. **Résolution**
   - `solver.InitializeTables()` initialise les tables de mouvement.
   - `solver.Solve()` lance la recherche de solution.
   - Si une solution est trouvée, elle est affichée avec `solver.PrintSolution()`.

---

## 🧱 Fonction principale

- `void solveWithKociembaFile(const std::string& kociemba_path)`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── kociemba_solver.hpp         # Déclaration
│   └── kociemba/
│       ├── CubeParser.hpp
│       ├── RubiksCube.hpp
│       └── Solver.hpp
├── src/
│   └── kociemba_solver.cpp         # Implémentation
│   └── kociemba/
│       ├── CubeParser.cpp
│       ├── RubiksCube.cpp
│       └── Solver.cpp
├── data/
│   └── output/
│       └── kociemba.txt            # Fichier contenant les facelets
```

---

## ✅ Résultat attendu

- En entrée : un fichier texte avec les 6 faces du cube.
- En sortie : les mouvements pour résoudre le cube (affichés dans le terminal).

---

## Exemple de `kociemba.txt`

```
UUUUUUUUU
RRRRRRRRR
FFFFFFFFF
DDDDDDDDD
LLLLLLLLL
BBBBBBBBB
```

## Exemple d’appel

```cpp
solveWithKociembaFile("data/output/kociemba.txt");
```
