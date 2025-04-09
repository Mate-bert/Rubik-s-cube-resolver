#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
#include <sstream>
#include <iomanip>
#include "config.hpp"

// Fonction pour obtenir le nom de la couleur correspondant à une face donnée
std::string getColorName(char face) {
    switch (face) {
        case 'U': return "yellow"; // Haut (Up)
        case 'F': return "red";    // Avant (Front)
        case 'R': return "green";  // Droite (Right)
        case 'L': return "blue";   // Gauche (Left)
        case 'B': return "orange"; // Arrière (Back)
        case 'D': return "white";  // Bas (Down)
        default: return "";        // Cas par défaut
    }
}

int main() {
    // Chargement de la configuration YAML
    auto cfg = loadYamlConfig("data/config/config.yaml");

    // Ouverture des fichiers d'entrée
    std::ifstream infile(cfg["kociemba_txt"]); // Fichier contenant les données à analyser
    std::ifstream ref_file(cfg["kociemba_ref"]); // Fichier de référence

    // Déclaration des variables
    std::string line;
    std::map<char, int> counter; // Compteur des occurrences des stickers dans le fichier d'entrée
    std::map<char, int> ref_counter; // Compteur des occurrences des stickers dans le fichier de référence
    std::vector<std::string> question_positions; // Positions des stickers inconnus ('?')
    std::vector<std::string> reference_lines; // Contenu des lignes du fichier de référence

    // Lecture et analyse du fichier d'entrée
    while (std::getline(infile, line)) {
        // Nettoyage de la ligne (suppression des guillemets et des virgules)
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        // Extraction des stickers
        std::string stickers = line.substr(2);
        for (size_t i = 0; i < stickers.size(); ++i) {
            char c = stickers[i];
            if (c == '?') {
                // Enregistrement des positions des stickers inconnus
                question_positions.push_back(line.substr(0, 1) + "[" + std::to_string(i + 1) + "]");
            } else {
                // Comptage des stickers
                counter[c]++;
            }
        }
    }

    // Réinitialisation du fichier d'entrée pour une nouvelle lecture
    infile.clear(); 
    infile.seekg(0);

    // Lecture et analyse du fichier de référence
    while (std::getline(ref_file, line)) {
        // Nettoyage de la ligne (suppression des guillemets et des virgules)
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        // Stockage des lignes de référence
        reference_lines.push_back(line);

        // Extraction et comptage des stickers
        std::string ref_stickers = line.substr(2);
        for (char c : ref_stickers) {
            ref_counter[c]++;
        }
    }

    // Ouverture du fichier de sortie JSON
    std::ofstream json_out(cfg["error_json"]);
    json_out << "[\n";

    // Réinitialisation du fichier d'entrée pour une nouvelle lecture
    infile.clear();
    infile.seekg(0);

    int line_num = 0; // Numéro de ligne
    bool first = true; // Indicateur pour gérer la virgule entre les objets JSON

    // Comparaison des fichiers d'entrée et de référence
    while (std::getline(infile, line)) {
        // Nettoyage de la ligne (suppression des guillemets et des virgules)
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        // Extraction des informations de la ligne
        std::string face = line.substr(0, 1); // Face actuelle
        std::string stickers = line.substr(2); // Stickers actuels
        std::string ref_stickers = reference_lines[line_num].substr(2); // Stickers de référence

        // Comparaison des stickers
        for (size_t i = 0; i < stickers.size(); ++i) {
            char actual = stickers[i]; // Sticker actuel
            char expected = ref_stickers[i]; // Sticker attendu
            if (actual != expected) {
                // Si une différence est trouvée, ajout d'une entrée dans le fichier JSON
                if (!first) json_out << ",\n";
                json_out << "  {\n"
                         << "    \"face\": \"" << face << "\",\n"
                         << "    \"position\": " << (i + 1) << ",\n"
                         << "    \"actual\": \"" << actual << "\",\n"
                         << "    \"expected\": \"" << expected << "\",\n"
                         << "    \"actual_color\": \"" << getColorName(actual) << "\",\n"
                         << "    \"expected_color\": \"" << getColorName(expected) << "\"\n"
                         << "  }";
                first = false; // Mise à jour de l'indicateur
            }
        }
        line_num++; // Passage à la ligne suivante
    }

    // Fermeture du tableau JSON
    json_out << "\n]\n";
    json_out.close();

    // Message de confirmation
    std::cout << "\n💾 Fichier JSON d'erreurs généré : cfg[error_json]\n";

    return 0;
}