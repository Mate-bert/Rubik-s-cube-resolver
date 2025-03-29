#include <opencv2/opencv.hpp>
#include <iostream>
#include <filesystem>
#include <map>
#include <string>
#include <vector>

namespace fs = std::filesystem;

// Plages HSV personnalisées pour chaque couleur
const std::map<std::string, std::pair<cv::Scalar, cv::Scalar>> color_ranges = {
    {"red",    {cv::Scalar(0, 100, 100),   cv::Scalar(10, 255, 255)}},    // Rouge vif
    {"orange", {cv::Scalar(11, 100, 100),  cv::Scalar(22, 255, 255)}},
    {"yellow", {cv::Scalar(23, 100, 100),  cv::Scalar(34, 255, 255)}},
    {"green",  {cv::Scalar(35, 80, 80),    cv::Scalar(85, 255, 255)}},
    {"blue",   {cv::Scalar(86, 100, 100),  cv::Scalar(130, 255, 255)}},
    {"white",  {cv::Scalar(0, 0, 200),     cv::Scalar(180, 40, 255)}}
};

// Détecte la couleur dominante parmi les plages définies
std::string getDominantColor(const cv::Mat& img) {
    cv::Mat resized;
    cv::resize(img, resized, cv::Size(50, 50));
    cv::Mat hsv;
    cv::cvtColor(resized, hsv, cv::COLOR_BGR2HSV);

    std::map<std::string, int> pixel_counts;

    for (const auto& [color_name, range] : color_ranges) {
        cv::Mat mask;
        cv::inRange(hsv, range.first, range.second, mask);
        pixel_counts[color_name] = cv::countNonZero(mask);
    }

    // Choix de la couleur dominante
    std::string dominant = "unknown";
    int max_pixels = 0;
    for (const auto& [color, count] : pixel_counts) {
        if (count > max_pixels) {
            max_pixels = count;
            dominant = color;
        }
    }

    return dominant;
}

int main() {
    std::map<std::string, std::string> center_colors = {
        {"up", "yellow"},
        {"front", "red"},
        {"right", "green"},
        {"left", "blue"},
        {"back", "orange"},
        {"down", "white"}
    };

    std::map<std::string, std::map<int, std::string>> detected_colors;

    for (const auto& entry : fs::directory_iterator("stickers")) {
        if (!entry.is_regular_file()) continue;

        std::string filename = entry.path().filename().string();
        cv::Mat sticker = cv::imread(entry.path().string());
        if (sticker.empty()) {
            std::cerr << "❌ Impossible de lire " << filename << "\n";
            continue;
        }

        size_t underscore_pos = filename.find('_');
        size_t dot_pos = filename.find('.');
        if (underscore_pos == std::string::npos || dot_pos == std::string::npos) continue;

        std::string face = filename.substr(0, underscore_pos);
        int index = std::stoi(filename.substr(underscore_pos + 1, dot_pos - underscore_pos - 1));

        if (index == 5) {
            detected_colors[face][5] = center_colors[face];
        } else {
            std::string color = getDominantColor(sticker);
            detected_colors[face][index] = color;
        }
    }

    // Affichage des résultats
    for (const auto& [face, colors] : detected_colors) {
        std::cout << "Face: " << face << "\n";
        for (int i = 1; i <= 9; ++i) {
            std::string color = colors.count(i) ? colors.at(i) : "???";
            std::cout << "  " << i << ": " << color << "\n";
        }
        std::cout << "\n";
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
    
    std::cout << "\n=== Chaîne Kociemba ===\n";
    for (const std::string& face : face_order) {
        std::string face_line(1, toupper(face[0]));
        face_line += ":";
    
        for (int i = 1; i <= 9; ++i) {
            std::string color = detected_colors[face][i];
            char letter = color_to_letter.count(color) ? color_to_letter[color] : '?';
            face_line += letter;
        }
    
        std::cout << "  " << face_line << "\n";
    }

    return 0;
}