//
//  MoveTable.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-27.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef MoveTable_hpp
#define MoveTable_hpp

#include "Cube.hpp"

#include <fstream>

using namespace std;

class MoveTable {
public:
    // Le constructeur prend un cube à manipuler pour générer la table,
    // la taille de la table (nombre d'entrées), et un indicateur pour
    // savoir si la table est une table de phase 2. Si c'est une table
    // de phase 2, seuls les quarts de tour sont autorisés pour F, B, L et R.
    MoveTable(Cube &cube, int tableSize, int phase2=0);
    
    // Destructeur virtuel
    virtual ~MoveTable();
    
    // Initialise la table de mouvements en la générant ou en la chargeant
    // depuis un fichier existant
    virtual void Initialize(char* fileName);
    
    // Surcharge de l'opérateur de sous-indice pour permettre un accès
    // standard en C++ (par exemple, MoveTable[i][j]) aux valeurs de la table.
    virtual int* operator[](int index);
    
    // Retourne la taille de la table (nombre d'entrées logiques)
    virtual int SizeOf() { return TableSize; }
    
    // Affiche le contenu de la table
    virtual void Dump();
    
protected:
    // Ces fonctions doivent être surchargées dans une classe dérivée
    // pour fournir le mappage approprié entre un ordinal et l'état du cube.
    virtual int OrdinalFromCubeState() = 0; // Convertit l'état du cube en un ordinal
    virtual void OrdinalToCubeState(int ordinal) = 0; // Convertit un ordinal en état du cube
    
private:
    // Génère la table de mouvements
    void Generate();
    // Sauvegarde la table dans un fichier
    void Save(char* fileName);
    // Charge la table depuis un fichier
    void Load(ifstream& infile);
    
    // Copie des variables importantes
    Cube& TheCube; // Référence au cube manipulé
    int TableSize; // Nombre d'entrées dans la table de mouvements
    int Phase2; // Indicateur pour la phase 2
    // Pointeur vers la table de mouvements
    int (*Table)[Cube::Move::NumberOfClockwiseQuarterTurnMoves];
};

#endif /* MoveTable_hpp */
