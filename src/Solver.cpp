//
//  Solver.cpp
//  Rubiks Cube Solver
//
//  Modified to store and retrieve the best solution string.
//

#include "Solver.hpp"
#include <iostream>
#include <sstream>

using namespace std;

Solver::Solver(void)
: twistMoveTable(cube), flipMoveTable(cube), choiceMoveTable(cube),
  cornerPermutationMoveTable(cube), nonMiddleSliceEdgePermutationMoveTable(cube), middleSliceEdgePermutationMoveTable(cube),
  TwistAndFlipPruningTable(twistMoveTable, flipMoveTable, cube.Twist(), cube.Flip()),
  TwistAndChoicePruningTable(twistMoveTable, choiceMoveTable, cube.Twist(), cube.Choice()),
  FlipAndChoicePruningTable(flipMoveTable, choiceMoveTable, cube.Flip(), cube.Choice()),
  CornerAndSlicePruningTable(cornerPermutationMoveTable, middleSliceEdgePermutationMoveTable, cube.CornerPermutation(), cube.MiddleSliceEdgePermutation()),
  EdgeAndSlicePruningTable(nonMiddleSliceEdgePermutationMoveTable, middleSliceEdgePermutationMoveTable, cube.NonMiddleSliceEdgePermutation(), cube.MiddleSliceEdgePermutation()),
  bestSoFar("")
{
    minSolutionLength = Huge;
}

Solver::~Solver() {}

void Solver::InitializeTables(void) {
    cout << "Initializing TwistMoveTable" << endl;
    twistMoveTable.Initialize("Twist.mtb");
    cout << "Size = " << twistMoveTable.SizeOf() << endl;

    cout << "Initializing FlipMoveTable" << endl;
    flipMoveTable.Initialize("Flip.mtb");
    cout << "Size = " << flipMoveTable.SizeOf() << endl;

    cout << "Initializing ChoiceMoveTable" << endl;
    choiceMoveTable.Initialize("Choice.mtb");
    cout << "Size = " << choiceMoveTable.SizeOf() << endl;

    cout << "Initializing CornerPermutationMoveTable" << endl;
    cornerPermutationMoveTable.Initialize("CrnrPerm.mtb");
    cout << "Size = " << cornerPermutationMoveTable.SizeOf() << endl;

    cout << "Initializing NonMiddleSliceEdgePermutationMoveTable" << endl;
    nonMiddleSliceEdgePermutationMoveTable.Initialize("EdgePerm.mtb");
    cout << "Size = " << nonMiddleSliceEdgePermutationMoveTable.SizeOf() << endl;

    cout << "Initializing MiddleSliceEdgePermutationMoveTable" << endl;
    middleSliceEdgePermutationMoveTable.Initialize("SlicPerm.mtb");
    cout << "Size = " << middleSliceEdgePermutationMoveTable.SizeOf() << endl;

    cout << "Initializing TwistAndFlipPruningTable" << endl;
    TwistAndFlipPruningTable.Initialize("TwstFlip.ptb");
    cout << "Size = " << TwistAndFlipPruningTable.SizeOf() << endl;

    cout << "Initializing TwistAndChoicePruningTable" << endl;
    TwistAndChoicePruningTable.Initialize("TwstChce.ptb");
    cout << "Size = " << TwistAndChoicePruningTable.SizeOf() << endl;

    cout << "Initializing FlipAndChoicePruningTable" << endl;
    FlipAndChoicePruningTable.Initialize("FlipChce.ptb");
    cout << "Size = " << FlipAndChoicePruningTable.SizeOf() << endl;

    cout << "Initializing CornerAndSlicePruningTable" << endl;
    CornerAndSlicePruningTable.Initialize("CrnrSlic.ptb");
    cout << "Size = " << CornerAndSlicePruningTable.SizeOf() << endl;

    cout << "Initializing EdgeAndSlicePruningTable" << endl;
    EdgeAndSlicePruningTable.Initialize("EdgeSlic.ptb");
    cout << "Size = " << EdgeAndSlicePruningTable.SizeOf() << endl;
}

int Solver::Solve(RubiksCube& scrambledCube) {
    int iteration = 1;
    int result = NOT_FOUND;
    cube = scrambledCube;
    threshold1 = Phase1Cost(cube.Twist(), cube.Flip(), cube.Choice());
    nodes1 = 1;
    solutionLength1 = 0;

    do {
        cout << "threshold(" << iteration << ") = " << threshold1 << endl;
        newThreshold1 = Huge;
        result = Search1(cube.Twist(), cube.Flip(), cube.Choice(), 0);
        threshold1 = newThreshold1;
        iteration++;
    } while (result == NOT_FOUND);

    cout << "Phase 1 nodes = " << nodes1 << endl;
    return result;
}

int Solver::Search1(int twist, int flip, int choice, int depth) {
    int cost = Phase1Cost(twist, flip, choice);
    int totalCost = depth + cost;

    if (cost == 0) {
        solutionLength1 = depth;
        RubiksCube phase2Cube = cube;
        for (int i = 0; i < solutionLength1; i++) {
            for (int power = 0; power < solutionPowers1[i]; power++)
                phase2Cube.ApplyMove(solutionMoves1[i]);
        }
        Solve2(phase2Cube);
    }

    if (totalCost <= threshold1) {
        if (depth >= minSolutionLength - 1) return OPTIMUM_FOUND;
        for (int move = Cube::Move::R; move <= Cube::Move::B; move++) {
            if (Disallowed(move, solutionMoves1, depth)) continue;
            int twist2 = twist, flip2 = flip, choice2 = choice;
            solutionMoves1[depth] = move;
            for (int power = 1; power < 4; power++) {
                solutionPowers1[depth] = power;
                twist2 = twistMoveTable[twist2][move];
                flip2 = flipMoveTable[flip2][move];
                choice2 = choiceMoveTable[choice2][move];
                nodes1++;
                if (Search1(twist2, flip2, choice2, depth + 1)) return FOUND;
            }
        }
    } else {
        if (totalCost < newThreshold1) newThreshold1 = totalCost;
    }
    return NOT_FOUND;
}

