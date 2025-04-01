#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include <fstream>
#include <filesystem>
#include <windows.h>
#include <commdlg.h>

// Vecteur pour stocker les points sélectionnés par l'utilisateur
std::vector<cv::Point2f> selected_points;

// Matrices pour stocker l'image redimensionnée et l'image originale
cv::Mat resized;
cv::Mat original;

// Nom de l'image source sélectionnée
std::string source_image_name;

// Fonction pour ouvrir un explorateur de fichiers Windows et sélectionner une image
std::string ouvrirFichierAvecExplorateur() {
    char filename[MAX_PATH] = "";
    OPENFILENAMEA ofn;
    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    ofn.lpstrFile = filename;
    ofn.nMaxFile = MAX_PATH;
    ofn.lpstrFilter = "Images\0*.jpg;*.png;*.jpeg\0All Files\0*.*\0";
    ofn.Flags = OFN_FILEMUSTEXIST;

    // Si un fichier est sélectionné, retourner son chemin
    if (GetOpenFileNameA(&ofn)) {
        return std::string(filename);
    }
    return ""; // Retourner une chaîne vide si aucun fichier n'est sélectionné
}

// Gestionnaire d'événements pour la souris (sélection des points)
void mouseHandler(int event, int x, int y, int, void*) {
    // Si un clic gauche est détecté et que moins de 4 points sont sélectionnés
    if (event == cv::EVENT_LBUTTONDOWN && selected_points.size() < 4) {
        selected_points.emplace_back(x, y); // Ajouter le point sélectionné
        cv::circle(resized, cv::Point(x, y), 5, cv::Scalar(0, 255, 0), cv::FILLED); // Dessiner un cercle sur le point
        cv::imshow("Sélectionne 4 coins", resized); // Mettre à jour l'affichage
    }
}

// Fonction pour obtenir l'index du prochain fichier de face rectifiée
int getNextFaceIndex() {
    int i = 1;
    // Incrémenter l'index jusqu'à trouver un nom de fichier inexistant
    while (std::filesystem::exists("face_rectified_" + std::to_string(i) + ".jpg")) {
        ++i;
    }
    return i;
}

// Fonction pour charger une image et la redimensionner
bool chargerImageEtRedimensionner(const std::string& chemin) {
    original = cv::imread(chemin); // Charger l'image
    if (original.empty()) {
        std::cerr << "❌ Erreur : image non trouvée !" << std::endl;
        return false; // Retourner false si l'image n'est pas trouvée
    }
    int target_height = 800; // Hauteur cible pour le redimensionnement
    double scale = static_cast<double>(target_height) / original.rows; // Calculer le facteur d'échelle
    cv::resize(original, resized, cv::Size(), scale, scale); // Redimensionner l'image
    return true;
}

int main() {
    std::cout << "📂 Bienvenue dans le face_rectifieur interactif (avec explorateur de fichier Windows)\n";

    while (true) {
        // Si aucune image source n'est sélectionnée, demander à l'utilisateur d'en choisir une
        if (source_image_name.empty()) {
            std::cout << "📁 Veuillez sélectionner une image source...\n";
            source_image_name = ouvrirFichierAvecExplorateur();
            if (source_image_name.empty()) {
                std::cout << "❌ Aucune image sélectionnée. Abandon.\n";
                break; // Quitter si aucune image n'est sélectionnée
            }
        }

        // Charger et redimensionner l'image
        if (!chargerImageEtRedimensionner(source_image_name)) {
            source_image_name.clear(); // Réinitialiser le nom de l'image en cas d'erreur
            continue;
        }

        while (true) {
            std::cout << "\n🖱️ Clique les 4 coins d'une face (Entrée pour valider)...\n";
            selected_points.clear(); // Réinitialiser les points sélectionnés
            cv::namedWindow("Sélectionne 4 coins");
            cv::setMouseCallback("Sélectionne 4 coins", mouseHandler, nullptr); // Associer le gestionnaire de souris
            cv::imshow("Sélectionne 4 coins", resized);

            // Attendre que l'utilisateur sélectionne 4 points
            while (selected_points.size() < 4) {
                if (cv::waitKey(1) == 13) break; // Arrêter si l'utilisateur appuie sur Entrée
            }

            // Vérifier que 4 points ont bien été sélectionnés
            if (selected_points.size() != 4) {
                std::cerr << "❌ Tu dois sélectionner exactement 4 points.\n";
                continue; // Recommencer si ce n'est pas le cas
            }

            // Calculer la transformation homographique
            std::vector<cv::Point2f> dst_points = {
                {0, 0}, {300, 0}, {300, 300}, {0, 300}
            };
            cv::Mat transform = cv::getPerspectiveTransform(selected_points, dst_points);
            cv::Mat rectified;
            cv::warpPerspective(resized, rectified, transform, cv::Size(300, 300)); // Appliquer la transformation

            // Sauvegarder l'image rectifiée
            int face_index = getNextFaceIndex();
            std::string filename = "face_rectified_" + std::to_string(face_index) + ".jpg";
            cv::imwrite(filename, rectified);

            // Extraire uniquement le nom du fichier source sans le chemin
            std::string image_filename = source_image_name.substr(source_image_name.find_last_of("/\\") + 1);
                    
            // Enregistrer les coordonnées des points dans un fichier texte
            std::ofstream coord_log("faces_coords.txt", std::ios::app);
            coord_log << image_filename << ", " << filename << ": ";
            for (size_t i = 0; i < selected_points.size(); ++i) {
                coord_log << static_cast<int>(selected_points[i].x) << " " << static_cast<int>(selected_points[i].y);
                if (i != selected_points.size() - 1) coord_log << ", ";
            }
            coord_log << std::endl;
            coord_log.close();

            // Afficher l'image rectifiée
            cv::imshow("Face redressée", rectified);
            std::cout << "✅ Face enregistrée sous '" << filename << "'\n";

            // Demander à l'utilisateur s'il souhaite continuer
            std::cout << "\n➕ Une autre face à extraire ? [o = oui, n = nouvelle image, q = quitter] : ";
            std::string choix;
            std::getline(std::cin, choix);
            if (choix == "q") return 0; // Quitter le programme
            if (choix == "n") {
                source_image_name.clear(); // Réinitialiser pour charger une nouvelle image
                break;
            }
            // Si "o" ou vide, continuer sur la même image
        }
    }

    std::cout << "👋 Fin du programme. Toutes les faces sont sauvegardées.\n";
    return 0;
}