QT += core gui widgets
CONFIG += c++17 console
CONFIG += moc
INCLUDEPATH += include

SOURCES += \
    main.cpp \
    src/config.cpp \
    src/face_rectifieur_auto.cpp \
    src/split_stickers.cpp \
    src/check_structure.cpp \
    src/traduction.cpp \
    src/kociemba_solver.cpp \
    src/ColorDetector.cpp

HEADERS += \
    include/config.hpp \
    include/face_rectifieur_auto.hpp \
    include/split_stickers.hpp \
    include/check_structure.hpp \
    include/traduction.hpp \
    include/kociemba_solver.hpp \
    include/ColorDetector.hpp

# OpenCV
INCLUDEPATH += C:/opencv/install/include
LIBS += -LC:/opencv/install/x64/mingw/lib \
    -lopencv_core4120 \
    -lopencv_imgproc4120 \
    -lopencv_highgui4120 \
    -lopencv_imgcodecs4120
