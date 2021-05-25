
cmake_minimum_required(VERSION 2.8)

project(HPCCmake C CXX Fortran)
set(CMAKE_CXX_STANDARD 14)

message(STATUS "CMake version   : " ${CMAKE_SYSTEM_VERSION})
message(STATUS "Compiler        : " ${CMAKE_CXX_COMPILER})
message(STATUS "Operating System: " ${CMAKE_SYSTEM})

enable_testing()

add_subdirectory(src)
add_subdirectory(test)
add_subdirectory(test-fortran)
add_subdirectory(libMyCalc)
