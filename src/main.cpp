#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
#include <chrono>
#include <future>
#include "CubeParser.hpp"
#include "FaceletCube.hpp"
#include "RubiksCube.hpp"
#include "Solver.hpp"

using namespace std;
using namespace std::chrono;

vector<string> encodeRubikMove(const string& move) {
    if (move.empty() || move == "LAST") return {"LAST"};

    char moveChar = move[0];
    bool isPrime = (move.find('\'') != string::npos);
    bool isDouble = (move.find('2') != string::npos);

    string baseCode;
    switch(moveChar) {
        case 'R': baseCode = isPrime ? "0011" : "1011"; break;
        case 'F': baseCode = isPrime ? "0010" : "1010"; break;
        case 'U': baseCode = isPrime ? "0001" : "1001"; break;
        case 'L': baseCode = isPrime ? "0100" : "1100"; break;
        case 'D': baseCode = isPrime ? "0110" : "1110"; break;
        case 'B': baseCode = isPrime ? "0101" : "1101"; break;
        default: return {"LAST"};
    }

    if (isDouble) return {baseCode, baseCode};
    return {baseCode};
}

vector<string> parseMoveSequence(const string& sequence) {
    vector<string> moves;
    stringstream ss(sequence);
    string move;

    while (ss >> move) {
        if (move == ".") continue;

        if (move.find('2') != string::npos) {
            string baseMove = move;
            baseMove.erase(remove(baseMove.begin(), baseMove.end(), '2'), baseMove.end());
            moves.push_back(baseMove);
            moves.push_back(baseMove);
        } else {
            moves.push_back(move);
        }
    }

    moves.push_back("LAST");
    return moves;
}

int main(int argc, char *argv[]) {
    unsigned int status;

    string faceletStrings[6] = {
        "U:RWGGWRWWW", "D:YBGGYYBOW", "F:RRROBYRWW", "B:OOYOGROYY", "L:GWBGOBOYB", "R:GBYRRGOBB"
    };

    FaceletCube faceletCube;
    CubeParser cubeParser;
    if ((status = cubeParser.parseFacelets(faceletStrings, faceletCube)) != CubeParser::VALID) {
        cout << cubeParser.ErrorText(status) << endl;
        return 1;
    }

    RubiksCube cube;
    if ((status = faceletCube.Validate(cube)) != FaceletCube::VALID) {
        cout << faceletCube.ErrorText(status) << endl;
        return 1;
    }

    Solver solver;
    solver.InitializeTables();

    // Exécution du solveur dans un thread séparé
    auto future = std::async(std::launch::async, [&] {
        solver.Solve(cube);
    });

    // Attente pendant 3 secondes maximum
    future.wait_for(std::chrono::seconds(3));

    // Récupération de la meilleure solution réelle trouvée
    string bestSolution = solver.GetBestSolution();

    if (bestSolution.empty()) {
        cout << "Aucune solution trouvée dans les temps." << endl;
        return 0;
    }

    cout << "\nTemps écoulé. Voici la dernière solution trouvée :\n";
    cout << bestSolution << endl;

    cout << "\nEncodage binaire :\n";
    cout << "------------------\n";

    vector<string> moves = parseMoveSequence(bestSolution);
    for (const auto& move : moves) {
        vector<string> codes = encodeRubikMove(move);
        cout << move << ":\t";
        for (const auto& code : codes) {
            cout << code << " ";
        }
        cout << endl;
    }

    return 0;
}
