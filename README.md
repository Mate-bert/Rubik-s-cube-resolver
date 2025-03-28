# Rubik's Cube Resolver 🧩

Projet collaboratif visant à développer un système capable de résoudre un Rubik's Cube à partir d'une image capturée.

---

## 🛠️ Stack technique

- **Langages** : C / C++ / Python
- **Plateforme** : Zybo / PC
- **Bibliothèques** : OpenCV, etc.
- **Versioning** : Git + GitHub

---

## 🌱 Organisation Git

### Branches principales

- `main` : version **stable** du projet (aucun développement direct).
- `dev` : branche **de développement** commune, où toutes les fonctionnalités sont fusionnées après validation.

### Branches de fonctionnalités

Chaque membre travaille sur une branche personnelle, dérivée de `dev`, nommée selon la convention :

```
feature/<prenom>_<nom_de_la_fonctionnalite>
```

**Exemples :**
- `feature/gad_detection_couleur`
- `feature/rayane_resolveur_cube`

---

## 🔁 Workflow de contribution

### 1. Cloner le dépôt

```bash
git clone https://github.com/Mate-bert/Rubik-s-cube-resolver.git
cd Rubik-s-cube-resolver
```

### 2. Basculer sur `dev` et créer sa branche personnelle

```bash
git checkout dev
git pull
git checkout -b feature/<prenom>_<fonction>
git push -u origin feature/<prenom>_<fonction>
```

### 3. Commiter régulièrement

```bash
git add .
git commit -m "Description claire de ce qui a été fait"
git push
```

### 4. Créer une Pull Request

Une fois ta fonctionnalité prête, crée une **Pull Request (PR)** vers `dev`.

Discuter, relire, valider et merger ensemble !

---

## 📌 Bonnes pratiques

- Ne jamais développer directement sur `main` ou `dev`.
- Commits réguliers, clairs et compréhensibles.
- Un seul objectif par branche.
- Toujours faire un `git pull` de `dev` avant de créer une nouvelle branche.
- Communiquer avec l’équipe si des conflits apparaissent.

---

## 📄 Fichier TODO.md

Le fichier `TODO.md` se trouve à la **racine du projet**. Il est utilisé pour suivre l'avancement des différentes parties du projet, comme la détection des couleurs, la gestion des caméras, l'impression 3D, le FPGA, les moteurs, etc.

### ➕ Ajouter ou modifier une tâche

1. Ouvrir le fichier `TODO.md` et ajouter/modifier la section souhaitée.
2. Ajouter le fichier à Git :
   ```bash
   git add TODO.md
   git commit -m "Mise à jour du fichier TODO.md"
   git push
   ```

### 🔁 Travailler sur une branche dédiée au TODO

Pour centraliser les modifications du fichier `TODO.md`, une branche `docs/todo` a été créée.

- Pour créer la branche localement et y travailler :
  ```bash
  git checkout -b docs/todo
  ```

- Ou pour la récupérer si elle existe déjà :
  ```bash
  git fetch origin
  git checkout docs/todo
  ```

- Pour fusionner les mises à jour dans `dev` :
  - Créez une **Pull Request** depuis `docs/todo` vers `dev`.

### 📥 Comment pull depuis différentes branches

Voici comment récupérer du contenu depuis une autre branche :

```bash
git pull origin main      # Met à jour depuis la branche main
git pull origin dev       # Met à jour depuis la branche dev
git pull origin docs/todo # Met à jour depuis la branche TODO
```

---