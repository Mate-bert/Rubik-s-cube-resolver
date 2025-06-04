#pragma once
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <string>
#include <map>

// Classe permettant de détecter la couleur dominante dans une image
class ColorDetector {
public:
    // Constructeur de la classe
    ColorDetector();

    // Méthode pour obtenir la couleur dominante d'une image
    // Paramètre : img - une matrice OpenCV représentant l'image
    // Retourne : une chaîne de caractères représentant la couleur dominante
    std::string getDominantColor(const cv::Mat& img);

private:
    // Map contenant les plages de couleurs (en HSV) associées à des noms de couleurs
    // La clé est le nom de la couleur (ex : "rouge"), et la valeur est une paire de Scalar
    // représentant les limites inférieure et supérieure de la plage de couleur
    std::map<std::string, std::pair<cv::Scalar, cv::Scalar>> color_ranges{};
};