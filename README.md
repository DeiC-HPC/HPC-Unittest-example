# HPC-Unittest-example
Show how to do unittests in cmake for HPC. work in progress.

# build and run
- Create dir "build"
- cd "build"
- cmake ..
- make
- make test

It also works with Ninja.

To run this on windows either disable the fortran tests or install intel fortran compiler.

# C/C++ unit tests
The C/C++ tests uses the googletest framework that is a xUnit style framework.

# Fortran tests.
The fortran tests uses the xUnit style framework called pfunit.
For now the pfunit tests must be installed and findable by cmake to work.
Download and install pfunit from https://github.com/Goddard-Fortran-Ecosystem/pFUnit


