QT += core gui widgets
CONFIG += c++17 console
CONFIG += moc

# === Chemins d'inclusion ===
INCLUDEPATH += \
    include \
    include/kociemba \
    C:/opencv/install/include

# === Fichiers sources ===
SOURCES += \
    main2.cpp \
    src/config.cpp \
    src/face_rectifieur_auto.cpp \
    src/split_stickers.cpp \
    src/check_structure.cpp \
    src/traduction.cpp \
    src/kociemba_solver.cpp \
    src/ColorDetector.cpp \
    src/kociemba/CubeParser.cpp \
    src/kociemba/FaceletCube.cpp \
    src/kociemba/RubiksCube.cpp \
    src/kociemba/Solver.cpp \
    src/kociemba/Cube.cpp \
    src/kociemba/MoveTable.cpp \
    src/kociemba/PruningTable.cpp \
    src/kociemba/Combinatorics.cpp \
    src/kociemba/Vector.cpp \
    src/RubiksPipelineWindow.cpp 


# === Fichiers headers ===
HEADERS += \
    include/config.hpp \
    include/face_rectifieur_auto.hpp \
    include/split_stickers.hpp \
    include/check_structure.hpp \
    include/traduction.hpp \
    include/kociemba_solver.hpp \
    include/ColorDetector.hpp \
    include/kociemba/CubeParser.hpp \
    include/kociemba/FaceletCube.hpp \
    include/kociemba/RubiksCube.hpp \
    include/kociemba/Solver.hpp \
    include/RubiksPipelineWindow.hpp

# === OpenCV: chemins des bibliothèques ===
LIBS += -LC:/opencv/install/x64/mingw/lib \
    -lopencv_core4120 \
    -lopencv_imgproc4120 \
    -lopencv_highgui4120 \
    -lopencv_imgcodecs4120
