//
//  Solver.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-27.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef Solver_hpp
#define Solver_hpp

//
// Cette classe effectue une recherche en deux phases avec l'algorithme IDA*
// pour trouver une solution au Rubik's Cube mélangé.
//
// Phase 1 : Recherche dans le groupe engendré par <U,D,R,L,F,B> jusqu'à ce
// qu'une configuration soit trouvée où les trois coordonnées (twist, flip,
// choice) sont "correctes" par rapport à un cube résolu.
//
// Phase 2 : Utilise la configuration trouvée en phase 1 comme point de départ
// pour une recherche dans le groupe engendré par <U,D,R2,L2,F2,B2>, avec pour
// objectif d'atteindre l'identité (le cube résolu).
//

#include "KociMoveTables.hpp"
#include "RubiksCube.hpp"
#include "PruningTable.hpp"

class Solver {
public:
    Solver(void);  // Constructeur
    ~Solver();     // Destructeur
    
    // Initialise les tables de mouvements et de pruning nécessaires à la recherche
    void InitializeTables(void);
    
    // Effectue la recherche en deux phases
    int Solve(RubiksCube &scrambledCube);
    
    // Codes de retour pour la méthode Solve
    enum {
        NOT_FOUND,       // Solution non trouvée
        FOUND,           // Solution trouvée
        OPTIMUM_FOUND,   // Solution optimale trouvée
        ABORT            // Recherche abandonnée (phase 2 n'a pas amélioré la solution)
    };
    
    // Affiche la solution trouvée
    // Note : cette méthode peut ne pas être nécessaire car la meilleure solution
    // trouvée jusqu'à présent est affichée pendant la recherche
    void PrintSolution(void);
    
private:
    enum { Huge = 10000 };  // Une valeur arbitrairement grande
    
    // Lance la deuxième phase de la recherche
    int Solve2(RubiksCube &cube);
    
    // Méthodes récursives pour la recherche IDA* en phase 1 et phase 2
    int Search1(int twist, int flip, int choice, int depth);
    int Search2(
                int cornerPermutation,
                int nonMiddleSliceEdgePermutation,
                int middleSliceEdgePermutation,
                int depth);
    
    // Heuristiques de coût pour les phases 1 et 2
    int Phase1Cost(int twist, int flip, int choice);
    int Phase2Cost(
                   int cornerPermutation,
                   int nonMiddleSliceEdgePermutation,
                   int middleSliceEdgePermutation);
    
    // Vérifie si un mouvement est redondant (et donc doit être ignoré)
    inline int Disallowed(int move, int* solutionMoves, int depth);
    
    // Traduit les mouvements d'une représentation (face, puissance) à une
    // représentation sous forme de chaîne de caractères (par exemple, R,3 devient R').
    int TranslateMove(int move, int power, int phase2);
    
    // Variables de recherche pour l'algorithme IDA* en deux phases
    int nodes1, nodes2;  // Nombre de nœuds explorés
    int threshold1, threshold2;  // Seuil heuristique actuel
    int newThreshold1, newThreshold2;  // Nouveau seuil déterminé par la recherche en cours
    
    int solutionMoves1[32], solutionMoves2[32];  // Liste des mouvements appliqués
    int solutionPowers1[32], solutionPowers2[32];  // Liste des puissances associées à chaque mouvement
    int solutionLength1, solutionLength2;  // Longueur de chaque solution
    int minSolutionLength;  // Longueur minimale de solution trouvée jusqu'à présent
    
    // Un cube utilisé pour deux objectifs :
    // 1- Initialement utilisé pour initialiser les tables de mouvements
    // 2- Contient une copie du cube mélangé utilisée pour calculer les coordonnées
    //    initiales de la phase 2.
    RubiksCube cube;
    
    // Tables de mouvements pour la phase 1
    TwistMoveTable twistMoveTable;
    FlipMoveTable flipMoveTable;
    ChoiceMoveTable choiceMoveTable;
    // Tables de mouvements pour la phase 2
    CornerPermutationMoveTable cornerPermutationMoveTable;
    NonMiddleSliceEdgePermutationMoveTable nonMiddleSliceEdgePermutationMoveTable;
    MiddleSliceEdgePermutationMoveTable middleSliceEdgePermutationMoveTable;
    
    // Tables de pruning pour la phase 1
    PruningTable TwistAndFlipPruningTable;
    PruningTable TwistAndChoicePruningTable;
    PruningTable FlipAndChoicePruningTable;
    // Tables de pruning pour la phase 2
    PruningTable CornerAndSlicePruningTable;
    PruningTable EdgeAndSlicePruningTable;

    // Meilleures solutions trouvées jusqu'à présent
    int bestSolutionMoves1[32], bestSolutionPowers1[32], bestLength1;
    int bestSolutionMoves2[32], bestSolutionPowers2[32], bestLength2;
};

#endif /* Solver_hpp */
