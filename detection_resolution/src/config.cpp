#include "config.hpp"
#include <fstream>
#include <sstream>
#include <algorithm>

// Fonction pour charger un fichier de configuration YAML et le convertir en une map clé-valeur
std::map<std::string, std::string> loadYamlConfig(const std::string& filepath) {
    std::ifstream file(filepath); // Ouvre le fichier en mode lecture
    std::map<std::string, std::string> config; // Map pour stocker les paires clé-valeur
    std::string line; // Variable pour stocker chaque ligne lue

    // Parcourt chaque ligne du fichier
    while (std::getline(file, line)) {
        // Ignore les lignes vides ou les commentaires (commençant par '#')
        if (line.empty() || line.front() == '#') continue;

        // Trouve la position du séparateur ':' dans la ligne
        auto pos = line.find(':');
        if (pos == std::string::npos) continue; // Ignore les lignes qui ne contiennent pas de ':'

        // Récupère la clé (partie avant le ':') et la valeur (partie après le ':')
        std::string key = line.substr(0, pos); // Sous-chaîne avant le séparateur
        std::string value = line.substr(pos + 1); // Sous-chaîne après le séparateur

        // Supprime les espaces inutiles autour de la clé
        key.erase(remove_if(key.begin(), key.end(), isspace), key.end());

        // Supprime les espaces et les guillemets autour de la valeur
        value.erase(0, value.find_first_not_of(" \"")); // Supprime les espaces/guillemets au début
        value.erase(value.find_last_not_of(" \"") + 1); // Supprime les espaces/guillemets à la fin

        // Ajoute la paire clé-valeur à la map
        config[key] = value;
    }

    return config; // Retourne la map contenant les paires clé-valeur extraites
}