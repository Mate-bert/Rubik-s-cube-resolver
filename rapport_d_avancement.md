
# Rapport d'avancement - Projet Rubik's Cube Resolver

## Date : 28 mars 2025

---

## Objectif du jour

Mettre en place un pipeline semi-automatisé pour extraire les faces d'un Rubik's Cube à partir de photos prises avec une seule caméra, dans le but de détecter automatiquement les couleurs de chaque case.

---

## Réalisations

### 1. **Préparation des images**
- Chargement d'une image haute résolution contenant 3 faces visibles (ex: `3face_1.jpg`)
- Redimensionnement automatique à une hauteur fixe (~800px) pour traitement plus fluide

### 2. **Outil de sélection interactive de face**
- Création d'un programme permettant de **cliquer 4 coins** d'une face
- Application d'une **homographie** pour redresser la face
- Sauvegarde automatique dans `face_rectified_X.jpg`
- Enregistrement des 4 points dans un fichier `faces_coords.txt` au format :

```
3face_1.jpg, face_rectified_1.jpg: x1 y1, x2 y2, x3 y3, x4 y4
```

### 3. **Automatisation de la génération des faces**
- Lecture automatique du fichier `faces_coords.txt`
- Chargement et redimensionnement de l'image source (3face_1.jpg ou 3face_2.jpg)
- Application des transformations pour régénérer les `face_rectified_X.jpg`
- Mise en place d'une cache pour ne pas recharger la même image plusieurs fois

---

## Problèmes rencontrés

- ❌ Erreur de chargement d'image (images non trouvées) : dues à un mauvais répertoire courant lors de l'exécution
    - **Solution :** modification du chemin avec `bin/` préfixé dans le code

- ❌ Format initial du fichier `faces_coords.txt` incompatible avec le parser
    - **Solution :** ajout du nom de l'image source en tête de chaque ligne

- ❌ Problème de détection de plusieurs visages sur une image redressée
    - **Remarque :** une image contient 3 faces visibles, mais l'objectif est d'extraire une face à la fois via homographie

---

## Avancement

- ✅ Système d'extraction de faces via clics manuels fonctionnel
- ✅ Enregistrement des coordonnées pour automatisation future
- ✅ Automatisation des redressements de faces depuis les coordonnées validée

---

## Prochaines étapes

1. 🔄 Automatiser la **découpe en 9 stickers** des `face_rectified_X.jpg`
2. 🌟 Détection de la **couleur dominante** dans chaque case
3. 🤖 Génération de la chaîne à passer à l'algorithme de résolution (Kociemba)
4. 🤝 Intégration à l'enchaînement automatique avec les 6 moteurs

---

## Remarques personnelles

- Fixer la caméra + position du cube est la clé pour réutiliser les coordonnées sans re-clics
- Une fois les `face_rectified_X` générées, tout peut s'automatiser facilement

---

📅 Fin de journée productive, prêt à reprendre demain pour la détection couleur !
