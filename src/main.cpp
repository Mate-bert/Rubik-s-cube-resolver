#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // Charger l'image originale
    cv::Mat image = cv::imread("3face_1.jpg");
    if (image.empty()) {
        std::cerr << "Erreur : image non trouvée !" << std::endl;
        return -1;
    }

    // Redimensionner l'image à hauteur = 800 px (conserve le ratio)
    int target_height = 800;
    double scale = (double)target_height / image.rows;
    cv::Mat resized;
    cv::resize(image, resized, cv::Size(), scale, scale);

    // === Utiliser tes coordonnées pour découper dans l'image redimensionnée ===

    // Face du haut
    cv::Rect roi_top(133, 244, 268, 183);
    cv::imwrite("face_top.jpg", resized(roi_top));

    // Face de gauche
    cv::Rect roi_left(141, 314, 144, 232);
    cv::imwrite("face_left.jpg", resized(roi_left));

    // Face de droite
    cv::Rect roi_right(246, 313, 161, 215);
    cv::imwrite("face_right.jpg", resized(roi_right));

    std::cout << "Découpes enregistrées à partir de l'image redimensionnée." << std::endl;
    return 0;
}