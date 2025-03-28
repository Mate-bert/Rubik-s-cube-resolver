# 🗂️ Structure des branches de documentation – Rubik's Cube Resolver

Ce fichier décrit le rôle de chaque branche documentaire (`docs/*`) et les fichiers attendus dans chacune.

---

## 📁 docs/readme

### ✅ Contenu :
- `README.md` : Présentation générale du projet, stack technique, liens utiles

### 🚫 Ne doit pas contenir :
- `TODO.md`
- `CONTRIBUTING.md`
- Fichiers de code

---

## 📁 docs/contributing

### ✅ Contenu :
- `CONTRIBUTING.md` : Règles pour contribuer proprement (Git, branches, PR, workflow)

### 🚫 Ne doit pas contenir :
- `README.md`
- `TODO.md`
- Code source

---

## 📁 docs/todo

### ✅ Contenu :
- `TODO.md` : Liste des tâches techniques à réaliser (ex. détection des couleurs)

### 🚫 Ne doit pas contenir :
- `README.md`
- `CONTRIBUTING.md`
- Fichiers de code

---

## 📁 docs/conduct (optionnelle)

### ✅ Contenu :
- `CODE_OF_CONDUCT.md` : Règles de respect, comportement, inclusion

---

## 📁 feature/<nom>

### ✅ Contenu :
- Le code source de la fonctionnalité en développement (C++, Python, etc.)

### 🚫 Ne doit pas contenir :
- Fichiers de documentation globale (README.md, TODO.md, etc.)

---

## 🔁 Rappel

Chaque branche documentaire ne doit contenir **que ce qui concerne son rôle**. Cela permet de :
- garder un historique clair
- faire des Pull Requests propres
- éviter les conflits inutiles
