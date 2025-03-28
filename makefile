CXX := g++
CXXFLAGS := -std=c++11 -Wall

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC))
TARGET := $(BIN_DIR)/main.exe

INCLUDES := -I/c/opencv/install/include
LIBS := -L/c/opencv/install/x64/mingw/lib -lopencv_core4120 -lopencv_highgui4120 -lopencv_imgcodecs4120 -lopencv_imgproc4120

$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CXX) -o $@ $^ $(LIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