int Solver::Solve2(RubiksCube& cube) {
    int iteration = 1;
    int result = NOT_FOUND;
    threshold2 = Phase2Cost(cube.CornerPermutation(), cube.NonMiddleSliceEdgePermutation(), cube.MiddleSliceEdgePermutation());
    nodes2 = 1;
    solutionLength2 = 0;

    do {
        newThreshold2 = Huge;
        result = Search2(cube.CornerPermutation(), cube.NonMiddleSliceEdgePermutation(), cube.MiddleSliceEdgePermutation(), 0);
        threshold2 = newThreshold2;
        iteration++;
    } while (result == NOT_FOUND);

    return result;
}

int Solver::Search2(int cornerPermutation, int nonMiddleSliceEdgePermutation, int middleSliceEdgePermutation, int depth) {
    int cost = Phase2Cost(cornerPermutation, nonMiddleSliceEdgePermutation, middleSliceEdgePermutation);
    int totalCost = depth + cost;

    if (cost == 0) {
        solutionLength2 = depth;
        if (solutionLength1 + solutionLength2 < minSolutionLength) {
            minSolutionLength = solutionLength1 + solutionLength2;
        }
        PrintSolution();
        return FOUND;
    }

    if (totalCost <= threshold2) {
        if (solutionLength1 + depth >= minSolutionLength - 1) return ABORT;
        for (int move = Cube::Move::R; move <= Cube::Move::B; move++) {
            if (Disallowed(move, solutionMoves2, depth)) continue;
            int cp2 = cornerPermutation, np2 = nonMiddleSliceEdgePermutation, mp2 = middleSliceEdgePermutation;
            solutionMoves2[depth] = move;
            int powerLimit = (move != Cube::Move::U && move != Cube::Move::D) ? 2 : 4;
            for (int power = 1; power < powerLimit; power++) {
                cp2 = cornerPermutationMoveTable[cp2][move];
                np2 = nonMiddleSliceEdgePermutationMoveTable[np2][move];
                mp2 = middleSliceEdgePermutationMoveTable[mp2][move];
                solutionPowers2[depth] = power;
                nodes2++;
                if (Search2(cp2, np2, mp2, depth + 1)) return FOUND;
            }
        }
    } else {
        if (totalCost < newThreshold2) newThreshold2 = totalCost;
    }
    return NOT_FOUND;
}

int Solver::Phase1Cost(int twist, int flip, int choice) {
    int cost = TwistAndFlipPruningTable.GetValue(twist * flipMoveTable.SizeOf() + flip);
    int cost2 = TwistAndChoicePruningTable.GetValue(twist * choiceMoveTable.SizeOf() + choice);
    if (cost2 > cost) cost = cost2;
    cost2 = FlipAndChoicePruningTable.GetValue(flip * choiceMoveTable.SizeOf() + choice);
    if (cost2 > cost) cost = cost2;
    return cost;
}

int Solver::Phase2Cost(int cp, int nmp, int mp) {
    int cost = CornerAndSlicePruningTable.GetValue(cp * middleSliceEdgePermutationMoveTable.SizeOf() + mp);
    int cost2 = EdgeAndSlicePruningTable.GetValue(nmp * middleSliceEdgePermutationMoveTable.SizeOf() + mp);
    return (cost2 > cost) ? cost2 : cost;
}

int Solver::Disallowed(int move, int* solutionMoves, int depth) {
    if (depth > 0) {
        if (solutionMoves[depth - 1] == move) return 1;
        if ((move == Cube::Move::F && solutionMoves[depth - 1] == Cube::Move::B) ||
            (move == Cube::Move::R && solutionMoves[depth - 1] == Cube::Move::L) ||
            (move == Cube::Move::U && solutionMoves[depth - 1] == Cube::Move::D)) return 1;
        if (depth > 1 && solutionMoves[depth - 2] == move && solutionMoves[depth - 1] == Cube::OpposingFace(move)) return 1;
    }
    return 0;
}

void Solver::PrintSolution(void) {
    ostringstream oss;
    for (int i = 0; i < solutionLength1; i++) {
        string moveStr = Cube::NameOfMove(TranslateMove(solutionMoves1[i], solutionPowers1[i], 0));
        oss << moveStr << " ";
    }
    oss << ". ";
    for (int i = 0; i < solutionLength2; i++) {
        string moveStr = Cube::NameOfMove(TranslateMove(solutionMoves2[i], solutionPowers2[i], 1));
        oss << moveStr << " ";
    }
    oss << "(" << (solutionLength1 + solutionLength2) << ")";

    bestSoFar = oss.str();
    cout << bestSoFar << endl;
}

int Solver::TranslateMove(int move, int power, int phase2) {
    if (phase2 && move != Cube::Move::U && move != Cube::Move::D) power = 2;
    if (power == 2) return Cube::QuarterTurnToHalfTurnMove(move);
    if (power == 3) return Cube::InverseOfMove(move);
    return move;
}

string Solver::GetBestSolution() {
    return bestSoFar;
}
