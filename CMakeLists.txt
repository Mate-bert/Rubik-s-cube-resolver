# Version de CMake
cmake_minimum_required(VERSION 3.10)

# Nom du projet
project(CheckStructureTest)

# Définir la version du standard C++
set(CMAKE_CXX_STANDARD 11)

# Ajouter le répertoire d'inclusion
include_directories(${CMAKE_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/include/kociemba)

# Spécifie où se trouve GoogleTest
add_subdirectory(googletest-1.16.0)

# Fichiers source principaux et fichiers de test
add_executable(check_structure_test 
    src/test/check_structure_test.cpp 
    src/check_structure.cpp
    src/kociemba/Combinatorics.cpp
    src/kociemba/MoveTable.cpp
    src/kociemba/PruningTable.cpp
    src/kociemba/Vector.cpp
    src/kociemba/Cube.cpp
    src/kociemba/RubiksCube.cpp          # Ajoute Cube.cpp
    src/kociemba/FaceletCube.cpp   # Ajoute FaceletCube.cpp
    src/kociemba/CubeParser.cpp    # Ajoute CubeParser.cpp    
)

# Lier Google Test avec ton projet
target_link_libraries(check_structure_test gtest gtest_main)

# Activer les tests avec CTest
enable_testing()
add_test(NAME CheckStructureTest COMMAND check_structure_test)

# Spécifier le dossier de sortie des exécutables
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)