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

---

## 🧠 Astuce : Bonnes pratiques sur les branches

🛠️ Pour garder un dépôt propre et facile à comprendre, il est conseillé de créer des branches **thématiques** et **ciblées** selon le type de modification.

### 📁 Exemples de conventions de branches

| Type de modification        | Branche recommandée         |
|----------------------------|-----------------------------|
| Fonction de détection       | `feature/<prenom>_<fonction>` |
| Mise à jour du README       | `docs/readme`               |
| Ajout/modification du TODO  | `docs/todo`                 |
| Rédaction du CONTRIBUTING.md| `docs/contributing`         |

📌 Même si Git permet de pousser n’importe quel fichier depuis n’importe quelle branche, **évitez de mélanger du code, de la doc et du debug dans une seule branche**.

🎯 Objectif : une branche claire = une tâche/un thème bien identifié.

---

## 🔗 Liens utiles

- 📄 [Guide de contribution – CONTRIBUTING.md](./CONTRIBUTING.md)
- ✅ [Suivi des tâches – TODO.md](./TODO.md)