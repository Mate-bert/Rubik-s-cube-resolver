#include <iostream>
#include <fstream>
#include <map>
#include <vector>
#include <filesystem>
#include <opencv2/opencv.hpp>

#include "face_rectifieur_auto.hpp"
#include "split_stickers.hpp"
#include "ColorDetector.hpp"

int main() {
    std::cout << "🔧 Étape 1 : Redressement des faces...\n";
    rectifierFacesAutomatically();

    std::cout << "✂️ Étape 2 : Découpage des faces en stickers...\n";
    splitAllFacesIntoStickers();

    std::cout << "🎨 Étape 3 : Détection des couleurs dominantes...\n";
    ColorDetector detector;

    std::map<std::string, std::string> center_colors = {
        {"up", "yellow"},
        {"front", "red"},
        {"right", "green"},
        {"left", "blue"},
        {"back", "orange"},
        {"down", "white"}
    };

    std::map<std::string, std::map<int, std::string>> detected_colors;

    for (const auto& entry : std::filesystem::directory_iterator("data/output/stickers")) {
        if (!entry.is_regular_file()) continue;

        std::string filename = entry.path().filename().string();
        cv::Mat sticker = cv::imread(entry.path().string());
        if (sticker.empty()) continue;

        size_t underscore_pos = filename.find('_');
        size_t dot_pos = filename.find('.');
        if (underscore_pos == std::string::npos || dot_pos == std::string::npos) continue;

        std::string face = filename.substr(0, underscore_pos);
        int index = std::stoi(filename.substr(underscore_pos + 1, dot_pos - underscore_pos - 1));

        if (index == 5) {
            detected_colors[face][5] = center_colors[face];
        } else {
            std::string color = detector.getDominantColor(sticker);
            detected_colors[face][index] = color;
        }
    }

    std::map<std::string, char> color_to_letter = {
        {"yellow", 'U'},
        {"red",    'F'},
        {"green",  'R'},
        {"blue",   'L'},
        {"orange", 'B'},
        {"white",  'D'}
    };

    std::vector<std::string> face_order = {"up", "right", "front", "down", "left", "back"};

    std::ofstream out("data/output/kociemba.txt");
    for (size_t i = 0; i < face_order.size(); ++i) {
        const std::string& face = face_order[i];
        std::string face_line(1, toupper(face[0]));
        face_line += ":";
    
        for (int j = 1; j <= 9; ++j) {
            std::string color = detected_colors[face][j];
            char letter = color_to_letter.count(color) ? color_to_letter[color] : '?';
            face_line += letter;
        }
    
        out << "\"" << face_line << "\"";
        if (i < face_order.size() - 1) out << ",";
        out << "\n";
    }
    out.close();

    std::cout << "✅ Chaîne Kociemba générée dans le fichier kociemba.txt\n";
    return 0;
}