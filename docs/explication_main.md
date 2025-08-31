
# Explication du fichier `main.cpp`

Ce fichier constitue le **point d’entrée principal** du programme de résolution automatique d’un Rubik’s Cube. Il orchestre toutes les étapes : redressement, découpage, détection des couleurs, vérification, résolution et encodage.

---

## 🧠 Pipeline complet

1. **Chargement de la configuration YAML**
   - Fichier `data/config/config.yaml`

2. **Étape 1 : Redressement des faces**
   - `rectifierFacesAutomatically()` transforme les faces obliques en carrés alignés.

3. **Étape 2 : Découpage en stickers**
   - `splitAllFacesIntoStickers()` extrait 9 images par face.

4. **Étape 3 : Détection des couleurs**
   - `ColorDetector::getDominantColor()` est utilisé pour détecter la couleur de chaque sticker.
   - Les centres sont fixés manuellement (`up` = jaune, `front` = rouge, etc.).

5. **Génération du fichier Kociemba**
   - Génère un fichier `kociemba.txt` qui contient les 6 lignes de couleurs (ordonnées pour le solveur).

6. **Vérification de la structure**
   - `checkAndFixKociembaStructure()` vérifie la validité logique et structurelle des facelets.

7. **Étape 4 : Résolution**
   - `solveWithKociembaFile()` appelle le solveur de Kociemba.
   - Résultat écrit dans `resolution.txt`.

8. **Étape 5 : Encodage**
   - `encodeResolution()` convertit chaque mouvement en une séquence binaire.
   - Résultat écrit dans `output_encoded.txt`.

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   ├── *.hpp                      # Modules utilisés
├── src/
│   ├── main.cpp                  # Fichier principal
├── data/
│   ├── raw/
│   ├── output/
│   │   ├── face_decouper/
│   │   ├── stickers/
│   │   ├── kociemba.txt
│   │   ├── kociemba_test.txt
│   │   ├── resolution.txt
│   │   └── output_encoded.txt
│   └── config/
│       └── config.yaml
```

---

## ✅ Résultat attendu

- Pipeline complet exécuté sans erreur.
- Génère tous les fichiers nécessaires à la résolution.

---

## Exemple de lancement

```bash
./bin/main.exe
```

> Sous Windows, `SetConsoleOutputCP(CP_UTF8);` est utilisé pour gérer l'affichage des caractères UTF-8.
