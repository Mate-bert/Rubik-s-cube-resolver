//
//  Combinatorics.hpp
//  Rubiks Cube Solver
//
//  Créé par Morris Chen le 27-07-2017.
//  Copyright © 2017 Morris Chen. Tous droits réservés.
//

#ifndef Combinatorics_hpp
#define Combinatorics_hpp

// Algorithmes combinatoires

/**
 * @brief Calcule le nombre de combinaisons (N parmi M).
 * 
 * Cette fonction calcule le nombre de façons de choisir M éléments parmi un ensemble de N éléments,
 * sans tenir compte de l'ordre de sélection.
 * 
 * @param N Le nombre total d'éléments.
 * @param M Le nombre d'éléments à choisir.
 * @return Le nombre de combinaisons.
 */
int NChooseM(int N, int M);

/**
 * @brief Convertit une permutation en sa valeur ordinale.
 * 
 * Cette fonction associe une permutation donnée d'entiers à une valeur ordinale unique
 * qui représente sa position dans l'ordre lexicographique de toutes les permutations.
 * 
 * @param vector Un tableau représentant la permutation.
 * @param n La taille du tableau de permutation.
 * @return La valeur ordinale de la permutation.
 */
int PermutationToOrdinal(int *vector, int n);

/**
 * @brief Convertit une valeur ordinale en une permutation.
 * 
 * Cette fonction génère une permutation correspondant à une valeur ordinale donnée
 * dans l'ordre lexicographique de toutes les permutations.
 * 
 * @param Ordinal La valeur ordinale de la permutation.
 * @param vector Un tableau pour stocker la permutation résultante.
 * @param n La taille du tableau de permutation.
 * @param offset La valeur de départ pour les éléments de la permutation (par exemple, 0 ou 1).
 */
void OrdinalToPermutation(int Ordinal, int* vector, int n, int offset);

#endif /* Combinatorics_hpp */
