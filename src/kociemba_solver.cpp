#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include "kociemba_solver.hpp"
#include "CubeParser.hpp"
#include "RubiksCube.hpp"
#include "Solver.hpp"

void solveWithKociembaFile(const std::string& kociemba_path) {
    std::cout << "📂 Ouverture du fichier Kociemba : " << kociemba_path << "\n";
    std::ifstream file(kociemba_path);
    if (!file) {
        std::cerr << "❌ Impossible d'ouvrir le fichier : " << kociemba_path << std::endl;
        return;
    }

    std::string line;
    std::vector<std::string> lines;
    while (std::getline(file, line)) {
        line.erase(std::remove(line.begin(), line.end(), '"'), line.end());
        line.erase(std::remove(line.begin(), line.end(), ','), line.end());
        lines.push_back(line);
    }

    if (lines.size() != 6) {
        std::cerr << "❌ Format invalide : il faut 6 lignes dans le fichier Kociemba.\n";
        return;
    }

    std::string faces[6];
    std::copy(lines.begin(), lines.end(), faces);

    std::cout << "📦 Parsing des facelets...\n";
    FaceletCube faceletCube;
    CubeParser parser;
    RubiksCube cube;
    Solver solver;

    int result = parser.parseFacelets(faces, faceletCube);
    if (result != CubeParser::VALID) {
        std::cout << "❌ Erreur de parsing : " << parser.ErrorText(result) << std::endl;
        return;
    }

    std::cout << "✅ Parsing réussi ! Validation du cube...\n";
    result = faceletCube.Validate(cube);
    if (result != FaceletCube::VALID) {
        std::cout << "❌ Cube invalide : " << faceletCube.ErrorText(result) << std::endl;
        return;
    }

    std::cout << "🧠 Initialisation des tables...\n";
    solver.InitializeTables();
    std::cout << "🚀 Lancement de la résolution...\n";
    result = solver.Solve(cube);
    std::cout << "📥 Résultat solver.Solve() = " << result << "\n";

    if (result == Solver::FOUND || result == Solver::OPTIMUM_FOUND) {
        std::cout << "✅ Solution trouvée (dans solveWithKociembaFile) :\n";
        solver.PrintSolution();
    } else {
        std::cout << "❌ Échec de résolution dans solveWithKociembaFile.\n";
    }

    std::cout << "✅ FIN solveWithKociembaFile()\n";
}