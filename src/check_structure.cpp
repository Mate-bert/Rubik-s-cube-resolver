// check_structure.cpp corrigé
#include "check_structure.hpp"
#include "config.hpp"
#include "kociemba/CubeParser.hpp"
#include "kociemba/FaceletCube.hpp"
#include "kociemba/RubiksCube.hpp"
#include <fstream>
#include <iostream>
#include <unordered_map>
#include <algorithm>
#include <set>
#include <vector>
#include <string>
#include <sstream>

using namespace std;

namespace {
    // Vérifie si la structure du cube est valide
    bool isStructureValid(const std::vector<std::string>& lines) {
        CubeParser parser;
        FaceletCube faceletCube;
        RubiksCube cube;

        // Copie les lignes dans un tableau de chaînes
        std::string faces[6];
        std::copy(lines.begin(), lines.end(), faces);

        // Analyse les facelets du cube
        int result = parser.parseFacelets(faces, faceletCube);
        if (result != CubeParser::VALID) return false;

        // Valide la structure du cube
        result = faceletCube.Validate(cube);
        return result == FaceletCube::VALID;
    }

    // Lit les lignes du fichier Kociemba et les nettoie
    std::vector<std::string> readKociembaLines(const std::string& path) {
        std::ifstream file(path);
        std::string line;
        std::vector<std::string> lines;
        while (getline(file, line)) {
            // Supprime les guillemets et les virgules
            line.erase(remove(line.begin(), line.end(), '\"'), line.end());
            line.erase(remove(line.begin(), line.end(), ','), line.end());
            lines.push_back(line);
        }
        return lines;
    }

    // Sauvegarde les lignes corrigées dans un fichier
    void saveLines(const std::string& path, const std::vector<std::string>& lines) {
        std::ofstream out(path);
        for (const auto& line : lines) {
            // Ajoute des guillemets et des virgules pour le format Kociemba
            out << '\"' << line << '\"' << ',' << endl;
        }
    }
}

// Vérifie et corrige la structure Kociemba si nécessaire
bool checkAndFixKociembaStructure(const std::string& kociembaPath) {
    // Lit les lignes du fichier
    auto lines = readKociembaLines(kociembaPath);
    if (lines.size() != 6) return false; // Vérifie qu'il y a bien 6 faces

    // Compte le nombre d'occurrences de chaque couleur
    std::unordered_map<char, int> counts;
    for (const auto& line : lines) {
        for (char c : line.substr(2)) { // Ignore les deux premiers caractères
            if (c != '?') counts[c]++;
        }
    }

    // Liste des couleurs attendues
    std::set<char> expected = {'U','R','F','D','L','B'};
    std::vector<char> missing;

    // Vérifie quelles couleurs manquent
    for (char face : expected) {
        int diff = 9 - counts[face]; // Chaque face doit avoir 9 stickers
        if (diff > 0) missing.insert(missing.end(), diff, face);
    }

    // Si aucune couleur ne manque, la structure est valide
    if (missing.empty()) return true;

    // Vérifie si le nombre de '?' correspond au nombre de couleurs manquantes
    std::string flat;
    for (const auto& l : lines) {
        for (char c : l.substr(2)) flat += c;
    }
    int questionCount = std::count(flat.begin(), flat.end(), '?');

    if (questionCount != (int)missing.size()) return false; // Incohérence détectée

    // Essaie toutes les permutations possibles des couleurs manquantes
    std::sort(missing.begin(), missing.end());
    do {
        auto testLines = lines;
        int i = 0;
        for (auto& l : testLines) {
            for (char& c : l) {
                if (c == '?') c = missing[i++]; // Remplace les '?' par les couleurs manquantes
            }
        }

        // Vérifie si la structure corrigée est valide
        if (isStructureValid(testLines)) {
            std::cout << "✅ Structure du cube vérifiée et corrigée si besoin.\n";
            saveLines(kociembaPath, testLines); // Sauvegarde la structure corrigée
            return true;
        }
    } while (std::next_permutation(missing.begin(), missing.end()));

    // Si aucune permutation ne fonctionne, la correction est impossible
    std::cout << "❌ Structure invalide, correction impossible.\n";
    return false;
}