#include <iostream>
#include <fstream>
#include <map>
#include <vector>
#include <dirent.h>
#include <sys/stat.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include "config.hpp"
#include "face_rectifieur_auto.hpp"
#include "split_stickers.hpp"
#include "ColorDetector.hpp"
#include "kociemba_solver.hpp"
#include "traduction.hpp"
#include "check_structure.hpp"

// Fonction utilitaire pour vérifier si un chemin est un fichier régulier
bool isRegularFile(const std::string& path) {
    struct stat path_stat;
    stat(path.c_str(), &path_stat);
    return S_ISREG(path_stat.st_mode);
}

// Fonction utilitaire pour obtenir le nom du fichier à partir du chemin complet
std::string getFilename(const std::string& path) {
    size_t pos = path.find_last_of("/\\");
    return (pos != std::string::npos) ? path.substr(pos + 1) : path;
}

int main() {
    // Charge la configuration depuis un fichier YAML
    auto cfg = loadYamlConfig("data/config/config.yaml");

    // Étape 1 : Redressement automatique des faces du Rubik's Cube
    std::cout << "🔧 Étape 1 : Redressement des faces...\n";
    rectifierFacesAutomatically();

    // Étape 2 : Découpage des faces en stickers individuels
    std::cout << "✂️ Étape 2 : Découpage des faces en stickers...\n";
    splitAllFacesIntoStickers();

    // Étape 3 : Détection des couleurs dominantes sur chaque sticker
    std::cout << "🎨 Étape 3 : Détection des couleurs dominantes...\n";
    ColorDetector detector;

    // Définition des couleurs des centres pour chaque face
    std::map<std::string, std::string> center_colors = {
        {"up", "yellow"},
        {"front", "red"},
        {"right", "green"},
        {"left", "blue"},
        {"back", "orange"},
        {"down", "white"}
    };

    // Stockage des couleurs détectées pour chaque face et chaque sticker
    std::map<std::string, std::map<int, std::string>> detected_colors;

    // Parcourt tous les fichiers dans le répertoire des stickers
    DIR* dir = opendir(cfg["stickers_dir"].c_str());
    if (dir != nullptr) {
        struct dirent* entry;
        while ((entry = readdir(dir)) != nullptr) {
            std::string filename = entry->d_name;
            if (filename == "." || filename == "..") continue;

            std::string fullpath = cfg["stickers_dir"] + "/" + filename;
            if (!isRegularFile(fullpath)) continue;

            // Charge l'image du sticker
            cv::Mat sticker = cv::imread(fullpath);
            if (sticker.empty()) continue;

            // Extrait les informations sur la face et l'index du sticker à partir du nom du fichier
            size_t underscore_pos = filename.find('_');
            size_t dot_pos = filename.find('.');
            if (underscore_pos == std::string::npos || dot_pos == std::string::npos) continue;

            std::string face = filename.substr(0, underscore_pos);
            int index = std::stoi(filename.substr(underscore_pos + 1, dot_pos - underscore_pos - 1));

            // Si le sticker est le centre, on utilise la couleur prédéfinie
            if (index == 5) {
                detected_colors[face][5] = center_colors[face];
            } else {
                // Sinon, on détecte la couleur dominante
                std::string color = detector.getDominantColor(sticker);
                detected_colors[face][index] = color;
            }
        }
        closedir(dir);
    }

    // Correspondance entre les couleurs et les lettres utilisées par l'algorithme de Kociemba
    std::map<std::string, char> color_to_letter = {
        {"yellow", 'U'},
        {"red",    'F'},
        {"green",  'R'},
        {"blue",   'L'},
        {"orange", 'B'},
        {"white",  'D'}
    };

    // Ordre des faces pour la chaîne Kociemba
    std::vector<std::string> face_order = {"up", "right", "front", "down", "left", "back"};

    // Ouvre le fichier de sortie pour écrire la chaîne Kociemba
    std::ofstream out(cfg["kociemba_txt"]);
    for (size_t i = 0; i < face_order.size(); ++i) {
        const std::string& face = face_order[i];
        // Prépare une ligne pour la face actuelle
        std::string face_line(1, toupper(face[0]));
        face_line += ":";
    
        // Ajoute les lettres correspondant aux couleurs des stickers
        for (int j = 1; j <= 9; ++j) {
            std::string color = detected_colors[face][j];
            char letter = color_to_letter.count(color) ? color_to_letter[color] : '?';
            face_line += letter;
        }
    
        // Écrit la ligne dans le fichier
        out << "\"" << face_line << "\"";
        if (i < face_order.size() - 1) out << ",";
        out << "\n";
    }
    out.close();

    // Affiche un message de succès
    std::cout << "✅ Chaîne Kociemba générée dans le fichier kociemba.txt\n";
    
    // Vérification de la structure du cube
    std::cout << "🔎 Vérification de la structure du cube...\n";
    if (!checkAndFixKociembaStructure(cfg["kociemba_test"])) {
        std::cerr << "❌ Structure invalide, correction impossible.\n";
        return 1;  // Stoppe le programme
    }
    std::cout << "✅ Structure du cube vérifiée et corrigée si besoin.\n";

    // Étape 4 : Résolution du cube
    std::cout << "🧩 Étape 4 : Résolution du cube...\n";
    solveWithKociembaFile(cfg["kociemba_test"]);
    std::cout << "✅ solveWithKociembaFile exécutée avec succès !\n";
    
    // Étape 5 : Encodage de la solution
    std::cout << "📦 Étape 5 : Encodage de la solution...\n";
    encodeResolution();
    std::cout << "✅ Encodage terminé ! 🎉\n";
    
    return 0;
}