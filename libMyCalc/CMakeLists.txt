set(libMyCalc_SRCS
    mycalc.hpp
    mycalc.cpp
)

# Declare the library
add_library(libMyCalc STATIC
    ${libMyCalc_SRCS}
)


# Specify here the include directories exported
# by this library
target_include_directories(libMyCalc PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)