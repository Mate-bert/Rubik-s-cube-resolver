#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
#include <sstream>
#include <iomanip>

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
    std::ifstream infile("data/kociemba.txt");
    std::ifstream ref_file("data/groundtruth/kociemba_verif.txt");

    std::string line;
    std::map<char, int> counter;
    std::map<char, int> ref_counter;
    std::vector<std::string> question_positions;
    std::vector<std::string> reference_lines;

    while (std::getline(infile, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);
        std::string stickers = line.substr(2);
        for (size_t i = 0; i < stickers.size(); ++i) {
            char c = stickers[i];
            if (c == '?') {
                question_positions.push_back(line.substr(0, 1) + "[" + std::to_string(i + 1) + "]");
            } else {
                counter[c]++;
            }
        }
    }

    infile.clear(); infile.seekg(0);

    while (std::getline(ref_file, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);
        reference_lines.push_back(line);
        std::string ref_stickers = line.substr(2);
        for (char c : ref_stickers) {
            ref_counter[c]++;
        }
    }

    std::ofstream json_out("data/output/analyse/erreurs.json");
    json_out << "[\n";

    infile.clear();
    infile.seekg(0);
    int line_num = 0;
    bool first = true;

    while (std::getline(infile, line)) {
        if (line.back() == ',') line.pop_back();
        if (line.front() == '"') line = line.substr(1, line.size() - 2);

        std::string face = line.substr(0, 1);
        std::string stickers = line.substr(2);
        std::string ref_stickers = reference_lines[line_num].substr(2);

        for (size_t i = 0; i < stickers.size(); ++i) {
            char actual = stickers[i];
            char expected = ref_stickers[i];
            if (actual != expected) {
                if (!first) json_out << ",\n";
                json_out << "  {\n"
                         << "    \"face\": \"" << face << "\",\n"
                         << "    \"position\": " << (i + 1) << ",\n"
                         << "    \"actual\": \"" << actual << "\",\n"
                         << "    \"expected\": \"" << expected << "\",\n"
                         << "    \"actual_color\": \"" << getColorName(actual) << "\",\n"
                         << "    \"expected_color\": \"" << getColorName(expected) << "\"\n"
                         << "  }";
                first = false;
            }
        }
        line_num++;
    }

    json_out << "\n]\n";
    json_out.close();
    std::cout << "\n💾 Fichier JSON d'erreurs généré : data/output/analyse/erreurs.json\n";

    return 0;
}