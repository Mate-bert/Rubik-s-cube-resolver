#ifndef CHECK_STRUCTURE_HPP
#define CHECK_STRUCTURE_HPP

#include <string>

// Déclaration de la fonction checkAndFixKociembaStructure
// Cette fonction vérifie la structure d'un cube Rubik's à partir d'un fichier texte (kociemba.txt).
// Elle tente de corriger les erreurs simples, comme des lettres manquantes, si cela est possible.
// Elle retourne true si la structure est valide ou si elle a été corrigée avec succès.
// Paramètre :
// - kociembaPath : chemin vers le fichier kociemba.txt contenant la description du cube.
bool checkAndFixKociembaStructure(const std::string& kociembaPath);

#endif // CHECK_STRUCTURE_HPP