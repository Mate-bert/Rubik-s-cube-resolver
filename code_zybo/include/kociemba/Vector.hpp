//
//  Vector.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-26.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef Vector_hpp
#define Vector_hpp

// Déclaration des routines de manipulation de vecteurs

// Copie les éléments d'un vecteur source (fromVector) vers un vecteur destination (toVector)
// Paramètres :
// - fromVector : pointeur vers le vecteur source
// - toVector : pointeur vers le vecteur destination
// - n : nombre d'éléments à copier
void CopyVector(int *fromVector, int *toVector, int n);

// Affiche les éléments d'un vecteur
// Paramètres :
// - vector : pointeur vers le vecteur à afficher
// - n : nombre d'éléments dans le vecteur
void PrintVector(int *vector, int n);

#endif /* Vector_hpp */
