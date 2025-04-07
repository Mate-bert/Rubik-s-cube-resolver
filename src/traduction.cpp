#include <iostream>
#include <fstream>
#include <string>
#include <unordered_map>
#include <bitset>
#include <sstream>
#include <cstdint>
#include "config.hpp"
#include "traduction.hpp"

void encodeResolution() {
    // Charger la configuration YAML
    auto cfg = loadYamlConfig("data/config/config.yaml");

    // Définir une table de correspondance entre les mouvements et leurs codes binaires
    std::unordered_map<std::string, uint8_t> move_codes = {
        {"U",  0b1001}, {"U'", 0b0001},
        {"F",  0b1010}, {"F'", 0b0010},
        {"R",  0b1011}, {"R'", 0b0011},
        {"L",  0b1100}, {"L'", 0b0100},
        {"B",  0b1101}, {"B'", 0b0101},
        {"D",  0b1110}, {"D'", 0b0110}
    };

    // Récupérer les chemins des fichiers depuis la configuration
    std::string resolution_path = cfg["solver_output"];
    std::string encoded_output_path = cfg["solver_encoded_output"];

    // Ouvrir les fichiers d'entrée (résolution) et de sortie (résolution encodée)
    std::ifstream res_in(resolution_path);
    std::ofstream res_out(encoded_output_path);
    if (!res_in || !res_out) {
        // Afficher une erreur si les fichiers ne peuvent pas être ouverts
        std::cerr << "❌ Impossible d’ouvrir les fichiers d’encodage.\n";
        return;
    }

    // Lire la première ligne du fichier de résolution
    std::string line;
    std::getline(res_in, line);
    std::stringstream ss(line);
    std::string token;

    // Parcourir chaque mouvement dans la ligne
    while (ss >> token) {
        // Ignorer les points et les parenthèses
        if (token == ".") continue;
        if (token.front() == '(' || token.back() == ')') continue;

        // Gérer les mouvements doubles (exemple : "U2")
        if (token.size() == 2 && token[1] == '2') {
            std::string base = token.substr(0,1); // Extraire la base du mouvement (exemple : "U")
            if (move_codes.count(base)) {
                // Écrire deux fois le code binaire correspondant
                res_out << std::bitset<4>(move_codes[base]) << std::endl;
                res_out << std::bitset<4>(move_codes[base]) << std::endl;
            }
        } 
        // Gérer les mouvements simples
        else if (move_codes.count(token)) {
            res_out << std::bitset<4>(move_codes[token]) << std::endl;
        } 
        // Gérer les mouvements non reconnus
        else {
            std::cerr << "❌ Mouvement non reconnu : " << token << std::endl;
        }
    }

    // Ajouter un marqueur "LAST" en ASCII à la fin du fichier encodé
    std::string lastMarker = "LAST";
    for (char c : lastMarker) {
        res_out << std::bitset<8>(static_cast<unsigned char>(c)) << std::endl;
    }

    // Afficher un message de succès
    std::cout << "✅ Résolution encodée dans : " << encoded_output_path << "\n";
}