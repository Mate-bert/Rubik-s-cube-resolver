//
//  CubeParser.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-26.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef CubeParser_hpp
#define CubeParser_hpp

//
// Analyseur de l'état du cube passé en ligne de commande.
// Vérifie les erreurs de syntaxe grossières. Par exemple :
// - Les 9 marquages de facettes pour chacune des six faces doivent être spécifiés.
// - Les marquages doivent être des caractères ASCII imprimables.
// Si l'analyse réussit, un "FaceletCube" est initialisé.
// Le FaceletCube représente le cube par les marquages des 54 facettes individuelles.
// Le FaceletCube peut ensuite être validé pour déterminer si le cube est dans une
// configuration légale et donc résoluble.
//

#include "FaceletCube.hpp"

#include <string>

using namespace std;

class CubeParser {
public:
    // Codes de retour de l'analyseur
    enum {
        VALID,               // L'entrée est valide
        INVALID_FACE,        // Une face est invalide
        INVALID_MARKER,      // Un marquage est invalide
        INCOMPLETE_INPUT,    // L'entrée est incomplète
        SYNTAX_ERROR,        // Erreur de syntaxe
        NumberOfErrors       // Nombre total de types d'erreurs
    };
    
    CubeParser();  // Constructeur
    ~CubeParser(); // Destructeur
    
    // Analyse les facettes en entrée et initialise un FaceletCube
    int parseFacelets(string faceletStrings[], FaceletCube &faceletCube);
    
    // Retourne le texte associé à un code d'erreur
    string ErrorText(unsigned int error);
    
private:
    // Analyse une face spécifique et initialise le FaceletCube
    int parseFace(FaceletCube &faceletCube, string faceString, int &face);
    
    // Tableau statique contenant les messages d'erreur associés aux codes d'erreur
    static string errorText[NumberOfErrors];
};

#endif /* CubeParser_hpp */
