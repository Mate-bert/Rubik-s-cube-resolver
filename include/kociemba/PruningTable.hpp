//
//  PruningTable.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-27.
//  Copyright © 2017 Morris Chen. All rights reserved.
//

#ifndef PruningTable_hpp
#define PruningTable_hpp

//
// Construit une table de pruning (élagage) à partir d'une paire de tables de mouvements.
// La table de pruning contient une entrée correspondant à chaque paire possible d'entrées
// des deux tables de mouvements. Le nombre d'entrées dans la table de pruning est donc
// le produit du nombre d'entrées des deux tables de mouvements. Une recherche en largeur
// est effectuée jusqu'à ce que la table soit remplie. Chaque entrée de la table contient
// le nombre minimal de mouvements nécessaires pour atteindre une configuration particulière
// à partir de la configuration initiale du cube. Ces distances minimales constituent une
// heuristique admissible, ce qui garantit qu'une recherche comme IDA* trouve une solution
// optimale (le nombre minimal de mouvements possible).
//

#include <fstream>

#include "MoveTable.hpp"

using namespace std;

class PruningTable {
public:
    // Constructeur - Nécessite une paire de tables de mouvements et les ordinals
    // associés correspondant à la configuration "initiale" du cube.
    // Les ordinals initiaux correspondent au nœud racine de la recherche.
    PruningTable(MoveTable& moveTable1, MoveTable& moveTable2, int homeOrdinal1, int homeOrdinal2);
    
    ~PruningTable();
    
    // Initialise la table de pruning en la générant ou en la chargeant depuis un fichier existant
    void Initialize(char* fileName);
    
    // Convertit un index de la table de pruning en une paire d'indices des tables de mouvements
    void PruningTableIndexToMoveTableIndices(int index, int &ordinal1, int &ordinal2);
    
    // Convertit une paire d'indices des tables de mouvements en un index de la table de pruning
    int MoveTableIndicesToPruningTableIndex(int ordinal1, int ordinal2);
    
    // Récupère une valeur de la table de pruning correspondant à l'index spécifié
    unsigned int GetValue(int index);
    
    // Définit une valeur dans la table de pruning à l'index spécifié
    void SetValue(int index, unsigned int value);
    
    // Obtient la taille de la table (nombre d'entrées logiques)
    int SizeOf(void) { return TableSize; }
    
    // Affiche le contenu de la table
    void Dump(void);
    
private:
    enum { Empty = 0x0f };	// Valeur représentant une entrée vide dans la table
    
    // Génère la table en utilisant une recherche en largeur
    void Generate(void);
    // Sauvegarde la table dans un fichier
    void Save(char* fileName);
    // Charge la table depuis un fichier
    void Load(ifstream& infile);
    
    // Copies des variables importantes
    MoveTable& MoveTable1; // Référence à la première table de mouvements
    MoveTable& MoveTable2; // Référence à la deuxième table de mouvements
    int HomeOrdinal1;      // Ordinal initial pour la première table
    int HomeOrdinal2;      // Ordinal initial pour la deuxième table
    int MoveTable1Size;    // Taille de la première table de mouvements
    int MoveTable2Size;    // Taille de la deuxième table de mouvements
    
    // Nombre d'entrées dans la table de pruning
    int TableSize;
    // Taille réelle, en octets, allouée pour la table
    int AllocationSize;
    // Pointeur vers la table
    unsigned char* Table;
    
    // Tables pour gérer le packing/unpacking des nybbles (demi-octets)
    static unsigned int OffsetToEntryMask[2];    // Masques pour extraire les nybbles
    static unsigned int OffsetToShiftCount[2];  // Décalages pour accéder aux nybbles
};

#endif /* PruningTable_hpp */
