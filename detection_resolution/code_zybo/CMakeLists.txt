cmake_minimum_required(VERSION 3.5)
project(build-main C CXX)
set(CMAKE_CXX_STANDARD 11)

# Répertoires
set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(INC_DIR ${CMAKE_SOURCE_DIR}/include)
set(KOCIEMBA_DIR ${INC_DIR}/kociemba)

# Répertoire de sortie
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/obj)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/obj)

# Recherche récursive des sources (sauf les tests)
file(GLOB_RECURSE SOURCES
    "${SRC_DIR}/*.cpp"
)
list(FILTER SOURCES EXCLUDE REGEX ".*main_test.cpp$")
list(FILTER SOURCES EXCLUDE REGEX ".*test.cpp$")

# Ajout de l'exécutable
add_executable(main_zynq ${SOURCES})

# Inclusions nécessaires
target_include_directories(main_zynq PRIVATE
    ${CMAKE_SYSROOT}/usr/include
    ${CMAKE_SYSROOT}/usr/include/opencv
    ${CMAKE_SYSROOT}/usr/include/opencv2
    ${INC_DIR}
    ${KOCIEMBA_DIR}
)

# Lien avec bibliothèques dynamiques présentes dans ton sysroot
target_link_libraries(main_zynq
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libopencv_core.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libopencv_highgui.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libjpeg.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libpng.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libtiff.so
    ${CMAKE_SYSROOT}/usr/lib/arm-linux-gnueabihf/libz.so
    dl m pthread
)
