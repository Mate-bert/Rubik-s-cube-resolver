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
    auto cfg = loadYamlConfig("data/config/config.yaml");

    std::unordered_map<std::string, uint8_t> move_codes = {
        {"U",  0b1001}, {"U'", 0b0001},
        {"F",  0b1010}, {"F'", 0b0010},
        {"R",  0b1011}, {"R'", 0b0011},
        {"L",  0b1100}, {"L'", 0b0100},
        {"B",  0b1101}, {"B'", 0b0101},
        {"D",  0b1110}, {"D'", 0b0110}
    };

    std::string resolution_path = cfg["solver_output"];
    std::string encoded_output_path = cfg["solver_encoded_output"];

    std::ifstream res_in(resolution_path);
    std::ofstream res_out(encoded_output_path);
    if (!res_in || !res_out) {
        std::cerr << "❌ Impossible d’ouvrir les fichiers d’encodage.\n";
        return;
    }

    std::string line;
    std::getline(res_in, line);
    std::stringstream ss(line);
    std::string token;
    while (ss >> token) {
        if (token == ".") continue;
        if (token.front() == '(' || token.back() == ')') continue;

        if (token.size() == 2 && token[1] == '2') {
            std::string base = token.substr(0,1);
            if (move_codes.count(base)) {
                res_out << std::bitset<4>(move_codes[base]) << std::endl;
                res_out << std::bitset<4>(move_codes[base]) << std::endl;
            }
        } else if (move_codes.count(token)) {
            res_out << std::bitset<4>(move_codes[token]) << std::endl;
        } else {
            std::cerr << "❌ Mouvement non reconnu : " << token << std::endl;
        }
    }

    // 🔚 Ajout de "LAST" en ASCII
    std::string lastMarker = "LAST";
    for (char c : lastMarker) {
        res_out << std::bitset<8>(static_cast<unsigned char>(c)) << std::endl;
    }

    std::cout << "✅ Résolution encodée dans : " << encoded_output_path << "\n";
}