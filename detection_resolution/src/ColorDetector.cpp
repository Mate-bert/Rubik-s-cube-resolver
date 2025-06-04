#include "ColorDetector.hpp"

// Constructeur de la classe ColorDetector
ColorDetector::ColorDetector() {
    // Initialisation des plages de couleurs pour différentes couleurs au format HSV
    // Chaque plage est définie par deux valeurs cv::Scalar : la borne inférieure et la borne supérieure
    color_ranges = {
        {"red",    {cv::Scalar(0, 100, 100),   cv::Scalar(10, 255, 255)}},   // Plage de couleur rouge
        {"orange", {cv::Scalar(11, 100, 100),  cv::Scalar(22, 255, 255)}},   // Plage de couleur orange
        {"yellow", {cv::Scalar(23, 100, 100),  cv::Scalar(34, 255, 255)}},   // Plage de couleur jaune
        {"green",  {cv::Scalar(35, 80, 80),    cv::Scalar(85, 255, 255)}},   // Plage de couleur verte
        {"blue",   {cv::Scalar(86, 100, 100),  cv::Scalar(130, 255, 255)}},  // Plage de couleur bleue
        {"white",  {cv::Scalar(0, 0, 200),     cv::Scalar(180, 40, 255)}}    // Plage de couleur blanche
    };
}

// Méthode pour déterminer la couleur dominante dans une image
std::string ColorDetector::getDominantColor(const cv::Mat& img) {
    cv::Mat resized;
    // Redimensionner l'image d'entrée à une taille plus petite (50x50 pixels)
    // Cela permet de réduire le temps de traitement tout en conservant les informations essentielles
    cv::resize(img, resized, cv::Size(50, 50));
    
    cv::Mat hsv;
    // Convertir l'image redimensionnée de l'espace de couleur BGR (utilisé par OpenCV par défaut)
    // à l'espace de couleur HSV (Teinte, Saturation, Valeur), plus adapté pour la détection de couleurs
    cv::cvtColor(resized, hsv, cv::COLOR_BGR2HSV);

    // Carte pour stocker le nombre de pixels correspondant à chaque couleur
    std::map<std::string, int> pixel_counts;

    // Parcourir chaque plage de couleurs définie dans color_ranges
    for (const auto& [color_name, range] : color_ranges) {
        cv::Mat mask;
        // Créer un masque binaire où les pixels dans la plage de couleur sont blancs (valeur 255)
        // et les autres pixels sont noirs (valeur 0)
        cv::inRange(hsv, range.first, range.second, mask);
        // Compter le nombre de pixels blancs (non nuls) dans le masque
        pixel_counts[color_name] = cv::countNonZero(mask);
    }

    // Déterminer la couleur avec le plus grand nombre de pixels
    std::string dominant = "unknown"; // Par défaut, "unknown" si aucune couleur dominante n'est trouvée
    int max_pixels = 0; // Variable pour stocker le nombre maximum de pixels trouvés
    for (const auto& [color, count] : pixel_counts) {
        // Si le nombre de pixels pour une couleur est supérieur au maximum actuel
        if (count > max_pixels) {
            max_pixels = count; // Mettre à jour le maximum
            dominant = color;   // Mettre à jour la couleur dominante
        }
    }

    // Retourner la couleur dominante trouvée
    return dominant;
}
