#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include <fstream>
#include <filesystem>
#include <windows.h>
#include <commdlg.h>

// Vecteur pour stocker les points sélectionnés par l'utilisateur
std::vector<cv::Point2f> selected_points;

// Matrices pour stocker l'image affichée et l'image originale
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

    // Si l'utilisateur sélectionne un fichier, on retourne son chemin
    if (GetOpenFileNameA(&ofn)) {
        return std::string(filename);
    }
    return ""; // Retourne une chaîne vide si aucun fichier n'est sélectionné
}

// Gestionnaire d'événements pour la souris
void mouseHandler(int event, int x, int y, int, void*) {
    // Si un clic gauche est détecté et que moins de 4 points sont sélectionnés
    if (event == cv::EVENT_LBUTTONDOWN && selected_points.size() < 4) {
        selected_points.emplace_back(x, y); // Ajoute le point sélectionné
        // Dessine un cercle vert sur l'image pour indiquer le point sélectionné
        cv::circle(resized, cv::Point(x, y), 5, cv::Scalar(0, 255, 0), cv::FILLED);
        cv::imshow("Sélectionne 4 coins", resized); // Met à jour l'affichage
    }
}

// Fonction pour obtenir l'index du prochain fichier de face rectifiée
int getNextFaceIndex() {
    int i = 1;
    // Vérifie si un fichier avec cet index existe déjà
    while (std::filesystem::exists("face_rectified_" + std::to_string(i) + ".jpg")) {
        ++i; // Incrémente l'index si le fichier existe
    }
    return i; // Retourne le premier index disponible
}

// Fonction pour charger une image et l'afficher
bool chargerImageEtAfficher(const std::string& chemin) {
    original = cv::imread(chemin); // Charge l'image depuis le chemin donné
    if (original.empty()) { // Vérifie si l'image a été chargée correctement
        std::cerr << "❌ Erreur : image non trouvée !" << std::endl;
        return false;
    }
    resized = original.clone(); // Clone l'image originale (pas de redimensionnement ici)
    return true;
}

int main() {
    std::cout << "📂 Bienvenue dans le face_rectifieur interactif (640x640 natif)\n";

    while (true) {
        // Si aucune image source n'a été sélectionnée, demande à l'utilisateur d'en choisir une
        if (source_image_name.empty()) {
            std::cout << "📁 Veuillez sélectionner une image source...\n";
            source_image_name = ouvrirFichierAvecExplorateur();
            if (source_image_name.empty()) { // Si aucun fichier n'est sélectionné
                std::cout << "❌ Aucune image sélectionnée. Abandon.\n";
                break;
            }
        }

        // Charge l'image sélectionnée
        if (!chargerImageEtAfficher(source_image_name)) {
            source_image_name.clear(); // Réinitialise le nom de l'image si le chargement échoue
            continue;
        }

        while (true) {
            std::cout << "\n🖱️ Clique les 4 coins d'une face (Entrée pour valider)...\n";
            selected_points.clear(); // Réinitialise les points sélectionnés
            cv::namedWindow("Sélectionne 4 coins"); // Crée une fenêtre pour afficher l'image
            cv::setMouseCallback("Sélectionne 4 coins", mouseHandler, nullptr); // Définit le gestionnaire d'événements pour la souris
            cv::imshow("Sélectionne 4 coins", resized); // Affiche l'image

            // Attend que l'utilisateur sélectionne 4 points
            while (selected_points.size() < 4) {
                if (cv::waitKey(1) == 13) break; // Permet de quitter avec la touche Entrée
            }

            // Vérifie si exactement 4 points ont été sélectionnés
            if (selected_points.size() != 4) {
                std::cerr << "❌ Tu dois sélectionner exactement 4 points.\n";
                continue;
            }

            // Définit les points de destination pour la transformation perspective
            std::vector<cv::Point2f> dst_points = {
                {0, 0}, {639, 0}, {639, 639}, {0, 639}
            };
            // Calcule la matrice de transformation perspective
            cv::Mat transform = cv::getPerspectiveTransform(selected_points, dst_points);
            cv::Mat rectified;
            // Applique la transformation perspective pour redresser l'image
            cv::warpPerspective(original, rectified, transform, cv::Size(640, 640));

            // Génère un nom de fichier unique pour la face rectifiée
            int face_index = getNextFaceIndex();
            std::string filename = "face_rectified_" + std::to_string(face_index) + ".jpg";
            cv::imwrite(filename, rectified); // Sauvegarde l'image rectifiée

            // Récupère le nom du fichier source (sans le chemin)
            std::string image_filename = source_image_name.substr(source_image_name.find_last_of("/\\") + 1);

            // Enregistre les coordonnées des points sélectionnés dans un fichier texte
            std::ofstream coord_log("faces_coords.txt", std::ios::app);
            coord_log << image_filename << ", " << filename << ": ";
            for (size_t i = 0; i < selected_points.size(); ++i) {
                coord_log << static_cast<int>(selected_points[i].x) << " " << static_cast<int>(selected_points[i].y);
                if (i != selected_points.size() - 1) coord_log << ", ";
            }
            coord_log << std::endl;
            coord_log.close();

            // Affiche l'image rectifiée
            cv::imshow("Face redressée", rectified);
            std::cout << "✅ Face enregistrée sous '" << filename << "'\n";

            // Demande à l'utilisateur s'il souhaite continuer
            std::cout << "\n➕ Une autre face à extraire ? [o = oui, n = nouvelle image, q = quitter] : ";
            std::string choix;
            std::getline(std::cin, choix);
            if (choix == "q") return 0; // Quitte le programme
            if (choix == "n") {
                source_image_name.clear(); // Réinitialise le nom de l'image pour en sélectionner une nouvelle
                break;
            }
        }
    }

    std::cout << "👋 Fin du programme. Toutes les faces sont sauvegardées.\n";
    return 0;
}