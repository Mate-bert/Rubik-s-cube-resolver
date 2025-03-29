
CXX := g++
INCLUDE := -I/c/opencv/install/include -Iinclude
LIBS := -L/c/opencv/install/x64/mingw/lib -lopencv_core4120 -lopencv_highgui4120 -lopencv_imgcodecs4120 -lopencv_imgproc4120 -lcomdlg32
CXXFLAGS := -std=c++17 -Wall $(INCLUDE)
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

TARGETS := main

all: $(addprefix $(BIN_DIR)/, $(TARGETS))

$(BIN_DIR)/main: $(OBJ_DIR)/main.o $(OBJ_DIR)/split_stickers.o $(OBJ_DIR)/ColorDetector.o $(OBJ_DIR)/face_rectifieur_auto.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

$(BIN_DIR)/test: $(OBJ_DIR)/test.o $(OBJ_DIR)/split_stickers.o $(OBJ_DIR)/ColorDetector.o $(OBJ_DIR)/face_rectifieur_auto.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/rubiks_resolver $(BIN_DIR)/test