
set (PFUNIT_SRC_DIR ${CMAKE_BINARY_DIR}/pfunit/src)
set (PFUNIT_DOWNLOAD_DIR ${CMAKE_BINARY_DIR}/pfunit/download)
set (PFUNIT_BUILD_DIR ${CMAKE_BINARY_DIR}/pfunit/build)
set (PFUNIT_INSTALL_DIR ${CMAKE_BINARY_DIR}/pfunit/install)
set (pFUnit_DIR ${PFUNIT_INSTALL_DIR})
message ("Building pFUnit")
include (build_pfuint_from_source.cmake)
message ("Looking for pFUnit here: ${PFUNIT_INSTALL_DIR}")
find_package ("pFUnit"
    CONFIG
    PATHS ${PFUNIT_INSTALL_DIR})

# system under test
add_library (sut
  square.F90
  )
target_include_directories(sut PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
# tests
set (test_srcs test_square.pf)
add_pfunit_ctest (my_tests
  TEST_SOURCES ${test_srcs}
  LINK_LIBRARIES sut
  )