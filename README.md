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

# Fotran tests.
for now the pfunit tests must be installed and findable by cmake to work.
Download and install pfunit from https://github.com/Goddard-Fortran-Ecosystem/pFUnit


