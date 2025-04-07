#pragma once
#include <string>
#include <map>

/**
 * @brief Charge une configuration YAML à partir d'un fichier.
 * 
 * Cette fonction lit un fichier YAML spécifié par le chemin donné
 * et retourne une map contenant les paires clé-valeur extraites du fichier.
 * 
 * @param filepath Le chemin vers le fichier YAML à charger.
 * @return std::map<std::string, std::string> Une map contenant les paires clé-valeur
 *         extraites du fichier YAML. Si le fichier est introuvable ou invalide,
 *         un comportement spécifique (par exemple, une exception ou une map vide)
 *         peut être attendu.
 */
std::map<std::string, std::string> loadYamlConfig(const std::string& filepath);