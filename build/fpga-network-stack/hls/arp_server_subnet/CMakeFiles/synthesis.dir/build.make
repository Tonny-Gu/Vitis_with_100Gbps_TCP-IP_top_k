# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.3

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
CMAKE_COMMAND = /tools/Xilinx/Vitis/2021.2/tps/lnx64/cmake-3.3.2/bin/cmake

# The command to remove a file.
RM = /tools/Xilinx/Vitis/2021.2/tps/lnx64/cmake-3.3.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build

# Utility rule file for synthesis.

# Include the progress variables for this target.
include fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/progress.make

synthesis: fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/build.make

.PHONY : synthesis

# Rule to build all files generated by this target.
fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/build: synthesis

.PHONY : fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/build

fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/clean:
	cd /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build/fpga-network-stack/hls/arp_server_subnet && $(CMAKE_COMMAND) -P CMakeFiles/synthesis.dir/cmake_clean.cmake
.PHONY : fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/clean

fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/depend:
	cd /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/arp_server_subnet /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build/fpga-network-stack/hls/arp_server_subnet /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build/fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fpga-network-stack/hls/arp_server_subnet/CMakeFiles/synthesis.dir/depend

