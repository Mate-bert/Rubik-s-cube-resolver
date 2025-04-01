#include "config.hpp"
#include <fstream>
#include <sstream>
#include <algorithm>

// Fonction pour charger un fichier de configuration YAML et le convertir en map clé-valeur
std::map<std::string, std::string> loadYamlConfig(const std::string& filepath) {
    std::ifstream file(filepath); // Ouvre le fichier en lecture
    std::map<std::string, std::string> config; // Map pour stocker les paires clé-valeur
    std::string line;

    // Parcourt chaque ligne du fichier
    while (std::getline(file, line)) {
        // Ignore les lignes vides ou les commentaires (commençant par '#')
        if (line.empty() || line.front() == '#') continue;

        // Trouve la position du séparateur ':'
        auto pos = line.find(':');
        if (pos == std::string::npos) continue; // Ignore les lignes sans séparateur

        // Récupère la clé (avant le ':') et la valeur (après le ':')
        std::string key = line.substr(0, pos);
        std::string value = line.substr(pos + 1);

        // Supprime les espaces inutiles autour de la clé
        key.erase(remove_if(key.begin(), key.end(), isspace), key.end());

        // Supprime les espaces et guillemets autour de la valeur
        value.erase(0, value.find_first_not_of(" \""));
        value.erase(value.find_last_not_of(" \"") + 1);

        // Ajoute la paire clé-valeur à la map
        config[key] = value;
    }

    return config; // Retourne la map contenant la configuration
}