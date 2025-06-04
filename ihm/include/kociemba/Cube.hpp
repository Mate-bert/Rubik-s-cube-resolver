//
//  Cube.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-26.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef Cube_hpp
#define Cube_hpp

#define NUM_FACES 6

#include <string>

using namespace std;

class Cube {
public:
    // Emplacements des arêtes (EdgeCubies)
    enum EdgeCubie {
        // Emplacements des arêtes sur la face supérieure
        UF =  0, UL =  1, UB =  2, UR =  3,
        FU =  0, LU =  1, BU =  2, RU =  3,
        
        // Emplacements des arêtes sur la face inférieure
        DF =  4, DL =  5, DB =  6, DR =  7,
        FD =  4, LD =  5, BD =  6, RD =  7,
        
        // Emplacements des arêtes dans la tranche médiane
        RF =  8, FL =  9, LB = 10, BR = 11,
        FR =  8, LF =  9, BL = 10, RB = 11,
        
        // Définition des bornes pour les arêtes
        FirstEdgeCubie = UF,
        LastEdgeCubie = BR,
        FirstMiddleSliceEdgeCubie = RF,
        LastMiddleSliceEdgeCubie = BR,
        NumberOfEdgeCubies = LastEdgeCubie+1
    };
    
    // Emplacements des coins (CornerCubies)
    enum CornerCubie {
        // Emplacements des coins sur la face supérieure
        URF = 0, UFL = 1, ULB = 2, UBR = 3,
        RFU = 0, FLU = 1, LBU = 2, BRU = 3,
        FUR = 0, LUF = 1, BUL = 2, RUB = 3,
        
        // Emplacements des coins sur la face inférieure
        DFR = 4, DLF = 5, DBL = 6, DRB = 7,
        FRD = 4, LFD = 5, BLD = 6, RBD = 7,
        RDF = 4, FDL = 5, LDB = 6, BDR = 7,
        
        // Définition des bornes pour les coins
        FirstCornerCubie = URF,
        LastCornerCubie = DRB,
        NumberOfCornerCubies = LastCornerCubie+1
    };
    
    // Définitions générales pour les cubies
    enum Cubie {
        InvalidCubie = LastEdgeCubie+1 // Cubie invalide
    };
    
    // Définitions des twists (orientations des coins)
    enum Twists {
        NoQuark, Quark, AntiQuark, // Types de twists
        NumberOfTwists = AntiQuark+1
    };
    
    // Définitions des flips (orientations des arêtes)
    enum Flips {
        NotFlipped, Flipped // Non retourné ou retourné
    };
    
    // Définition des mouvements (quart de tour et demi-tour)
    enum Move {
        R,  L,  U,  D,  F,  B,   // Quart de tour dans le sens horaire
        Ri, Li, Ui, Di, Fi, Bi,  // Quart de tour dans le sens antihoraire
        R2, L2, U2, D2, F2, B2,  // Demi-tour
        
        FirstMove = R, // Premier mouvement
        LastMove = B2, // Dernier mouvement
        NumberOfClockwiseQuarterTurnMoves = B+1, // Nombre de quarts de tour dans le sens horaire
        NumberOfMoves = LastMove+1 // Nombre total de mouvements
    };
    
    // Constructeur/Destructeur
    Cube(); // Constructeur
    virtual ~Cube(); // Destructeur
    
    // Surcharge des opérateurs
    bool operator==(const Cube &cube); // Comparaison d'égalité
    bool operator!=(const Cube &cube); // Comparaison d'inégalité
    
    // Réinitialise le cube à la position de départ (HOME)
    virtual void BackToHome();
    
    // Définit l'état du cube à partir des permutations et orientations
    virtual void SetState(int* cornerPermutation, int* cornerOrientation, int* edgePermutation, int* edgeOrientation);
    
    // Applique un mouvement au cube
    virtual void ApplyMove(int move);
    
    // Renvoie l'inverse d'un mouvement
    inline static int InverseOfMove(int move) {
        return InverseMoves[move];
    }
    
    // Convertit un quart de tour en demi-tour
    inline static int QuarterTurnToHalfTurnMove(int move) {
        return R2+move%(B+1);
    }
    
    // Renvoie la face opposée d'un mouvement
    inline static int OpposingFace(int move) {
        return OppositeFaces[move];
    };
    
    // Renvoie le nom d'un mouvement
    inline static string NameOfMove(int move) {
        return MoveNames[move];
    }
    
    // Renvoie le mouvement correspondant à un nom de mouvement
    static int MoveNameToMove(string moveName, int &move);
    
    // Affiche l'état du cube
    virtual void Dump();
    
protected:
    // Implémentations des mouvements du cube
    void Move_R();
    void Move_L();
    void Move_U();
    void Move_D();
    void Move_F();
    void Move_B();
    void Move_Ri();
    void Move_Li();
    void Move_Ui();
    void Move_Di();
    void Move_Fi();
    void Move_Bi();
    void Move_R2();
    void Move_L2();
    void Move_U2();
    void Move_D2();
    void Move_F2();
    void Move_B2();
    
    // Cycle quatre arêtes
    void FourCycle(EdgeCubie first, EdgeCubie second, EdgeCubie third, EdgeCubie fourth);
    
    // Cycle quatre coins
    void FourCycle(CornerCubie first, CornerCubie second, CornerCubie third, CornerCubie fourth);
    
    // Cycle quatre éléments d'un vecteur
    void CycleFour(int *vector, int first, int second, int third, int fourth);
    
    // Retourne une arête
    void Flip(EdgeCubie cubie);
    
    // Twist des coins
    void ClockwiseTwist(CornerCubie cubie); // Twist dans le sens horaire
    void CounterClockwiseTwist(CornerCubie cubie); // Twist dans le sens antihoraire
    
    // Les cubies (coins et arêtes)
    int CornerCubiePermutations[NumberOfCornerCubies]; // Permutations des coins
    int CornerCubieOrientations[NumberOfCornerCubies]; // Orientations des coins
    
    int EdgeCubiePermutations[NumberOfEdgeCubies]; // Permutations des arêtes
    int EdgeCubieOrientations[NumberOfEdgeCubies]; // Orientations des arêtes
    
private:
    // Tables des twists
    static int ClockwiseTwists[NumberOfTwists]; // Twist dans le sens horaire
    static int CounterClockwiseTwists[NumberOfTwists]; // Twist dans le sens antihoraire
    
    // Noms des mouvements
    static string MoveNames[NumberOfMoves];
    
    // Inverse des mouvements
    static Cube::Move InverseMoves[NumberOfMoves];
    
    // Faces opposées
    static Cube::Move OppositeFaces[NumberOfMoves];
};

#endif /* Cube_hpp */
