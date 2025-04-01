
# Rubik's Cube Resolver 🧩

Projet de traitement d'image et de résolution de Rubik's Cube en C++ avec OpenCV.

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

## 📁 Organisation

- `src/` : code source C++
- `include/` : headers
- `data/` : images, fichiers générés
- `bin/` : exécutables générés
- `obj/` : fichiers objets
- `Makefile` : compilation multi-target
- `config.yaml` : configuration partagée
- `utils/` : utilitaires Python
- `run.sh` (optionnel) : exécution rapide

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
- Ne pas oublier d’**ajouter `msys2` et `git` dans les variables d’environnement système** (PATH).

---

## ✍️ Notes

Ce fichier sera enrichi au fur et à mesure du développement.
