cmake_minimum_required(VERSION 3.10)
project(OpenCV_GUI)

set(CMAKE_AUTOMOC ON)

find_package(Qt5 REQUIRED COMPONENTS Widgets)
find_package(OpenCV REQUIRED)

add_executable(OpenCV_GUI main.cpp)
target_link_libraries(OpenCV_GUI Qt5::Widgets ${OpenCV_LIBS})
