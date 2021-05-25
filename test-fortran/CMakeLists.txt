
find_package (PFUNIT REQUIRED)

# system under test
add_library (sut
  square.F90
  )

set (LIB_NAME sut)
target_include_directories(sut PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

# tests

add_pfunit_ctest (test_${LIB_NAME} 
	TEST_SOURCES ${test_srcs} 
	LINK_LIBRARIES sut
)


