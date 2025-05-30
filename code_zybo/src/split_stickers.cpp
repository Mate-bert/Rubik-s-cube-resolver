#include "split_stickers.hpp"
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include "config.hpp"
#include "utils.hpp"
#include <sys/stat.h>
#include <map>
#include <string>
#include <iostream>

// Fonction utilitaire pour créer un répertoire
bool createDirectory(const std::string& path) {
    struct stat info;
    if (stat(path.c_str(), &info) != 0) {
        // Le répertoire n'existe pas, on le crée
        return mkdir(path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == 0;
    }
    return (info.st_mode & S_IFDIR) != 0;
}

void splitAllFacesIntoStickers() {
    // Charger la configuration depuis un fichier YAML
    const auto cfg = loadYamlConfig("data/config/config.yaml");

    // Mapping des fichiers d'images des faces du cube avec leurs noms correspondants
    const std::map<std::string, std::string> face_mapping = {
        {cfg.at("rectified_dir") + "face_rectified_1.jpg", "up"},    // Face supérieure
        {cfg.at("rectified_dir") + "face_rectified_2.jpg", "front"}, // Face avant
        {cfg.at("rectified_dir") + "face_rectified_3.jpg", "right"}, // Face droite
        {cfg.at("rectified_dir") + "face_rectified_4.jpg", "left"},  // Face gauche
        {cfg.at("rectified_dir") + "face_rectified_5.jpg", "back"},  // Face arrière
        {cfg.at("rectified_dir") + "face_rectified_6.jpg", "down"}   // Face inférieure
    };

    // Créer le répertoire pour stocker les stickers si ce n'est pas déjà fait
    if (!utils::createDirectory(cfg.at("stickers_dir"))) {
        std::cerr << "❌ Impossible de créer le répertoire : " << cfg.at("stickers_dir") << std::endl;
        return;
    }

    // Parcourir chaque face du cube
    for (const auto& face_pair : face_mapping) {
        const std::string& filename = face_pair.first;
        const std::string& face_name = face_pair.second;

        // Charger l'image de la face
        const cv::Mat face = cv::imread(filename);
        if (face.empty()) {
            // Afficher un message d'erreur si l'image est introuvable
            std::cerr << "❌ Image introuvable : " << filename << "\n";
            continue;
        }

        // Calculer la taille d'un sticker (chaque face est divisée en une grille 3x3)
        const int sticker_size_x = face.cols / 3; // Largeur d'un sticker
        const int sticker_size_y = face.rows / 3; // Hauteur d'un sticker

        // Découper la face en 9 stickers
        for (int row = 0; row < 3; ++row) { // Parcourir les lignes de la grille
            for (int col = 0; col < 3; ++col) { // Parcourir les colonnes de la grille
                // Définir la région d'intérêt (ROI) pour le sticker
                const int x = col * sticker_size_x; // Position en x du sticker
                const int y = row * sticker_size_y; // Position en y du sticker
                const cv::Rect roi(x, y, sticker_size_x, sticker_size_y); // Définir le rectangle du sticker
                const cv::Mat sticker = face(roi); // Extraire le sticker à partir de la ROI

                // Générer le nom de fichier pour le sticker
                const std::string out_name = cfg.at("stickers_dir") + face_name + "_" + std::to_string(row * 3 + col + 1) + ".jpg";

                // Sauvegarder le sticker dans le répertoire des stickers
                cv::imwrite(out_name, sticker);
            }
        }
    }
}
