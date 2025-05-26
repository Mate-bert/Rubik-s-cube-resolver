
# Explication du module `traduction`

Ce module permet de **convertir une séquence de mouvements de résolution d’un Rubik’s Cube** (par exemple `"U R U'"`) en une séquence **binaire encodée**, stockée ligne par ligne dans un fichier texte. Chaque mouvement est représenté par un **code binaire sur 4 bits**.

---

## 🔧 Fonctionnement général

1. **Chargement de la configuration**
   - Utilise `loadYamlConfig()` pour obtenir :
     - `solver_output` : chemin vers le fichier texte contenant la solution (mouvements).
     - `solver_encoded_output` : fichier de sortie contenant les mouvements encodés.

2. **Table d'encodage des mouvements**
   - Chaque mouvement est encodé en 4 bits :
     ```
     U  = 1001   U' = 0001
     F  = 1010   F' = 0010
     R  = 1011   R' = 0011
     L  = 1100   L' = 0100
     B  = 1101   B' = 0101
     D  = 1110   D' = 0110
     ```

3. **Parcours du fichier**
   - Ignore les caractères spéciaux (`.`, `()`)
   - Un mouvement comme `"U2"` est encodé **deux fois**.
   - Chaque encodage est écrit sur une ligne.

4. **Ajout du marqueur de fin**
   - La séquence `"LAST"` est ajoutée à la fin du fichier, caractère par caractère en **8 bits ASCII**.

---

## 🧱 Fonction principale

- `void encodeResolution()`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── traduction.hpp               # Déclaration
├── src/
│   └── traduction.cpp               # Implémentation
├── data/
│   └── output/
│       ├── resolution.txt           # Fichier de mouvements (ex: "U R U'")
│       └── output_encoded.txt       # Fichier de sortie encodée
```

---

## ✅ Résultat attendu

- Fichier contenant une ligne binaire par mouvement.
- Exemple :
  ```
  1001
  1011
  0001
  ...
  01001100  // Correspond à 'L' d’un "LAST"
  ```

---

## Exemple d’utilisation

```cpp
encodeResolution(); // Encode et écrit les mouvements dans le fichier binaire
```
