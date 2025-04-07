#include "split_stickers.hpp"
#include <opencv2/opencv.hpp>
#include "config.hpp"
#include <filesystem>
#include <map>
#include <string>
#include <iostream>

namespace fs = std::filesystem;

void splitAllFacesIntoStickers() {
    // Charger la configuration depuis un fichier YAML
    auto cfg = loadYamlConfig("data/config/config.yaml");

    // Mapping des fichiers d'images des faces du cube avec leurs noms correspondants
    std::map<std::string, std::string> face_mapping = {
        {cfg["rectified_dir"] + "face_rectified_1.jpg", "up"},    // Face supérieure
        {cfg["rectified_dir"] + "face_rectified_2.jpg", "front"}, // Face avant
        {cfg["rectified_dir"] + "face_rectified_3.jpg", "right"}, // Face droite
        {cfg["rectified_dir"] + "face_rectified_4.jpg", "left"},  // Face gauche
        {cfg["rectified_dir"] + "face_rectified_5.jpg", "back"},  // Face arrière
        {cfg["rectified_dir"] + "face_rectified_6.jpg", "down"}   // Face inférieure
    };

    // Créer le répertoire pour stocker les stickers si ce n'est pas déjà fait
    fs::create_directory(cfg["stickers_dir"]);

    // Parcourir chaque face du cube
    for (const auto& [filename, face_name] : face_mapping) {
        // Charger l'image de la face
        cv::Mat face = cv::imread(filename);
        if (face.empty()) {
            // Afficher un message d'erreur si l'image est introuvable
            std::cerr << "❌ Image introuvable : " << filename << "\n";
            continue;
        }

        // Calculer la taille d'un sticker (chaque face est divisée en une grille 3x3)
        int sticker_size_x = face.cols / 3; // Largeur d'un sticker
        int sticker_size_y = face.rows / 3; // Hauteur d'un sticker

        // Découper la face en 9 stickers
        for (int row = 0; row < 3; ++row) { // Parcourir les lignes de la grille
            for (int col = 0; col < 3; ++col) { // Parcourir les colonnes de la grille
                // Définir la région d'intérêt (ROI) pour le sticker
                int x = col * sticker_size_x; // Position en x du sticker
                int y = row * sticker_size_y; // Position en y du sticker
                cv::Rect roi(x, y, sticker_size_x, sticker_size_y); // Définir le rectangle du sticker
                cv::Mat sticker = face(roi); // Extraire le sticker à partir de la ROI

                // Générer le nom de fichier pour le sticker
                std::string out_name = cfg["stickers_dir"] + face_name + "_" + std::to_string(row * 3 + col + 1) + ".jpg";

                // Sauvegarder le sticker dans le répertoire des stickers
                cv::imwrite(out_name, sticker);
            }
        }
    }
}
