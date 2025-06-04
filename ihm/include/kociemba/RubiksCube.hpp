//
//  RubiksCube.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-26.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef RubiksCube_hpp
#define RubiksCube_hpp

#include "Cube.hpp"

// Définition de la macro KOCIEMBA pour choisir l'approche de Kociemba
// Si cette macro est commentée, l'approche de Dik Winter sera utilisée.
// Si vous changez cette macro, assurez-vous de régénérer les tables impliquant "choice".
#define KOCIEMBA

// Classe RubiksCube héritant de Cube
class RubiksCube : public Cube {
public:
    // Enumération pour définir le nombre de possibilités pour chaque axe des deux triplets
    enum {
        Twists = (3*3*3*3*3*3*3), // 3^7 = 2187 (orientations des coins)
        Flips = (2*2*2*2*2*2*2*2*2*2*2), // 2^11 = 2048 (orientations des arêtes)
        Choices = 495, // 12 parmi 4 = 495 (positions des arêtes de la tranche médiane)
        CornerPermutations = (8*7*6*5*4*3*2*1), // 8! = 40320 (permutations des coins)
        NonMiddleSliceEdgePermutations = (8*7*6*5*4*3*2*1), // 8! = 40320 (permutations des arêtes hors tranche médiane)
        MiddleSliceEdgePermutations = (4*3*2*1) // 4! = 24 (permutations des arêtes de la tranche médiane)
    };
    
    // Constructeur et destructeur
    RubiksCube();
    ~RubiksCube();
    
    // Phase 1 : Triplet pour les orientations et choix
    
    // Orientation des coins (3^7 = 2187)
    int Twist(); // Récupère l'orientation des coins
    void Twist(int twist); // Définit l'orientation des coins
    
    // Orientation des arêtes (2^11 = 2048)
    int Flip(); // Récupère l'orientation des arêtes
    void Flip(int flip); // Définit l'orientation des arêtes
    
    // Positions des 4 arêtes de la tranche médiane (12 parmi 4 = 495)
    int Choice(); // Récupère le choix des arêtes
    void Choice(int choice); // Définit le choix des arêtes
    
    // Phase 2 : Triplet pour les permutations
    
    // Permutation des 8 coins (8! = 40320)
    int CornerPermutation(); // Récupère la permutation des coins
    void CornerPermutation(int ordinal); // Définit la permutation des coins
    
    // Permutation des 8 arêtes hors tranche médiane (8! = 40320)
    int NonMiddleSliceEdgePermutation(); // Récupère la permutation des arêtes hors tranche médiane
    void NonMiddleSliceEdgePermutation(int ordinal); // Définit la permutation des arêtes hors tranche médiane
    
    // Permutation des 4 arêtes de la tranche médiane (4! = 24)
    int MiddleSliceEdgePermutation(); // Récupère la permutation des arêtes de la tranche médiane
    void MiddleSliceEdgePermutation(int ordinal); // Définit la permutation des arêtes de la tranche médiane
    
private:
    // Enumération pour des constantes internes
    enum {
        // Nombre encodé sur 12 bits, 1 bit pour chaque arête
        NumberOfEncodedChoicePermutations = 4096,
        // 12 parmi 4 arêtes
        NumberOfChoiceOrdinals = 495
    };
    
    // Détermine si un cubie est une arête de la tranche médiane
    static int IsMiddleSliceEdgeCubie(int cubie);
    
#ifdef KOCIEMBA
    // Méthodes pour calculer l'ordinal du choix à partir de la permutation
    static int ChoiceOrdinal(int* choicePermutation);
    
    // Méthodes pour calculer la permutation du choix à partir de l'ordinal
    static void ChoicePermutation(int choiceOrdinal, int* choicePermutation);
    
#else // Méthode de Dik Winter
    // Approche alternative pour les méthodes ci-dessus
    static int ChoiceOrdinal(int* choicePermutation);
    static void ChoicePermutation(int choiceOrdinal, int* choicePermutation);
    
    // Initialisation des données pour la méthode de Dik Winter
    static void InitializeChoice();
    static int CountBits(int value); // Compte le nombre de bits à 1 dans une valeur
    static void DecodeChoicePermutation(int encodedChoicePermutation, int* decodedChoicePermutation);
    
    // Tableaux pour mapper les permutations encodées et les ordinals
    static int EncodedChoicePermutationToChoiceOrdinal[NumberOfEncodedChoicePermutations];
    static int ChoiceOrdinalToEncodedChoicePermutation[NumberOfChoiceOrdinals];
    static unsigned int BitNumberToBitMask[12]; // Mappe un numéro de bit à un masque de bit
#endif // KOCIEMBA
    
};

#endif /* RubiksCube_hpp */
