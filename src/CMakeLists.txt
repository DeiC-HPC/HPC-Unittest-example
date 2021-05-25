
set(Main_SRCS
    main.cpp
)

add_executable(MyHPCApp
    ${Main_SRCS}
)

# Specify here the libraries this program depends on
target_link_libraries(MyHPCApp
    libMyCalc
)

install(TARGETS MyHPCApp DESTINATION bin)