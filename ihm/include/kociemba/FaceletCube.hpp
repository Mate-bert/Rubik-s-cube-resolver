//
//  FaceletCube.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-26.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef FaceletCube_hpp
#define FaceletCube_hpp

//
// FaceletCube utilise les 54 facettes individuelles pour représenter le cube.
// FaceletCube peut ensuite être utilisé pour valider le cube afin de déterminer
// s'il est dans une configuration légale et donc solvable.
//

#include "Cube.hpp"

#include <string>

#define FACELETS_PER_FACE 9 // Nombre de facettes par face
#define NUM_FACELETS (NUM_FACES * FACELETS_PER_FACE) // Nombre total de facettes

// Les macros suivantes sont utilisées pour construire un numéro unique
// pour chaque coin et chaque arête à partir de leurs facettes.

#define FacesToCorner(face1, face2, face3) (((face1*6)+face2)*6+face3) // Génère un identifiant unique pour un coin
#define FacesToEdge(face1, face2) (face1*6+face2) // Génère un identifiant unique pour une arête

using namespace std;

class FaceletCube {
public:
    // Noms des faces
    enum Face { U, D, L, R, F, B }; // U = Haut, D = Bas, L = Gauche, R = Droite, F = Avant, B = Arrière
    
    // Codes de retour pour la validation
    enum {
        VALID, // Configuration valide
        INVALID_MARKER, // Marqueur invalide
        INVALID_FACELETCOUNT, // Nombre de facettes invalide
        DUPLICATE_CENTER_MARKING, // Marquage du centre dupliqué
        INVALID_CORNER_MARKINGS, // Marquages des coins invalides
        INVALID_CORNER_PARITY, // Parité des coins invalide
        INVALID_EDGE_MARKINGS, // Marquages des arêtes invalides
        INVALID_EDGE_PARITY, // Parité des arêtes invalide
        INVALID_TOTAL_PARITY, // Parité totale invalide
        NumberOfErrors // Nombre total d'erreurs possibles
    };
    
    FaceletCube(); // Constructeur
    ~FaceletCube(); // Destructeur
    
    // Définit les marquages pour une face donnée
    void SetFaceMarkings(int face, string faceMarkings);
    
    // Valide les marquages, la permutation et la parité
    int Validate(Cube &cube);
    
    // Convertit un nom de face en un décalage d'énumération
    int FaceNameToOffset(char faceName);
    
    // Retourne le texte associé à un code d'erreur
    string ErrorText(unsigned int error);
    
    // Affiche l'état du cube
    void Dump();
    
private:
    // Associe chaque facette de coin à un numéro unique de coin
    enum Corner {
        URF = FacesToCorner(U,R,F),
        RFU = FacesToCorner(R,F,U),
        FUR = FacesToCorner(F,U,R),
        
        UFL = FacesToCorner(U,F,L),
        FLU = FacesToCorner(F,L,U),
        LUF = FacesToCorner(L,U,F),
        
        ULB = FacesToCorner(U,L,B),
        LBU = FacesToCorner(L,B,U),
        BUL = FacesToCorner(B,U,L),
        
        UBR = FacesToCorner(U,B,R),
        BRU = FacesToCorner(B,R,U),
        RUB = FacesToCorner(R,U,B),
        
        DFR = FacesToCorner(D,F,R),
        FRD = FacesToCorner(F,R,D),
        RDF = FacesToCorner(R,D,F),
        
        DLF = FacesToCorner(D,L,F),
        LFD = FacesToCorner(L,F,D),
        FDL = FacesToCorner(F,D,L),
        
        DBL = FacesToCorner(D,B,L),
        BLD = FacesToCorner(B,L,D),
        LDB = FacesToCorner(L,D,B),
        
        DRB = FacesToCorner(D,R,B),
        RBD = FacesToCorner(R,B,D),
        BDR = FacesToCorner(B,D,R)
    };
    
    // Associe chaque facette d'arête à un numéro unique d'arête
    enum Edge {
        UF = FacesToEdge(U,F),
        FU = FacesToEdge(F,U),
        
        UL = FacesToEdge(U,L),
        LU = FacesToEdge(L,U),
        
        UB = FacesToEdge(U,B),
        BU = FacesToEdge(B,U),
        
        UR = FacesToEdge(U,R),
        RU = FacesToEdge(R,U),
        
        DF = FacesToEdge(D,F),
        FD = FacesToEdge(F,D),
        
        DL = FacesToEdge(D,L),
        LD = FacesToEdge(L,D),
        
        DB = FacesToEdge(D,B),
        BD = FacesToEdge(B,D),
        
        DR = FacesToEdge(D,R),
        RD = FacesToEdge(R,D),
        
        RF = FacesToEdge(R,F),
        FR = FacesToEdge(F,R),
        
        LF = FacesToEdge(L,F),
        FL = FacesToEdge(F,L),
        
        LB = FacesToEdge(L,B),
        BL = FacesToEdge(B,L),
        
        RB = FacesToEdge(R,B),
        BR = FacesToEdge(B,R)
    };
    
    // Sous-fonctions de validation
    int ValidateCenters(); // Valide les centres
    int ValidateFacelets(); // Valide les facettes
    int ValidateCorners(); // Valide les coins
    int ValidateEdges(); // Valide les arêtes
    int EdgePermutationParity(); // Vérifie la parité des permutations des arêtes
    int CornerPermutationParity(); // Vérifie la parité des permutations des coins
    int PermutationParity(int* permutations, int numberOfCubies); // Vérifie la parité des permutations
    int FaceletOffsetToMarking(int offset); // Convertit un décalage de facette en marquage
    
    // Les 9 marquages pour chacune des 6 faces
    char faceletMarkings[NUM_FACELETS];
    // Marquages associés à chaque face
    char faceMarkings[NUM_FACES+1];
    
    // Données statiques pour les facettes des coins et des arêtes
    static int cornerFacelets[Cube::NumberOfCornerCubies][3];
    static Corner cornerMap[Cube::NumberOfCornerCubies*3];
    
    static int edgeFacelets[Cube::NumberOfEdgeCubies][2];
    static Edge edgeMap[Cube::NumberOfEdgeCubies*2];
    
    // Permutations et orientations des cubies résultants
    int cornerCubiePermutations[Cube::NumberOfCornerCubies];
    int cornerCubieOrientations[Cube::NumberOfCornerCubies];
    
    int edgeCubiePermutations[Cube::NumberOfEdgeCubies];
    int edgeCubieOrientations[Cube::NumberOfEdgeCubies];
    
    // Texte associé aux erreurs
    static string errorText[NumberOfErrors];
};

#endif /* FaceletCube_hpp */