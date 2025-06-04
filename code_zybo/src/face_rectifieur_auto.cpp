#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include "config.hpp"
#include "utils.hpp"

using namespace cv;
using namespace std;

// Structure pour stocker les coordonnées d'une face
struct FaceCoords {
    string imageName; // Nom de l'image d'entrée
    string outputName; // Nom de l'image de sortie
    vector<Point2f> points; // Points de la face
};

// Fonction pour charger les coordonnées des faces depuis un fichier
vector<FaceCoords> loadCoords(const string& filepath) {
    vector<FaceCoords> data{};
    ifstream infile(filepath);
    string line;

    // Lire le fichier ligne par ligne
    while (getline(infile, line)) {
        if (line.empty()) continue; // Ignorer les lignes vides

        istringstream ss(line);
        string inputName, outputName;

        // Lire les noms des fichiers d'entrée et de sortie
        getline(ss, inputName, ',');
        getline(ss, outputName, ':');

        // Supprimer les espaces inutiles
        inputName.erase(remove_if(inputName.begin(), inputName.end(), ::isspace), inputName.end());
        outputName.erase(remove_if(outputName.begin(), outputName.end(), ::isspace), outputName.end());

        vector<Point2f> points{};
        float x, y;
        // Lire les coordonnées des points
        while (ss >> x >> y) {
            points.emplace_back(x, y);
            if (ss.peek() == ',') ss.ignore(); // Ignorer les virgules
        }

        // Ajouter les données dans le vecteur
        data.push_back({inputName, outputName, points});
    }
    return data;
}

// Fonction principale pour rectifier automatiquement les faces
void rectifierFacesAutomatically() {
    // Charger la configuration depuis un fichier YAML
    const auto cfg = loadYamlConfig("data/config/config.yaml");
    const string facesDir = cfg.at("raw_dir"); // Répertoire des images brutes
    const string outputDir = cfg.at("rectified_dir"); // Répertoire des images rectifiées
    const string coordsPath = cfg.at("coords_file"); // Fichier contenant les coordonnées
    const int imageSize = stoi(cfg.at("image_size")); // Taille des images rectifiées

    // Créer le répertoire de sortie s'il n'existe pas
    if (!utils::createDirectory(outputDir)) {
        cerr << "[Erreur] Impossible de créer le répertoire : " << outputDir << endl;
        return;
    }

    // Charger les coordonnées des faces
    const vector<FaceCoords> all_faces = loadCoords(coordsPath);

    // Parcourir chaque face
    for (const auto& face : all_faces) {
        // Construire le chemin de l'image d'entrée
        const string imagePath = facesDir + "/" + face.imageName;
        const Mat src = imread(imagePath); // Charger l'image
        if (src.empty()) {
            cerr << "[Erreur] Impossible de charger " << imagePath << endl;
            continue; // Passer à la face suivante si l'image est introuvable
        }

        // Définir les points de destination pour la transformation
        const vector<Point2f> dstPts = {
            Point2f(0, 0), Point2f(imageSize - 1, 0),
            Point2f(imageSize - 1, imageSize - 1), Point2f(0, imageSize - 1)
        };

        // Calculer la matrice de transformation perspective
        const Mat H = getPerspectiveTransform(face.points, dstPts);
        Mat rectified;
        // Appliquer la transformation pour rectifier l'image
        warpPerspective(src, rectified, H, Size(imageSize, imageSize));

        // Construire le chemin de sauvegarde de l'image rectifiée
        const string savePath = outputDir + "/" + face.outputName;
        imwrite(savePath, rectified); // Sauvegarder l'image rectifiée
        cout << "[OK] Sauvegardé : " << savePath << endl; // Afficher un message de succès
    }
}