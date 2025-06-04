#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
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
        default: return "";
    }
}

int main() {
    // Chargement de la configuration YAML
    auto cfg = loadYamlConfig("data/config/config.yaml");

    // Ouverture du fichier contenant les données Kociemba
    std::ifstream infile(cfg["kociemba_txt"]);
    std::string line;
    std::map<char, int> counter; // Compteur pour chaque face
    std::vector<std::string> question_positions; // Positions des stickers inconnus ('?')

    // Lecture ligne par ligne du fichier
    while (std::getline(infile, line)) {
        // Nettoyage de la ligne
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        // Extraction du préfixe et des stickers
        std::string prefix = line.substr(0, 1);
        std::string stickers = line.substr(2);

        // Parcours des stickers pour compter les occurrences et identifier les '?'
        for (size_t i = 0; i < stickers.size(); ++i) {
            char c = stickers[i];
            if (c == '?') {
                question_positions.push_back(prefix + "[" + std::to_string(i + 1) + "]");
            } else {
                counter[c]++;
            }
        }
    }

    // Affichage de la répartition des stickers
    std::cout << "🧩 Répartition des stickers :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        std::cout << "  " << face << " : " << counter[face] << std::endl;
    }

    // Vérification que chaque face a exactement 9 stickers
    std::cout << "\n✅ Vérification :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        int count = counter[face];
        if (count == 9)
            std::cout << "  ✅ " << face << " OK (9)" << std::endl;
        else
            std::cout << "  ❌ " << face << " a " << count << " stickers" << std::endl;
    }

    // Affichage des positions des stickers inconnus ('?')
    std::cout << "\n❓ Positions des '?':" << std::endl;
    for (const auto& pos : question_positions) {
        std::cout << "  " << pos << std::endl;
    }

    // Lecture du fichier de référence
    std::ifstream ref_file(cfg["kociemba_ref"]);
    std::vector<std::string> reference_lines; // Contenu du fichier de référence
    std::map<char, int> ref_counter; // Compteur pour les stickers dans le fichier de référence

    int line_num = 0;
    infile.clear();
    infile.seekg(0); // Retour au début du fichier principal

    // Lecture ligne par ligne du fichier de référence
    while (std::getline(ref_file, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);
        reference_lines.push_back(line);

        // Comptage des stickers dans le fichier de référence
        std::string ref_stickers = line.substr(2);
        for (char c : ref_stickers) {
            ref_counter[c]++;
        }
    }

    // Vérification des stickers dans le fichier de référence
    std::cout << "\n📊 Vérification du fichier de référence :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        int count = ref_counter[face];
        if (count == 9)
            std::cout << "  ✅ " << face << " OK (9)" << std::endl;
        else
            std::cout << "  ❌ " << face << " a " << count << " stickers" << std::endl;
    }

    // Comparaison entre le fichier principal et le fichier de référence
    std::cout << "\n📏 Comparaison avec la référence :" << std::endl;

    line_num = 0;
    while (std::getline(infile, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        std::string prefix = line.substr(0, 1);
        std::string stickers = line.substr(2);
        std::string ref_stickers = reference_lines[line_num].substr(2);

        // Comparaison des stickers ligne par ligne
        for (size_t i = 0; i < stickers.size(); ++i) {
            char actual = stickers[i];
            char expected = ref_stickers[i];
            if (actual != expected) {
                std::cout << "  ❌ " << prefix << "[" << (i+1) << "] = '" << actual << "' (" << getColorName(actual) << ") attendu : '" << expected << "' (" << getColorName(expected) << ")" << std::endl;
            }
        }
        line_num++;
    }
    
    // Calcul du score de similarité entre les deux fichiers
    int correct_count = 0;
    int total_positions = 0;

    infile.clear();
    infile.seekg(0);
    line_num = 0;

    std::cout << "\n📈 Statistiques globales :" << std::endl;

    while (std::getline(infile, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        std::string stickers = line.substr(2);
        std::string ref_stickers = reference_lines[line_num].substr(2);

        // Comptage des positions correctes
        for (size_t i = 0; i < stickers.size(); ++i) {
            char actual = stickers[i];
            char expected = ref_stickers[i];
            total_positions++;
            if (actual == expected) {
                correct_count++;
            }
        }
        line_num++;
    }

    // Calcul et affichage du pourcentage de réussite
    double percent = (double)correct_count / total_positions * 100.0;
    std::cout << "  ✅ Nombre de positions correctes : " << correct_count << " / " << total_positions << std::endl;
    std::cout << "  📊 Pourcentage de réussite      : " << percent << " %" << std::endl;

    return 0;
}