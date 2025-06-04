//
//  KociMoveTables.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-27.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef KociMoveTables_hpp
#define KociMoveTables_hpp

//
// Sous-classes de "MoveTable" pour chaque table de mouvements
// utilisée dans l'algorithme de Kociemba. Les fonctions pour
// convertir entre un ordinal et son état de cube associé sont
// spécifiées pour chaque classe via des surcharges.
//

#include "MoveTable.hpp"
#include "RubiksCube.hpp"

// Classes de tables de mouvements pour la phase 1

// Table de mouvements pour les twists (rotations des coins)
class TwistMoveTable : public MoveTable {
public:
    // Constructeur : initialise la table de mouvements pour les twists
    TwistMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::Twists, 0),
          TheCube(cube) {}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.Twist(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.Twist(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

// Table de mouvements pour les flips (inversions des arêtes)
class FlipMoveTable : public MoveTable
{
public:
    // Constructeur : initialise la table de mouvements pour les flips
    FlipMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::Flips, 0),
          TheCube(cube) {}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.Flip(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.Flip(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

// Table de mouvements pour les choix (combinaisons d'arêtes)
class ChoiceMoveTable : public MoveTable
{
public:
    // Constructeur : initialise la table de mouvements pour les choix
    ChoiceMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::Choices, 0),
          TheCube(cube) {}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.Choice(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.Choice(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

// Classes de tables de mouvements pour la phase 2

// Table de mouvements pour les permutations des coins
class CornerPermutationMoveTable : public MoveTable
{
public:
    // Constructeur : initialise la table de mouvements pour les permutations des coins
    CornerPermutationMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::CornerPermutations, 1),
          TheCube(cube) {}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.CornerPermutation(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.CornerPermutation(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

// Table de mouvements pour les permutations des arêtes hors tranche du milieu
class NonMiddleSliceEdgePermutationMoveTable : public MoveTable
{
public:
    // Constructeur : initialise la table de mouvements pour ces permutations
    NonMiddleSliceEdgePermutationMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::NonMiddleSliceEdgePermutations, 1),
          TheCube(cube) {}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.NonMiddleSliceEdgePermutation(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.NonMiddleSliceEdgePermutation(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

// Table de mouvements pour les permutations des arêtes de la tranche du milieu
class MiddleSliceEdgePermutationMoveTable : public MoveTable
{
public:
    // Constructeur : initialise la table de mouvements pour ces permutations
    MiddleSliceEdgePermutationMoveTable(RubiksCube& cube)
    : MoveTable(cube, RubiksCube::MiddleSliceEdgePermutations, 1),
          TheCube(cube)	{}
private:
    // Convertit l'état du cube en un ordinal
    inline int  OrdinalFromCubeState(void)
    { return TheCube.MiddleSliceEdgePermutation(); }
    // Convertit un ordinal en état du cube
    inline void OrdinalToCubeState(int ordinal)
    { TheCube.MiddleSliceEdgePermutation(ordinal); }
    RubiksCube& TheCube; // Référence au cube Rubik
};

#endif /* KociMoveTables_hpp */
