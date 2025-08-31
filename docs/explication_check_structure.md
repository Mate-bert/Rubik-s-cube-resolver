
# Explication du module `check_structure`

Ce module permet de **valider la structure d’un Rubik’s Cube** à partir d’un tableau de 54 stickers représentant les couleurs des faces. Il détecte les incohérences structurelles : couleurs incorrectement réparties, coins ou arêtes impossibles, ou encore une parité invalide rendant le cube non résoluble.

---

## 🔧 Fonctionnement général

1. **Chargement des données**
   - Le tableau `std::array<Color, 54>` est passé à la fonction principale `check_stickers`.

2. **Vérification des couleurs**
   - Le code compte le nombre de stickers de chaque couleur.
   - Un cube valide contient exactement **9 stickers** de chaque couleur.

3. **Extraction des coins et arêtes**
   - Les indices du tableau de stickers sont utilisés pour identifier les **8 coins** et **12 arêtes**.
   - Chaque coin ou arête est transformé en une représentation triée (canonique).

4. **Comptage des pièces**
   - Un `std::map` est utilisé pour compter chaque coin et chaque arête.
   - Les erreurs suivantes sont détectées :
     - Coin/arête manquant ou en double
     - Mauvaise répartition des couleurs
     - Parité invalide (perm impossible)

5. **Retour de l'erreur**
   - La fonction retourne une `std::string` vide si tout est correct.
   - Sinon, un message d'erreur précisant le type d'erreur détecté.

---

## 🧱 Fonctions principales

- `check_stickers(const std::array<Color, 54>& stickers)`
- `get_canonical_corner(Color a, Color b, Color c)`
- `get_canonical_edge(Color a, Color b)`
- `to_str(const std::array<Color, 3>&)`
- `to_str(const std::array<Color, 2>&)`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── check_structure.hpp        # Déclaration de la fonction check_stickers
├── src/
│   └── check_structure.cpp        # Implémentation de la fonction
├── obj/
│   └── check_structure.o          # Objet compilé
```

---

## ✅ Résultat attendu

- En entrée : un tableau `std::array<Color, 54>` représentant les stickers.
- En sortie : une `std::string` vide si la structure est correcte, sinon un message expliquant l’erreur.

---

## Exemple minimal

```cpp
std::array<Color, 54> stickers = {/* ... */};
std::string err = check_stickers(stickers);
if (!err.empty()) {
    std::cerr << "Erreur : " << err << std::endl;
}
```
