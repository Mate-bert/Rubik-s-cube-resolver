# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gad/Documents/cours/rubiks_cube

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gad/Documents/cours/rubiks_cube/build

# Include any dependencies generated for this target.
include CMakeFiles/main_zynq.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main_zynq.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main_zynq.dir/flags.make

CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o: ../src/ColorDetector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/ColorDetector.cpp

CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/ColorDetector.cpp > CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.i

CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/ColorDetector.cpp -o CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.s

CMakeFiles/main_zynq.dir/src/check_structure.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/check_structure.cpp.o: ../src/check_structure.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main_zynq.dir/src/check_structure.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/check_structure.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/check_structure.cpp

CMakeFiles/main_zynq.dir/src/check_structure.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/check_structure.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/check_structure.cpp > CMakeFiles/main_zynq.dir/src/check_structure.cpp.i

CMakeFiles/main_zynq.dir/src/check_structure.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/check_structure.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/check_structure.cpp -o CMakeFiles/main_zynq.dir/src/check_structure.cpp.s

CMakeFiles/main_zynq.dir/src/config.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/config.cpp.o: ../src/config.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/main_zynq.dir/src/config.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/config.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/config.cpp

CMakeFiles/main_zynq.dir/src/config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/config.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/config.cpp > CMakeFiles/main_zynq.dir/src/config.cpp.i

CMakeFiles/main_zynq.dir/src/config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/config.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/config.cpp -o CMakeFiles/main_zynq.dir/src/config.cpp.s

CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o: ../src/face_rectifieur_auto.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/face_rectifieur_auto.cpp

CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/face_rectifieur_auto.cpp > CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.i

CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/face_rectifieur_auto.cpp -o CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o: ../src/kociemba/Combinatorics.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/Combinatorics.cpp

CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/Combinatorics.cpp > CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/Combinatorics.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o: ../src/kociemba/Cube.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/Cube.cpp

CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/Cube.cpp > CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/Cube.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o: ../src/kociemba/CubeParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/CubeParser.cpp

CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/CubeParser.cpp > CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/CubeParser.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o: ../src/kociemba/FaceletCube.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/FaceletCube.cpp

CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/FaceletCube.cpp > CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/FaceletCube.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o: ../src/kociemba/MoveTable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/MoveTable.cpp

CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/MoveTable.cpp > CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/MoveTable.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o: ../src/kociemba/PruningTable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/PruningTable.cpp

CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/PruningTable.cpp > CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/PruningTable.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o: ../src/kociemba/RubiksCube.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/RubiksCube.cpp

CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/RubiksCube.cpp > CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/RubiksCube.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o: ../src/kociemba/Solver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/Solver.cpp

CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/Solver.cpp > CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/Solver.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o: ../src/kociemba/Vector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba/Vector.cpp

CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba/Vector.cpp > CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba/Vector.cpp -o CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.s

CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o: ../src/kociemba_solver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/kociemba_solver.cpp

CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/kociemba_solver.cpp > CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.i

CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/kociemba_solver.cpp -o CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.s

CMakeFiles/main_zynq.dir/src/main.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/main_zynq.dir/src/main.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/main.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/main.cpp

CMakeFiles/main_zynq.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/main.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/main.cpp > CMakeFiles/main_zynq.dir/src/main.cpp.i

CMakeFiles/main_zynq.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/main.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/main.cpp -o CMakeFiles/main_zynq.dir/src/main.cpp.s

CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o: ../src/split_stickers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/split_stickers.cpp

CMakeFiles/main_zynq.dir/src/split_stickers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/split_stickers.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/split_stickers.cpp > CMakeFiles/main_zynq.dir/src/split_stickers.cpp.i

CMakeFiles/main_zynq.dir/src/split_stickers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/split_stickers.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/split_stickers.cpp -o CMakeFiles/main_zynq.dir/src/split_stickers.cpp.s

CMakeFiles/main_zynq.dir/src/traduction.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/traduction.cpp.o: ../src/traduction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object CMakeFiles/main_zynq.dir/src/traduction.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/traduction.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/traduction.cpp

CMakeFiles/main_zynq.dir/src/traduction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/traduction.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/traduction.cpp > CMakeFiles/main_zynq.dir/src/traduction.cpp.i

CMakeFiles/main_zynq.dir/src/traduction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/traduction.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/traduction.cpp -o CMakeFiles/main_zynq.dir/src/traduction.cpp.s

CMakeFiles/main_zynq.dir/src/utils.cpp.o: CMakeFiles/main_zynq.dir/flags.make
CMakeFiles/main_zynq.dir/src/utils.cpp.o: ../src/utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building CXX object CMakeFiles/main_zynq.dir/src/utils.cpp.o"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main_zynq.dir/src/utils.cpp.o -c /home/gad/Documents/cours/rubiks_cube/src/utils.cpp

CMakeFiles/main_zynq.dir/src/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main_zynq.dir/src/utils.cpp.i"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gad/Documents/cours/rubiks_cube/src/utils.cpp > CMakeFiles/main_zynq.dir/src/utils.cpp.i

CMakeFiles/main_zynq.dir/src/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main_zynq.dir/src/utils.cpp.s"
	/home/gad/Documents/cours/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ --sysroot=/home/gad/Documents/cours/sysroot_zybo $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gad/Documents/cours/rubiks_cube/src/utils.cpp -o CMakeFiles/main_zynq.dir/src/utils.cpp.s

# Object files for target main_zynq
main_zynq_OBJECTS = \
"CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o" \
"CMakeFiles/main_zynq.dir/src/check_structure.cpp.o" \
"CMakeFiles/main_zynq.dir/src/config.cpp.o" \
"CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o" \
"CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o" \
"CMakeFiles/main_zynq.dir/src/main.cpp.o" \
"CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o" \
"CMakeFiles/main_zynq.dir/src/traduction.cpp.o" \
"CMakeFiles/main_zynq.dir/src/utils.cpp.o"

# External object files for target main_zynq
main_zynq_EXTERNAL_OBJECTS =

../bin/main_zynq: CMakeFiles/main_zynq.dir/src/ColorDetector.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/check_structure.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/config.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/face_rectifieur_auto.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/Combinatorics.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/Cube.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/CubeParser.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/FaceletCube.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/MoveTable.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/PruningTable.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/RubiksCube.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/Solver.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba/Vector.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/kociemba_solver.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/main.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/split_stickers.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/traduction.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/src/utils.cpp.o
../bin/main_zynq: CMakeFiles/main_zynq.dir/build.make
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libopencv_core.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libopencv_highgui.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libjpeg.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libpng.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libtiff.so
../bin/main_zynq: /home/gad/Documents/cours/sysroot_zybo/usr/lib/arm-linux-gnueabihf/libz.so
../bin/main_zynq: CMakeFiles/main_zynq.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gad/Documents/cours/rubiks_cube/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Linking CXX executable ../bin/main_zynq"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main_zynq.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main_zynq.dir/build: ../bin/main_zynq

.PHONY : CMakeFiles/main_zynq.dir/build

CMakeFiles/main_zynq.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main_zynq.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main_zynq.dir/clean

CMakeFiles/main_zynq.dir/depend:
	cd /home/gad/Documents/cours/rubiks_cube/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gad/Documents/cours/rubiks_cube /home/gad/Documents/cours/rubiks_cube /home/gad/Documents/cours/rubiks_cube/build /home/gad/Documents/cours/rubiks_cube/build /home/gad/Documents/cours/rubiks_cube/build/CMakeFiles/main_zynq.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main_zynq.dir/depend

