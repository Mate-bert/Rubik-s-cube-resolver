CXX := g++
CXXFLAGS := -std=c++17 -Wall

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INCLUDE := -I/c/opencv/install/include -Iinclude
LIBS := -L/c/opencv/install/x64/mingw/lib -lopencv_core4120 -lopencv_highgui4120 -lopencv_imgcodecs4120 -lopencv_imgproc4120

# Fichiers sources spécifiques
SRC_MAIN := $(SRC_DIR)/main.cpp 
SRC_TEST := $(SRC_DIR)/test.cpp 

# Objets associés
OBJ_MAIN := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_MAIN))
OBJ_TEST := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_TEST))

# Cibles
all: test

main: $(OBJ_MAIN)
	@mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/main.exe $^ $(LIBS)

test: $(OBJ_TEST)
	@mkdir -p $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/test.exe $^ $(LIBS)

# Règle de compilation générique
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)