#include "face_rectifieur_auto.hpp"
#include <opencv2/opencv.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <filesystem>
#include <tuple>
#include <map>
#include <algorithm>
#include "config.hpp"

namespace fs = std::filesystem;

// Fonction pour analyser une chaîne de caractères contenant des coordonnées et les convertir en un vecteur de points
std::vector<cv::Point2f> parseCoords(const std::string& coord_str) {
    std::vector<cv::Point2f> points;
    std::stringstream ss(coord_str);
    std::string token;
    while (std::getline(ss, token, ',')) {
        float x, y;
        std::stringstream pair(token);
        pair >> x >> y; // Extraction des coordonnées x et y
        points.emplace_back(x, y); // Ajout du point au vecteur
    }
    return points;
}

// Fonction pour charger les coordonnées à partir d'un fichier
bool loadCoords(const std::string& filename,
                std::vector<std::tuple<std::string, std::string, std::vector<cv::Point2f>>>& coord_entries) {
    std::ifstream file(filename);
    if (!file.is_open()) return false; // Vérifie si le fichier est ouvert

    std::string line;
    while (std::getline(file, line)) {
        size_t colon_pos = line.find(':');
        if (colon_pos == std::string::npos) continue; // Ignore les lignes mal formatées

        std::string left = line.substr(0, colon_pos);
        std::string coords = line.substr(colon_pos + 1);

        size_t comma_pos = left.find(',');
        if (comma_pos == std::string::npos) continue; // Ignore les lignes mal formatées

        std::string source = left.substr(0, comma_pos);
        std::string output = left.substr(comma_pos + 1);
        output.erase(0, output.find_first_not_of(" ")); // Supprime les espaces inutiles

        auto pts = parseCoords(coords); // Analyse les coordonnées
        if (pts.size() == 4) { // Vérifie que 4 points sont présents
            coord_entries.emplace_back(source, output, pts);
        }
    }
    return true;
}

// Fonction pour récupérer les images les plus récentes dans un répertoire
std::vector<fs::path> getMostRecentImages(size_t count = 2) {
    std::vector<fs::directory_entry> entries;
    auto cfg = loadYamlConfig("data/config/config.yaml"); // Charge la configuration YAML
    for (const auto& f : fs::directory_iterator(cfg["raw_dir"])) {
        if (f.path().extension() == ".jpg") { // Filtre les fichiers avec l'extension .jpg
            entries.push_back(f);
        }
    }
    // Trie les fichiers par date de modification (du plus récent au plus ancien)
    std::sort(entries.begin(), entries.end(), [](const auto& a, const auto& b) {
        return fs::last_write_time(a) > fs::last_write_time(b);
    });

    std::vector<fs::path> recent;
    for (size_t i = 0; i < std::min(count, entries.size()); ++i) {
        recent.push_back(entries[i].path()); // Ajoute les chemins des fichiers les plus récents
    }
    return recent;
}

// Fonction principale pour rectifier automatiquement les faces
void rectifierFacesAutomatically() {
    auto cfg = loadYamlConfig("data/config/config.yaml"); // Charge la configuration YAML
    bool face1_exists = fs::exists(cfg["raw_dir"] + "3face_1.jpg"); // Vérifie si face_1 existe
    bool face2_exists = fs::exists(cfg["raw_dir"] + "3face_2.jpg"); // Vérifie si face_2 existe

    std::vector<std::string> used_names; // Liste des fichiers temporaires utilisés
    if (!face1_exists || !face2_exists) {
        auto images = getMostRecentImages(2); // Récupère les 2 images les plus récentes
        if (images.size() < 2) return; // Si moins de 2 images, on arrête

        if (!face1_exists) {
            std::string temp1 = cfg["raw_dir"] + "3face_1.jpg";
            if (!fs::exists(temp1)) {
                fs::copy(images[0], temp1, fs::copy_options::overwrite_existing); // Copie l'image la plus récente
                used_names.push_back(temp1);
            }
        }
        if (!face2_exists) {
            std::string temp2 = cfg["raw_dir"] + "3face_2.jpg";
            if (!fs::exists(temp2)) {
                fs::copy(images[1], temp2, fs::copy_options::overwrite_existing); // Copie la deuxième image la plus récente
                used_names.push_back(temp2);
            }
        }
    }

    // Charge les coordonnées des points à partir du fichier de configuration
    std::vector<std::tuple<std::string, std::string, std::vector<cv::Point2f>>> coord_entries;
    if (!loadCoords(cfg["coords_file"], coord_entries)) return; // Si échec du chargement, on arrête
    if (coord_entries.size() < 6) return; // Si moins de 6 entrées, on arrête

    std::map<std::string, cv::Mat> resized_images; // Cache pour les images redimensionnées
    const int target_height = 800; // Hauteur cible pour le redimensionnement

    for (int i = 0; i < 6; ++i) {
        auto& [src_img, out_img_raw, pts] = coord_entries[i];
        std::string out_img = cfg["rectified_dir"] + out_img_raw;
        std::string actual_img = (i < 3) ? cfg["raw_dir"] + "3face_1.jpg" : cfg["raw_dir"] + "3face_2.jpg";

        // Charge et redimensionne l'image si elle n'est pas déjà dans le cache
        if (resized_images.find(actual_img) == resized_images.end()) {
            cv::Mat original = cv::imread(actual_img);
            if (original.empty()) continue; // Si l'image est vide, on passe

            double scale = static_cast<double>(target_height) / original.rows; // Calcul du facteur d'échelle
            cv::Mat resized;
            cv::resize(original, resized, cv::Size(), scale, scale); // Redimensionne l'image
            resized_images[actual_img] = resized; // Ajoute l'image redimensionnée au cache
        }

        // Points de destination pour la transformation perspective
        std::vector<cv::Point2f> dst = {
            {0, 0}, {300, 0}, {300, 300}, {0, 300}
        };

        // Calcule la matrice de transformation perspective
        cv::Mat transform = cv::getPerspectiveTransform(pts, dst);
        cv::Mat rectified;
        // Applique la transformation perspective
        cv::warpPerspective(resized_images[actual_img], rectified, transform, cv::Size(300, 300));

        // Sauvegarde l'image rectifiée
        if (!cv::imwrite(out_img, rectified)) {
            std::cerr << "❌ Erreur d'écriture : " << out_img << std::endl;
        } else {
            std::cout << "📤 Sauvegarde image vers : " << out_img << std::endl;
        }
    }

    // Supprime les fichiers temporaires utilisés
    for (const auto& name : used_names) {
        fs::remove(name);
    }
}