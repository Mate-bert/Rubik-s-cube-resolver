
# Explication du module `ColorDetector`

Ce module permet d’identifier la **couleur dominante** d’une image OpenCV, typiquement un sticker de Rubik’s Cube. Il repose sur la transformation en espace HSV et le comptage des pixels correspondants à différentes plages de couleurs.

---

## 🔧 Fonctionnement général

1. **Construction d'un objet `ColorDetector`**
   - Initialise un dictionnaire (`color_ranges`) contenant les plages HSV pour 6 couleurs : rouge, orange, jaune, vert, bleu, blanc.

2. **Détection de couleur dominante**
   - La méthode `getDominantColor()` prend une image en BGR :
     - Elle est redimensionnée à 50x50 pour réduire le coût de traitement.
     - Convertie en HSV pour faciliter la segmentation par couleur.
     - Chaque plage est testée via `cv::inRange()` pour créer un masque.
     - Le nombre de pixels correspondant à chaque couleur est compté.
     - La couleur ayant le plus de pixels est retournée.

---

## 🧱 Fonctions principales

- `ColorDetector::ColorDetector()` : constructeur, initialise les plages HSV.
- `std::string getDominantColor(const cv::Mat&)` : retourne une couleur comme `"red"`, `"green"`, etc.

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── ColorDetector.hpp        # Déclaration de la classe ColorDetector
├── src/
│   └── ColorDetector.cpp        # Implémentation des méthodes
├── obj/
│   └── ColorDetector.o          # Objet compilé
```

---

## ✅ Résultat attendu

- En entrée : une image OpenCV (`cv::Mat`) représentant un sticker.
- En sortie : une `std::string` avec la couleur dominante (`"red"`, `"green"`, etc.).

---

## Exemple d’utilisation

```cpp
ColorDetector cd;
std::string couleur = cd.getDominantColor(image);
std::cout << "Couleur détectée : " << couleur << std::endl;
```
