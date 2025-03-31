#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
std::string getColorName(char face) {
    switch (face) {
        case 'U': return "yellow";
        case 'F': return "red";
        case 'R': return "green";
        case 'L': return "blue";
        case 'B': return "orange";
        case 'D': return "white";
        default: return "";
    }
}

int main() {
    std::ifstream infile("data/output/kociemba.txt");
    std::string line;
    std::map<char, int> counter;
    std::vector<std::string> question_positions;

    while (std::getline(infile, line)) {
        // Nettoyage de la ligne
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        std::string prefix = line.substr(0, 1);
        std::string stickers = line.substr(2);

        for (size_t i = 0; i < stickers.size(); ++i) {
            char c = stickers[i];
            if (c == '?') {
                question_positions.push_back(prefix + "[" + std::to_string(i + 1) + "]");
            } else {
                counter[c]++;
            }
        }
    }

    std::cout << "🧩 Répartition des stickers :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        std::cout << "  " << face << " : " << counter[face] << std::endl;
    }

    std::cout << "\n✅ Vérification :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        int count = counter[face];
        if (count == 9)
            std::cout << "  ✅ " << face << " OK (9)" << std::endl;
        else
            std::cout << "  ❌ " << face << " a " << count << " stickers" << std::endl;
    }

    std::cout << "\n❓ Positions des '?':" << std::endl;
    for (const auto& pos : question_positions) {
        std::cout << "  " << pos << std::endl;
    }

    // Lecture du fichier de référence
    std::ifstream ref_file("data/groundtruth/kociemba_verif.txt");
    std::vector<std::string> reference_lines;
    std::map<char, int> ref_counter;

    int line_num = 0;
    infile.clear();
    infile.seekg(0); // retour au début du fichier principal

    while (std::getline(ref_file, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);
        reference_lines.push_back(line);

        std::string ref_stickers = line.substr(2);
        for (char c : ref_stickers) {
            ref_counter[c]++;
        }
    }

    std::cout << "\n📊 Vérification du fichier de référence :" << std::endl;
    for (char face : {'U', 'R', 'F', 'D', 'L', 'B'}) {
        int count = ref_counter[face];
        if (count == 9)
            std::cout << "  ✅ " << face << " OK (9)" << std::endl;
        else
            std::cout << "  ❌ " << face << " a " << count << " stickers" << std::endl;
    }

    std::cout << "\n📏 Comparaison avec la référence :" << std::endl;

    // Réinitialisation
    line_num = 0;
    while (std::getline(infile, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        std::string prefix = line.substr(0, 1);
        std::string stickers = line.substr(2);
        std::string ref_stickers = reference_lines[line_num].substr(2);

        for (size_t i = 0; i < stickers.size(); ++i) {
            char actual = stickers[i];
            char expected = ref_stickers[i];
            if (actual != expected) {
                std::cout << "  ❌ " << prefix << "[" << (i+1) << "] = '" << actual << "' (" << getColorName(actual) << ") attendu : '" << expected << "' (" << getColorName(expected) << ")" << std::endl;
            }
        }
        line_num++;
    }
    
    // Calcul du score de similarité
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

    double percent = (double)correct_count / total_positions * 100.0;
    std::cout << "  ✅ Nombre de positions correctes : " << correct_count << " / " << total_positions << std::endl;
    std::cout << "  📊 Pourcentage de réussite      : " << percent << " %" << std::endl;

    return 0;

}