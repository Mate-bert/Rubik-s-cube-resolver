# Compilateur et options
CXX = g++
CXXFLAGS = -std=c++17 -O3 -Wall -Iinclude
TARGET = bin/rubiks-solver

# Fichiers sources
SRC_DIR = src
SOURCES = \
    $(SRC_DIR)/Combinatorics.cpp \
    $(SRC_DIR)/Cube.cpp \
    $(SRC_DIR)/CubeParser.cpp \
    $(SRC_DIR)/FaceletCube.cpp \
    $(SRC_DIR)/main.cpp \
    $(SRC_DIR)/MoveTable.cpp \
    $(SRC_DIR)/PruningTable.cpp \
    $(SRC_DIR)/RubiksCube.cpp \
    $(SRC_DIR)/Solver.cpp \
    $(SRC_DIR)/Vector.cpp

# Fichiers headers
HEADERS = \
    include/Combinatorics.hpp \
    include/Cube.hpp \
    include/CubeParser.hpp \
    include/FaceletCube.hpp \
    include/KociMoveTables.hpp \
    include/MoveTable.hpp \
    include/PruningTable.hpp \
    include/RubiksCube.hpp \
    include/Solver.hpp \
    include/Vector.hpp

# Création du répertoire bin si nécessaire
$(shell mkdir -p bin)

# Règle par défaut
all: $(TARGET)

# Règle de compilation
$(TARGET): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) -o $@ $(SOURCES)

# Règle pour les fichiers de données (optionnel)
data: $(TARGET)
	./$(TARGET)  # Cela générera les fichiers .mtb et .ptb dans le dossier courant

# Règle de nettoyage
clean:
	rm -rf $(TARGET) bin/*.mtb bin/*.ptb

