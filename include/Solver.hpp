/*
//  Solver.hpp
//  Rubiks Cube Solver
//
//  Created by Morris Chen on 2017-07-27.
//  Copyright © 2017 Morris Chen. All rights reserved.
*/

#ifndef Solver_hpp
#define Solver_hpp

#include "KociMoveTables.hpp"
#include "RubiksCube.hpp"
#include "PruningTable.hpp"
#include <string>

class Solver {
public:
    Solver(void);
    ~Solver();

    // Initializes both the move mapping and pruning tables required
    void InitializeTables(void);

    // Perform the two phase search
    int Solve(RubiksCube &scrambledCube);

    // Solver return codes
    enum {
        NOT_FOUND,
        FOUND,
        OPTIMUM_FOUND,
        ABORT
    };

    // Output the solution
    void PrintSolution(void);

    // Get the best solution found so far as a string
    std::string GetBestSolution(void);

private:
    enum { Huge = 10000 };

    int Solve2(RubiksCube &cube);

    int Search1(int twist, int flip, int choice, int depth);
    int Search2(int cornerPermutation,
                int nonMiddleSliceEdgePermutation,
                int middleSliceEdgePermutation,
                int depth);

    int Phase1Cost(int twist, int flip, int choice);
    int Phase2Cost(int cornerPermutation,
                   int nonMiddleSliceEdgePermutation,
                   int middleSliceEdgePermutation);

    inline int Disallowed(int move, int* solutionMoves, int depth);
    int TranslateMove(int move, int power, int phase2);

    int nodes1, nodes2;
    int threshold1, threshold2;
    int newThreshold1, newThreshold2;

    int solutionMoves1[32], solutionMoves2[32];
    int solutionPowers1[32], solutionPowers2[32];
    int solutionLength1, solutionLength2;
    int minSolutionLength;

    RubiksCube cube;

    TwistMoveTable twistMoveTable;
    FlipMoveTable flipMoveTable;
    ChoiceMoveTable choiceMoveTable;

    CornerPermutationMoveTable cornerPermutationMoveTable;
    NonMiddleSliceEdgePermutationMoveTable nonMiddleSliceEdgePermutationMoveTable;
    MiddleSliceEdgePermutationMoveTable middleSliceEdgePermutationMoveTable;

    PruningTable TwistAndFlipPruningTable;
    PruningTable TwistAndChoicePruningTable;
    PruningTable FlipAndChoicePruningTable;

    PruningTable CornerAndSlicePruningTable;
    PruningTable EdgeAndSlicePruningTable;

    // Store the best solution found so far
    std::string bestSoFar;
};

#endif /* Solver_hpp */
