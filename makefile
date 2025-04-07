# === Préparation des dossiers nécessaires ===
# Crée les dossiers nécessaires pour stocker les fichiers objets (.o)
prepare:
	mkdir -p obj obj/kociemba

# === Variables ===
# Définition du compilateur et des options de compilation
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Iinclude -Iinclude/kociemba -I/c/opencv/install/include

# Définition des options de l'éditeur de liens
LDFLAGS = -L/c/opencv/install/x64/mingw/lib
LDLIBS = -lopencv_core4120 -lopencv_highgui4120 -lopencv_imgcodecs4120 -lopencv_imgproc4120 -lcomdlg32

# === Sources et Objets ===
# Liste des fichiers sources principaux et leurs fichiers objets correspondants
SRC_MAIN = src/main.cpp src/face_rectifieur_auto.cpp src/split_stickers.cpp src/ColorDetector.cpp src/config.cpp \
		   src/kociemba/Combinatorics.cpp src/kociemba/Cube.cpp src/kociemba/CubeParser.cpp src/kociemba/FaceletCube.cpp \
		   src/kociemba/MoveTable.cpp src/kociemba/PruningTable.cpp src/kociemba/RubiksCube.cpp src/kociemba/Solver.cpp \
		   src/kociemba/Vector.cpp src/kociemba_solver.cpp src/traduction.cpp src/check_structure.cpp
OBJ_MAIN = $(SRC_MAIN:src/%.cpp=obj/%.o)

# Liste des fichiers sources et objets pour les analyses
SRC_ANALYSE1 = src/analyse/analyse_kociemba.cpp src/config.cpp
OBJ_ANA1 = $(SRC_ANALYSE1:src/%.cpp=obj/%.o)
SRC_ANALYSE2 = src/analyse/analyse_kociemba_v2.cpp src/config.cpp
OBJ_ANA2 = $(SRC_ANALYSE2:src/%.cpp=obj/%.o)

# Définition des fichiers binaires générés
BIN_MAIN = bin/main.exe
BIN_ANALYSE1 = bin/analyse_kociemba.exe
BIN_ANALYSE2 = bin/analyse_kociemba_v2.exe

# === Targets de build ===
# Règle principale pour construire tous les binaires
build: build-main build-analyse1 build-analyse2

# Règles pour construire chaque binaire
build-main: prepare $(BIN_MAIN)
build-analyse1: $(BIN_ANALYSE1)
build-analyse2: $(BIN_ANALYSE2)

# Construction du binaire principal
$(BIN_MAIN): $(OBJ_MAIN)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

# Construction du binaire pour analyse_kociemba
$(BIN_ANALYSE1): 
	$(CXX) $(CXXFLAGS) -o $@ $(SRC_ANALYSE1) $(LDFLAGS) $(LDLIBS)

# Construction du binaire pour analyse_kociemba_v2
$(BIN_ANALYSE2): 
	$(CXX) $(CXXFLAGS) -o $@ $(SRC_ANALYSE2) $(LDFLAGS) $(LDLIBS)

# Compilation des fichiers objets
obj/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# === Targets d'exécution ===
# Règles pour exécuter les différents binaires
run: run-main 

run-main: build-main
	bash -c "./bin/main.exe"

run-analyse1: build-analyse1
	./$(BIN_ANALYSE1) > data/output/analyse/res.txt

run-analyse2: build-analyse2
	./$(BIN_ANALYSE2)

# === Nettoyage ===
# Supprime les fichiers objets et les binaires générés
clean:
	rm -f obj/*.o bin/*.exe