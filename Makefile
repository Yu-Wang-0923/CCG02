# Makefile for Computational Conformal Geometry course 1 in BIMSA.

# Programmed by Zhaoqi Zhang.
# Using viewer library libigl.

main = ./build/main

#=================================================
# Define program parameters
#=================================================

explicit = 0
resolution = 20

implicit = "x*x+y*y+z*z-1"

minx = -2
miny = -2
minz = -2
reso = 0.1

#=================================================
# Compiler settings
#=================================================
CXXFLAGS += -std=c++17  # Use C++17 standard.

#=================================================
# Default target: compile and run the program
#=================================================
default: r  # Runs the program after compilation.

#=================================================
# Initialize: Clean and set up build environment
#=================================================
i initialize:
	make d          			# Remove old directories.
	mkdir build           		# Create a fresh build directory.
	(cd build; cmake ../main)   # Generate build files using CMake.

#=================================================
# Compile: Build the program using CMake
#=================================================
c compile: 
	(cd build; cmake --build .)  # Compile the program.

#=================================================
# Run0: Explicit Parametric Surface (Sphere)
#=================================================
r00 run00:
	$(main) 0 0 $(resolution)

#=================================================
# Run1: Explicit Parametric Surface (Torus)
#=================================================
r01 run01:
	$(main) 0 1 $(resolution)

#=================================================
# Run1: Implicit Function Surface
#=================================================
r1 run1:
	$(main) 1 $(implicit) \
	$(minx) $(miny) $(minz) $(reso)

#=================================================
# Test: Test if your program is compiled.
#=================================================
t t:
	$(main) -1

#=================================================
# Delete: Remove build directory to clean up
#=================================================
d delete:
	rm -rf build  				 # Remove the build directory.

#=================================================
# Full build: Initialize, compile, and run the program
#=================================================
b build:
	make i   # Initialize the build environment.
	make c   # Compile the program.
	make r   # Run the program.

#=================================================
# Help: Display available commands and usage
#=================================================
h help:
	@echo "Makefile for Harmonic Map Computation"
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  h    help       - Show this help message."
	@echo "  i    initialize - Clean and set up the build environment."
	@echo "  c    compile    - Compile the program using CMake."
	@echo "  r    run        - Execute the program with default arguments."
	@echo "  d    delete     - Remove the build directory."
	@echo "  b    build      - Perform full build (initialize, compile, and run)."
	@echo ""