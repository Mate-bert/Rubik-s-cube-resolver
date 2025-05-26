
# Explication du module `split_stickers`

Ce module permet de **découper automatiquement les faces rectifiées du Rubik’s Cube** en **stickers individuels** (9 par face). Chaque sticker est ensuite enregistré comme une image séparée.

---

## 🔧 Fonctionnement général

1. **Chargement de la configuration**
   - Utilise `loadYamlConfig()` pour récupérer :
     - `rectified_dir` : dossier contenant les images des faces du cube.
     - `stickers_dir` : dossier cible où les stickers seront enregistrés.

2. **Association face → nom**
   - Une map associe chaque fichier d’image à un nom de face logique (`up`, `front`, etc.).

3. **Traitement des images**
   - Chaque image est divisée en une grille **3x3**.
   - Chaque cellule correspond à un **sticker**.

4. **Enregistrement**
   - Chaque sticker est sauvegardé au format `.jpg` sous un nom de type : `face_position.jpg`, ex : `front_5.jpg`.

---

## 🧱 Fonction principale

- `void splitAllFacesIntoStickers()`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── split_stickers.hpp             # Déclaration
├── src/
│   └── split_stickers.cpp             # Implémentation
├── data/
│   ├── output/
│   │   └── face_decouper/
│   │       ├── face_rectified_1.jpg   # Faces alignées
│   │       └── ...
│   └── output/
│       └── stickers/
│           ├── up_1.jpg
│           ├── front_5.jpg
│           └── ...
```

---

## ✅ Résultat attendu

- 6 faces x 9 stickers = **54 images** sauvegardées dans le dossier des stickers.

---

## Exemple d’utilisation

```cpp
splitAllFacesIntoStickers(); // Découpe et sauvegarde automatiquement tous les stickers
```
