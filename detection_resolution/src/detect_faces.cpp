#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>

using namespace cv;
using namespace std;

Mat src, display, edges;
vector<Point> selectedPoints;
int pointCount = 0;

// Fonction pour dessiner une ligne entre deux points sur les deux images
void drawLineWithCenter(Point center, Point pt1, Scalar color) {
    line(display, center, pt1, color, 2);  // Ligne verte sur l'image Canny
    line(src, center, pt1, color, 2);      // Ligne verte sur l'image originale
    circle(src, pt1, 3, color, -1);        // Afficher le point sur l'image originale
    circle(display, pt1, 3, color, -1);    // Afficher le point sur l'image Canny
}

// Fonction pour relier les points et compléter les quadrilatères
void completeQuadrilaterals() {
    // Relier les points pour compléter les 3 quadrilatères
    for (size_t i = 0; i < 3; i++) {
        // Relier chaque point à son suivant pour former les côtés des quadrilatères
        line(src, selectedPoints[i], selectedPoints[(i+1)%3], Scalar(0, 0, 255), 2); // Ligne rouge sur l'image originale
        line(display, selectedPoints[i], selectedPoints[(i+1)%3], Scalar(0, 0, 255), 2); // Ligne rouge sur l'image Canny
    }
}

void onMouse(int event, int x, int y, int, void*) {
    if (event != EVENT_LBUTTONDOWN || selectedPoints.size() >= 4) {
        return;
    }

    selectedPoints.push_back(Point(x, y));

    if (selectedPoints.size() == 4) {
        Point center = selectedPoints[0]; // Le premier point est notre centre

        display = edges.clone(); // Utiliser l'image Canny pour afficher les lignes
        src = imread("data/raw/3face_2.jpg"); // Recharger l'image originale pour la mise à jour

        // Tracer les 3 lignes reliant le centre aux autres points sur les deux images
        for (size_t i = 1; i < selectedPoints.size(); i++) {
            drawLineWithCenter(center, selectedPoints[i], Scalar(0, 255, 0)); // Lignes vertes
        }

        // Compléter les quadrilatères avec les lignes manquantes
        completeQuadrilaterals();

        // Mettre à jour l'affichage des deux fenêtres
        imshow("Image originale", src);
        imshow("Canny avec lignes", display);
    }
}

int main() {
    src = imread("data/raw/3face_2.jpg"); // Assurez-vous que le chemin vers votre image est correct
    if (src.empty()) {
        cerr << "Erreur : image non trouvée." << endl;
        return -1;
    }

    // Conversion en niveaux de gris et application du filtre Canny
    Mat gray, blurred;
    cvtColor(src, gray, COLOR_BGR2GRAY);
    GaussianBlur(gray, blurred, Size(5, 5), 1.5);
    Canny(blurred, edges, 0, 37); // Paramètres ajustés pour Canny

    display = edges.clone();

    // Créer des fenêtres pour l'image originale et l'image Canny
    namedWindow("Image originale", WINDOW_NORMAL);
    namedWindow("Canny avec lignes", WINDOW_NORMAL);
    
    resizeWindow("Image originale", 640, 640);
    resizeWindow("Canny avec lignes", 640, 640);

    // Affichage de l'image originale
    imshow("Image originale", src);
    
    // Définir la couleur des lignes sur l'image Canny
    setMouseCallback("Image originale", onMouse);

    // Afficher l'image Canny
    imshow("Canny avec lignes", display);
    cout << "Cliquez sur 4 points dans l'image originale pour tracer les lignes." << endl;

    waitKey(0);
    return 0;
}