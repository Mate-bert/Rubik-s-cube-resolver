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

    if (GetOpenFileNameA(&ofn)) {
        return std::string(filename);
    }
    return "";
}

// Gestionnaire d'événements pour la souris
void mouseHandler(int event, int x, int y, int, void*) {
    if (event == cv::EVENT_LBUTTONDOWN && selected_points.size() < 4) {
        selected_points.emplace_back(x, y);
        cv::circle(resized, cv::Point(x, y), 5, cv::Scalar(0, 255, 0), cv::FILLED);
        cv::imshow("Sélectionne 4 coins", resized);
    }
}

int getNextFaceIndex() {
    int i = 1;
    while (std::filesystem::exists("face_rectified_" + std::to_string(i) + ".jpg")) {
        ++i;
    }
    return i;
}

bool chargerImageEtAfficher(const std::string& chemin) {
    original = cv::imread(chemin);
    if (original.empty()) {
        std::cerr << "❌ Erreur : image non trouvée !" << std::endl;
        return false;
    }
    resized = original.clone(); // Pas de redimensionnement, image de 640x640 utilisée directement
    return true;
}

int main() {
    std::cout << "📂 Bienvenue dans le face_rectifieur interactif (640x640 natif)\n";

    while (true) {
        if (source_image_name.empty()) {
            std::cout << "📁 Veuillez sélectionner une image source...\n";
            source_image_name = ouvrirFichierAvecExplorateur();
            if (source_image_name.empty()) {
                std::cout << "❌ Aucune image sélectionnée. Abandon.\n";
                break;
            }
        }

        if (!chargerImageEtAfficher(source_image_name)) {
            source_image_name.clear();
            continue;
        }

        while (true) {
            std::cout << "\n🖱️ Clique les 4 coins d'une face (Entrée pour valider)...\n";
            selected_points.clear();
            cv::namedWindow("Sélectionne 4 coins");
            cv::setMouseCallback("Sélectionne 4 coins", mouseHandler, nullptr);
            cv::imshow("Sélectionne 4 coins", resized);

            while (selected_points.size() < 4) {
                if (cv::waitKey(1) == 13) break;
            }

            if (selected_points.size() != 4) {
                std::cerr << "❌ Tu dois sélectionner exactement 4 points.\n";
                continue;
            }

            std::vector<cv::Point2f> dst_points = {
                {0, 0}, {639, 0}, {639, 639}, {0, 639}
            };
            cv::Mat transform = cv::getPerspectiveTransform(selected_points, dst_points);
            cv::Mat rectified;
            cv::warpPerspective(original, rectified, transform, cv::Size(640, 640));

            int face_index = getNextFaceIndex();
            std::string filename = "face_rectified_" + std::to_string(face_index) + ".jpg";
            cv::imwrite(filename, rectified);

            std::string image_filename = source_image_name.substr(source_image_name.find_last_of("/\\") + 1);

            std::ofstream coord_log("faces_coords.txt", std::ios::app);
            coord_log << image_filename << ", " << filename << ": ";
            for (size_t i = 0; i < selected_points.size(); ++i) {
                coord_log << static_cast<int>(selected_points[i].x) << " " << static_cast<int>(selected_points[i].y);
                if (i != selected_points.size() - 1) coord_log << ", ";
            }
            coord_log << std::endl;
            coord_log.close();

            cv::imshow("Face redressée", rectified);
            std::cout << "✅ Face enregistrée sous '" << filename << "'\n";

            std::cout << "\n➕ Une autre face à extraire ? [o = oui, n = nouvelle image, q = quitter] : ";
            std::string choix;
            std::getline(std::cin, choix);
            if (choix == "q") return 0;
            if (choix == "n") {
                source_image_name.clear();
                break;
            }
        }
    }

    std::cout << "👋 Fin du programme. Toutes les faces sont sauvegardées.\n";
    return 0;
}