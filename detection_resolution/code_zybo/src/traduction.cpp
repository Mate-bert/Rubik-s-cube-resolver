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
    // Charger la configuration depuis un fichier YAML
    const auto cfg = loadYamlConfig("data/config/config.yaml");

    // Définir les chemins des fichiers d'entrée et de sortie
    const std::string resolution_path = cfg.at("solver_output");
    const std::string encoded_output_path = cfg.at("solver_encoded_output");

    // Ouvrir le fichier de résolution
    std::ifstream resolution_file(resolution_path);
    if (!resolution_file) {
        std::cerr << "❌ Impossible d'ouvrir le fichier de résolution : " << resolution_path << std::endl;
        return;
    }

    // Lire la résolution
    std::string resolution;
    std::getline(resolution_file, resolution);
    resolution_file.close();

    // Table de correspondance entre les mouvements et leurs codes
    const std::map<std::string, std::string> move_codes = {
        {"U", "1"}, {"U'", "2"}, {"U2", "3"},
        {"R", "4"}, {"R'", "5"}, {"R2", "6"},
        {"F", "7"}, {"F'", "8"}, {"F2", "9"},
        {"D", "A"}, {"D'", "B"}, {"D2", "C"},
        {"L", "D"}, {"L'", "E"}, {"L2", "F"},
        {"B", "G"}, {"B'", "H"}, {"B2", "I"}
    };

    // Encoder la résolution
    std::stringstream ss(resolution);
    std::string move;
    std::string encoded_resolution;

    while (ss >> move) {
        auto it = move_codes.find(move);
        if (it != move_codes.end()) {
            encoded_resolution += it->second;
        } else {
            std::cerr << "❌ Mouvement non reconnu : " << move << std::endl;
            return;
        }
    }

    // Sauvegarder la résolution encodée
    std::ofstream encoded_file(encoded_output_path);
    if (!encoded_file) {
        std::cerr << "❌ Impossible de créer le fichier encodé : " << encoded_output_path << std::endl;
        return;
    }

    encoded_file << encoded_resolution;
    encoded_file.close();

    std::cout << "✅ Résolution encodée sauvegardée dans : " << encoded_output_path << std::endl;
}