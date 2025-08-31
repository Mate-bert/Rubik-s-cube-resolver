# Rubik's Cube Resolver 🧩

Projet de traitement d'image et de résolution de Rubik's Cube en C++ avec OpenCV.

---

## 📁 Structure du projet

```
rubiks-cube-resolver/
│
├── .vscode/                     # Configuration de l'environnement de développement sous VSCode
│   ├── settings.json            # Chemins personnalisés, formatage, terminal
│   ├── c_cpp_properties.json    # Chemins d'inclusion pour MinGW
│   └── tasks.json               # Tâches de build (make, exécution…)
│
├── src/                         # Code source principal du projet
│   ├── main.cpp                 # Point d'entrée du programme
│   ├── config.cpp               # Chargement de la configuration depuis le fichier YAML
│   ├── ColorDetector.cpp        # Détection des couleurs dominantes sur chaque sticker
│   ├── face_rectifieur_*.cpp    # Rectification des images de faces (auto ou manuel)
│   ├── split_stickers.cpp       # Découpe des faces en 9 stickers
│   ├── traduction.cpp           # Encodage binaire des mouvements de résolution (4 bits)
│   ├── check_structure.cpp      # Vérification et correction automatique de la structure du cube
│   └── kociemba_solver.cpp      # Résolution avec la lib Kociemba (bibliothèque tierce C++)
│
├── src/analyse/                 # Scripts d'analyse (Python et C++)
│   ├── analyse_kociemba*.cpp    # Comparaison de chaînes Kociemba
│   ├── analyse_erreurs.py       # Statistiques sur les erreurs de détection/correction
│   ├── check_cube_structure.py  # Ancienne version de validation de structure (Python)
│   ├── edition_cube_interactif.py # Modification manuelle d'un cube depuis l'interface
│   └── visu_cube.py             # Visualisation graphique d'un cube à partir de sa chaîne
│
├── src/kociemba/                # Bibliothèque tierce C++ (https://github.com/blitzingeagle/rubiks3-solve)
│   ├── *.cpp                    # Fichiers sources de la résolution
│   └── *.hpp                    # Fichiers headers
│
├── data/
│   ├── config/                  # Fichiers YAML (notamment `config.yaml`)
│   ├── output/                  # Données générées (résolution.txt, images, encodage binaire…)
│   ├── tables/                  # Tables de mouvements et de pruning du solveur
│   └── groundtruth/             # Données de référence ou de test (états valides)
│
├── include/                     # Headers associés aux modules maison (config, traduction, structure…)
├── obj/                         # Objets compilés (par dossier)
├── bin/                         # Binaire compilé (`main.exe`)
├── scripts/                     # Outils et scripts (ex: `git_push.sh`)
├── makefile                     # Compilation via `make`
└── README.md                    # Documentation principale du projet
```

---

## 📦 Compilation

Utilise **MSYS2 MinGW64** pour compiler sans erreur et sans privilèges admin.

```bash
make build        # Compile tous les exécutables
make build-main   # Compile uniquement main.exe
make build-analyse1   # Compile analyse_kociemba.exe
make build-analyse2   # Compile analyse_kociemba_v2.exe
```

---

## 🚀 Exécution

Utilise **Git Bash** pour lancer les exécutables et afficher les sorties correctement.

```bash
./bin/main.exe
./bin/analyse_kociemba.exe
./bin/analyse_kociemba_v2.exe
```

Ou via make :

```bash
make run-main
make run-analyse1
make run-analyse2
```

⚠️ Ces commandes peuvent ne pas afficher de sortie dans MSYS2. Utilise Git Bash pour une exécution fiable.

---


## 🧪 Dépendances

- **MSYS2** (obligatoire pour compiler correctement)
- **Git** (nécessaire pour cloner OpenCV)
- **OpenCV** (recompilé depuis les sources avec MSYS2)

### 🔧 Remarques sur OpenCV :
- Recompilé depuis Git avec le compilateur :
  ```bash
  $ which gcc
  /mingw64/bin/gcc
  ```
- OpenCV doit être compilé avec **le même compilateur `g++`** que celui utilisé pour ton projet.
- Ne pas oublier d'**ajouter `msys2` et `git` dans les variables d'environnement système** (PATH).

---

Lance le programme principal :

```bash
./bin/main.exe
```

Ce programme effectue les étapes suivantes :
1. Redressement des faces
2. Découpage des stickers
3. Détection des couleurs dominantes
4. Génération d'une chaîne Kociemba
5. Vérification automatique de la structure du cube (et correction)
6. Résolution via l'algorithme Kociemba
7. Encodage binaire des mouvements
8. Sauvegarde des résultats (`resolution.txt`, `output_encoded.txt`, etc.)

---

## 📦 Exemples de fichiers

### Exemple de chaîne Kociemba
```txt
"U:DRLUUBFBR",
"R:BLURRLRUB",
"F:LRDDFDLFU",
"D:FUFFDBRDU",
"L:BRUFLLFDD",
"B:BFLUBLRBD"
```

---

## 🧠 Fonctions avancées

- 🔍 **Correction automatique** de chaînes incomplètes : si une face a des stickers manquants (`?`), le programme tentera toutes les combinaisons possibles et choisira la structure valide.
- 📥 **Encodage 4 bits** de chaque mouvement (ex: `U`, `U'`, `U2`).
- 🧪 **Tests intégrés** pour vérifier la cohérence des modules (`analyse_kociemba`, `check_structure`...).

---

## 📚 Crédits

- [blitzingeagle/rubiks3-solve](https://github.com/blitzingeagle/rubiks3-solve) pour l'implémentation du solveur Kociemba en C++.

---

## 🛠️ Installation des dépendances

### Installation de MSYS2
1. Téléchargez MSYS2 depuis [le site officiel](https://www.msys2.org/)
2. Installez-le dans le dossier par défaut (`C:\msys64`)
3. Ouvrez MSYS2 MinGW64 et mettez à jour les paquets :
```bash
pacman -Syu
```

### Installation des outils de développement
```bash
pacman -S mingw-w64-x86_64-toolchain
pacman -S git
pacman -S make
```

### Installation d'OpenCV
```bash
# Cloner OpenCV
git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build && cd build

# Configuration avec CMake
cmake -G "MSYS Makefiles" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/mingw64 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    ..

# Compilation et installation
make -j4
make install
```

---

## 🔍 Dépannage

### Problèmes courants

1. **Erreur de compilation OpenCV**
   - Vérifiez que vous utilisez le même compilateur que celui de MSYS2
   - Assurez-vous que les variables d'environnement sont correctement configurées

2. **Erreur d'exécution**
   - Vérifiez que tous les DLLs nécessaires sont dans le PATH
   - Exécutez le programme depuis Git Bash plutôt que MSYS2

3. **Problèmes de détection de couleurs**
   - Vérifiez l'éclairage de la pièce
   - Ajustez les paramètres dans `config.yaml`

---

## 👥 Contribution

Les contributions sont les bienvenues ! Voici comment contribuer :

1. Fork le projet
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request
