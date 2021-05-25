include(ExternalProject)

ExternalProject_Add(pfunit
    GIT_REPOSITORY      https://git.code.sf.net/p/pfunit/code
    GIT_TAG             master
    SOURCE_DIR          "${PFUNIT_SRC_DIR}"
    BINARY_DIR          "${PFUNIT_BUILD_DIR}"
    INSTALL_DIR         "${PFUNIT_INSTALL_DIR}"
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND       ""
    INSTALL_COMMAND     ""
    TEST_COMMAND        ""
    )

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