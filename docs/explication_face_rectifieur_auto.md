
# Explication du module `face_rectifieur_auto`

Ce module permet de **rectifier automatiquement les faces du Rubik’s Cube** à partir de coordonnées détectées dans une image. Il s'appuie sur OpenCV pour appliquer une transformation de perspective (homographie) afin de générer une image carrée bien alignée de la face.

---

## 🔧 Fonctionnement général

1. **Chargement de la configuration**
   - Utilise `loadYamlConfig("data/config/config.yaml")` pour extraire :
     - `raw_dir` : dossier contenant les images sources.
     - `rectified_dir` : dossier de sortie des images rectifiées.
     - `coords_file` : fichier texte contenant les coordonnées.
     - `image_size` : taille (pixels) de la face rectifiée.

2. **Chargement des coordonnées**
   - La fonction `loadCoords()` lit un fichier `faces_coords.txt` avec le format :
     ```
     image_input.jpg, face_output.jpg: x1 y1, x2 y2, x3 y3, x4 y4
     ```
   - Chaque ligne est convertie en une structure `FaceCoords`.

3. **Rectification**
   - Pour chaque image source :
     - Lit l’image.
     - Applique une **transformation de perspective** (`getPerspectiveTransform`).
     - Sauvegarde l’image rectifiée dans le dossier spécifié.

---

## 🧱 Fonctions principales

- `std::vector<FaceCoords> loadCoords(const std::string&)`
- `void rectifierFacesAutomatically()`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── face_rectifieur_auto.hpp    # Déclaration
├── src/
│   └── face_rectifieur_auto.cpp    # Implémentation
├── data/
│   ├── raw/                        # Contient les images d’origine
│   │   └── 3face_1.jpg, ...
│   ├── output/
│   │   └── face_decouper/
│   │       └── face_rectified_1.jpg, ...
│   └── config/
│       └── config.yaml
│       └── faces_coords.txt
```

---

## ✅ Résultat attendu

- Pour chaque ligne du fichier `faces_coords.txt`, une image rectifiée est générée et sauvegardée.
- Les images finales sont alignées (rectangles transformés en carrés).

---

## Exemple d’utilisation

```cpp
rectifierFacesAutomatically(); // Lance le traitement complet
```
