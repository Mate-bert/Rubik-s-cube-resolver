# Crée les dossiers nécessaires pour les .o
prepare:
	mkdir -p obj obj/kociemba

# === Variables ===
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Iinclude -Iinclude/kociemba -I/c/opencv/install/include
LDFLAGS = -L/c/opencv/install/x64/mingw/lib
LDLIBS = -lopencv_core4120 -lopencv_highgui4120 -lopencv_imgcodecs4120 -lopencv_imgproc4120 -lcomdlg32

# === Sources et Objets ===
SRC_MAIN = src/main.cpp src/face_rectifieur_auto.cpp src/split_stickers.cpp src/ColorDetector.cpp src/config.cpp \
		   src/kociemba/Combinatorics.cpp src/kociemba/Cube.cpp src/kociemba/CubeParser.cpp src/kociemba/FaceletCube.cpp \
		   src/kociemba/MoveTable.cpp src/kociemba/PruningTable.cpp src/kociemba/RubiksCube.cpp src/kociemba/Solver.cpp \
		   src/kociemba/Vector.cpp src/kociemba_solver.cpp src/traduction.cpp 
OBJ_MAIN = $(SRC_MAIN:src/%.cpp=obj/%.o)

SRC_ANALYSE1 = src/analyse/analyse_kociemba.cpp src/config.cpp
OBJ_ANA1 = $(SRC_ANALYSE1:src/%.cpp=obj/%.o)
SRC_ANALYSE2 = src/analyse/analyse_kociemba_v2.cpp src/config.cpp
OBJ_ANA2 = $(SRC_ANALYSE2:src/%.cpp=obj/%.o)

BIN_MAIN = bin/main.exe
BIN_ANALYSE1 = bin/analyse_kociemba.exe
BIN_ANALYSE2 = bin/analyse_kociemba_v2.exe

# === Targets de build ===
build: build-main build-analyse1 build-analyse2

build-main: prepare $(BIN_MAIN)
build-analyse1: $(BIN_ANALYSE1)
build-analyse2: $(BIN_ANALYSE2)

$(BIN_MAIN): $(OBJ_MAIN)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

$(BIN_ANALYSE1): 
	$(CXX) $(CXXFLAGS) -o $@ $(SRC_ANALYSE1) $(LDFLAGS) $(LDLIBS)

$(BIN_ANALYSE2): 
	$(CXX) $(CXXFLAGS) -o $@ $(SRC_ANALYSE2) $(LDFLAGS) $(LDLIBS)

obj/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# === Targets d'exécution ===
run: run-main 

run-main: build-main
	bash -c "./bin/main.exe"

run-analyse1: build-analyse1
	./$(BIN_ANALYSE1) > data/output/analyse/res.txt

run-analyse2: build-analyse2
	./$(BIN_ANALYSE2)

# === Nettoyage ===
clean:
	rm -f obj/*.o bin/*.exe