#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include "kociemba_solver.hpp"
#include "CubeParser.hpp"
#include "RubiksCube.hpp"
#include "Solver.hpp"

// Fonction pour résoudre un Rubik's Cube à partir d'un fichier contenant les facelets
void solveWithKociembaFile(const std::string& kociemba_path) {
    // Affiche le chemin du fichier Kociemba
    std::cout << "📂 Ouverture du fichier Kociemba : " << kociemba_path << "\n";
    std::ifstream file(kociemba_path);
    
    // Vérifie si le fichier peut être ouvert
    if (!file) {
        std::cerr << "❌ Impossible d'ouvrir le fichier : " << kociemba_path << std::endl;
        return;
    }

    // Lecture des lignes du fichier
    std::string line;
    std::vector<std::string> lines;
    while (std::getline(file, line)) {
        // Supprime les guillemets et les virgules des lignes
        line.erase(std::remove(line.begin(), line.end(), '"'), line.end());
        line.erase(std::remove(line.begin(), line.end(), ','), line.end());
        lines.push_back(line);
    }

    // Vérifie que le fichier contient exactement 6 lignes (une pour chaque face du cube)
    if (lines.size() != 6) {
        std::cerr << "❌ Format invalide : il faut 6 lignes dans le fichier Kociemba.\n";
        return;
    }

    // Copie les lignes dans un tableau de chaînes de caractères
    std::string faces[6];
    std::copy(lines.begin(), lines.end(), faces);

    // Parsing des facelets du cube
    std::cout << "📦 Parsing des facelets...\n";
    FaceletCube faceletCube;
    CubeParser parser;
    RubiksCube cube;
    Solver solver;

    // Analyse des facelets pour vérifier leur validité
    int result = parser.parseFacelets(faces, faceletCube);
    if (result != CubeParser::VALID) {
        std::cout << "❌ Erreur de parsing : " << parser.ErrorText(result) << std::endl;
        return;
    }

    // Validation du cube après parsing
    std::cout << "✅ Parsing réussi ! Validation du cube...\n";
    result = faceletCube.Validate(cube);
    if (result != FaceletCube::VALID) {
        std::cout << "❌ Cube invalide : " << faceletCube.ErrorText(result) << std::endl;
        return;
    }

    // Initialisation des tables nécessaires pour la résolution
    std::cout << "🧠 Initialisation des tables...\n";
    solver.InitializeTables();

    // Lancement de l'algorithme de résolution
    std::cout << "🚀 Lancement de la résolution...\n";
    result = solver.Solve(cube);
    std::cout << "📥 Résultat solver.Solve() = " << result << "\n";

    // Vérifie si une solution a été trouvée
    if (result == Solver::FOUND || result == Solver::OPTIMUM_FOUND) {
        std::cout << "✅ Solution trouvée (dans solveWithKociembaFile) :\n";
        solver.PrintSolution(); // Affiche la solution trouvée
    } else {
        std::cout << "❌ Échec de résolution dans solveWithKociembaFile.\n";
    }

    // Fin de la fonction
    std::cout << "✅ FIN solveWithKociembaFile()\n";
}