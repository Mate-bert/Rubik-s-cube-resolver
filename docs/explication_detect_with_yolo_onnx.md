# Explication du script `detect_with_yolo_onnx.py`

Ce script permet de détecter automatiquement les stickers visibles d’un Rubik's Cube sur deux images (`3face_1.jpg` et `3face_2.jpg`) à l'aide d’un modèle YOLOv8 exporté en `.onnx`, puis d’enregistrer les coordonnées des stickers des 6 faces visibles dans un fichier texte.

---

## 🔧 Fonctionnement général

1. **Chargement du modèle ONNX et des classes**
   - `load_classes()` lit les noms de classes depuis le fichier YAML.
   - `cv2.dnn.readNetFromONNX()` charge le modèle pour l'inférence avec OpenCV.

2. **Prétraitement**
   - `preprocess()` lit et redimensionne l’image en 640x640, puis la transforme en `blob`.

3. **Post-traitement**
   - `postprocess()` applique la sigmoid (déjà incluse), filtre les boxes via `conf_thresh`, et applique la suppression de doublons via NMS.

4. **Détection et positionnement des points**
   - `draw_cube_faces_custom()` détecte les positions relatives par rapport au centre :
     - `haut`, `haut-gauche`, `bas-droite`, etc.
     - Si un point est manquant, il est extrapolé géométriquement.
   - Le centre est toujours identifié à partir de la classe `centre`.

5. **Annotation**
   - `draw_detections()` et `draw_cube_faces_custom()` dessinent les rectangles, les cercles et les noms de position dans l’image.
   - L’image annotée est sauvegardée dans un fichier nommé `3face_X_predicted.jpg`.

6. **Export des coordonnées**
   - `enregistrer_faces_coords()` écrit dans `data/config/faces_coords.txt` les coordonnées des 4 points nécessaires à chaque face (si tous sont disponibles).
   - Les coordonnées sont exportées pour :
     - 3 faces de `3face_1.jpg`
     - 3 faces de `3face_2.jpg`
   - Format :
     ```
     3face_1.jpg, face_rectified_1.jpg: x1 y1, x2 y2, x3 y3, x4 y4
     ```

7. **Pipeline multi-image**
   - La fonction `main()` traite automatiquement les deux images.
   - Le fichier `.txt` est vidé au démarrage pour garantir un contenu propre à chaque exécution.

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── data/
│   └── config/
│       └── faces_coords.txt
│       └── config.yaml
├── data/raw/
│   ├── 3face_1.jpg
│   ├── 3face_2.jpg
├── data/models/yolo/
│   └── best.onnx
├── src/
│   └── detect_with_yolo_onnx.py
```

---

## ✅ Résultat attendu

Un fichier `faces_coords.txt` de 6 lignes précises représentant les 6 faces du cube visible sur deux images.