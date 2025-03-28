#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>
#include <fstream>
#include <filesystem>

std::vector<cv::Point2f> selected_points;
cv::Mat resized;

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

int main() {
    // Charger l'image haute résolution
    cv::Mat original = cv::imread("3face_2.jpg");
    if (original.empty()) {
        std::cerr << "Erreur : image non trouvée !" << std::endl;
        return -1;
    }

    // Redimensionner à hauteur = 800 px
    int target_height = 800;
    double scale = static_cast<double>(target_height) / original.rows;
    cv::resize(original, resized, cv::Size(), scale, scale);

    // Affichage et sélection
    cv::namedWindow("Sélectionne 4 coins");
    cv::setMouseCallback("Sélectionne 4 coins", mouseHandler, nullptr);
    cv::imshow("Sélectionne 4 coins", resized);

    std::cout << "🖱️ Clique les 4 coins (sens horaire) d'une face dans l'image redimensionnée.\n"
              << "🔁 Appuie sur Entrée une fois terminé." << std::endl;

    while (selected_points.size() < 4) {
        if (cv::waitKey(1) == 13) break;  // Touche Entrée
    }

    if (selected_points.size() != 4) {
        std::cerr << "Tu dois sélectionner exactement 4 points." << std::endl;
        return -1;
    }

    // Homographie
    std::vector<cv::Point2f> output_corners = {
        {0, 0}, {300, 0}, {300, 300}, {0, 300}
    };
    cv::Mat transform = cv::getPerspectiveTransform(selected_points, output_corners);
    cv::Mat rectified;
    cv::warpPerspective(resized, rectified, transform, cv::Size(300, 300));

    // Générer nom incrémenté
    int face_index = getNextFaceIndex();
    std::string filename = "face_rectified_" + std::to_string(face_index) + ".jpg";
    cv::imwrite(filename, rectified);

    // Sauvegarde dans fichier texte
    std::ofstream coord_log("faces_coords.txt", std::ios::app); // ajout à la fin
    coord_log << filename << ": ";
    for (size_t i = 0; i < selected_points.size(); ++i) {
        coord_log << selected_points[i].x << " " << selected_points[i].y;
        if (i != selected_points.size() - 1) coord_log << ", ";
    }
    coord_log << std::endl;
    coord_log.close();

    cv::imshow("Face redressée", rectified);
    cv::waitKey(0);

    std::cout << "✅ Face enregistrée sous '" << filename << "'" << std::endl;
    return 0;
}