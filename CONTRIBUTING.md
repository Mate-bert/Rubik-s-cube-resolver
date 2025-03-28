# 🤝 CONTRIBUTING.md – Rubik's Cube Resolver

Merci de contribuer à ce projet ! Ce document explique comment participer proprement au développement du Rubik’s Cube Resolver.

---

## 🧱 Structure du projet

Le projet est divisé en plusieurs sous-parties gérées par des équipes différentes :

- 🎨 Détection des couleurs (OpenCV + C++)
- 📷 Gestion des caméras
- 🤖 Développement du driver des moteurs
- 🧠 Algorithme de résolution (Kociemba)
- 🧰 Intégration FPGA (Zybo 7010)
- 🖨️ Impression 3D pour le support

---

## 🌿 Organisation Git

### Branches principales

- `main` : version **stable** du projet. Aucun développement direct dessus.
- `dev` : branche de **développement commun**.
- Branches personnelles ou de fonctionnalité :
  ```
  feature/<prenom>_<fonctionnalite>
  docs/<type_doc>
  ```

---

## 🧪 Workflow de contribution

### 1. Créer une branche

```bash
git checkout dev
git pull
git checkout -b feature/prenom_tache
```

Exemples :
- `feature/gad_detection_couleur`
- `docs/todo`

### 2. Travailler, commit, push

```bash
git add .
git commit -m "Message clair sur ce qui a été fait"
git push -u origin <nom_de_ta_branche>
```

### 3. Créer une Pull Request

Depuis GitHub :
- Base branch : `dev`
- Compare : ta branche
- Donne un titre clair et une description si besoin

---

## 📝 Documentation

### Fichier `TODO.md`

- Localisé à la racine du projet
- Utilisé pour suivre les tâches en cours dans chaque sous-système
- Modifier depuis une branche dédiée (`docs/todo`)
- N'oublie pas de **pull avant modification** :
  ```bash
  git pull origin docs/todo
  ```

---

## ✔️ Bonnes pratiques

- Des **commits clairs et atomiques**
- Pas de push direct sur `main` ou `dev`
- Une **PR = une fonctionnalité**
- Communiquer en cas de conflit ou question

---

Merci pour ta contribution ! 🚀
