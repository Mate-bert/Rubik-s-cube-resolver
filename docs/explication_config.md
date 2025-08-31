
# Explication du module `config`

Ce module propose une fonction légère pour **charger un fichier YAML** simple (clé-valeur) et le convertir en `std::map<std::string, std::string>`. Il est utile pour centraliser les paramètres de configuration dans les projets C++.

---

## 🔧 Fonctionnement général

1. **Chargement du fichier**
   - La fonction `loadYamlConfig(filepath)` ouvre le fichier texte spécifié.

2. **Lecture ligne par ligne**
   - Les lignes vides et les commentaires (`#`) sont ignorés.
   - Chaque ligne contenant un `:` est considérée comme une paire `clé: valeur`.

3. **Nettoyage**
   - La clé est nettoyée de tous les espaces.
   - La valeur est nettoyée des espaces et guillemets au début et à la fin.

4. **Stockage**
   - Les paires extraites sont stockées dans un `std::map<std::string, std::string>`.

---

## 🧱 Fonction principale

- `std::map<std::string, std::string> loadYamlConfig(const std::string& filepath)`

---

## 📁 Arborescence attendue

```
Rubik-s-cube-resolver/
├── include/
│   └── config.hpp               # Déclaration de la fonction
├── src/
│   └── config.cpp               # Implémentation de la fonction
├── obj/
│   └── config.o                 # Fichier objet compilé
├── data/
│   └── config/
│       └── config.yaml          # Fichier YAML de configuration
```

---

## ✅ Résultat attendu

- En entrée : un fichier texte de type YAML simple.
- En sortie : une `std::map` contenant les clés et valeurs extraites.

---

## Exemple de fichier `config.yaml`

```yaml
input_path: "data/raw"
output_path: "data/output"
model_path: "data/models/yolo/best.onnx"
```

## Exemple d’utilisation

```cpp
auto config = loadYamlConfig("data/config/config.yaml");
std::string input = config["input_path"];
std::string model = config["model_path"];
```
