include(ExternalProject)
##########
# pFUnit #
##########

set(PFUNIT_VERSION         v4.1.12)
set(PFUNIT_URL             https://github.com/Goddard-Fortran-Ecosystem/pFUnit/archive/${PFUNIT_VERSION}.tar.gz)
set(PFUNIT_HASH            SHA512=e75e4015ac1026e6c8d80a17bb77efbe5980bfdbaf7c6008e73506a6c390fdde231b837366276ad899566c0e02d86d18eec168c58d0f0602cc4f43f2613e9a73)

#############
# fArgParse #
#############

set(FARGPARSE_VERSION      v1.0.1)
set(FARGPARSE_URL          https://github.com/Goddard-Fortran-Ecosystem/fArgParse/archive/${FARGPARSE_VERSION}.tar.gz)
set(FARGPARSE_HASH         SHA512=7dc70119c664e0106fc914f0d082473d68b6d1cd5b5dc174fe843d3a0198b8792c872805c7ca126e2117e10bac507c2be068650ab00ebbef158a087c076305d5)

############
# pFlogger #
############

set(PFLOGGER_VERSION       v1.4.5)
set(PFLOGGER_URL           https://github.com/Goddard-Fortran-Ecosystem/pFlogger/archive/${PFLOGGER_VERSION}.tar.gz)
set(PFLOGGER_HASH          SHA512=382c64c134641993fbf8c926700b0162dedb61c1b4a09d7e75a8eb6d2042cb11aaa0f230bf45bcd9ffe252c79c61917d8e13db78acae66750a74694f8485c060)

###########
# yaFyaml #
###########

set(YAFYAML_VERSION        v0.4.1)
set(YAFYAML_URL            https://github.com/Goddard-Fortran-Ecosystem/yaFyaml/archive/${YAFYAML_VERSION}.tar.gz)
set(YAFYAML_HASH           SHA512=7c3d6e24ee6b96b2e2795969841d9b1cfde2a861702ac6f962b3b58a80b85094b57aa524f785eee3887b60d41549ce3a66a9c4dfdd31da3804dcb588cd42a459)


#######
# gFTL #
########

set(GFTL_VERSION           v1.2.7)
set(GFTL_URL               https://github.com/Goddard-Fortran-Ecosystem/gFTL/archive/${GFTL_VERSION}.tar.gz)
set(GFTL_HASH              SHA512=d6b488c511754e82ea31b898008a2c8e6e0a05046f2a0bab681b9fd37ee9c422d63b3ba912c263c32b160caaca4b49557963caa101d141a66c66229d66c54ec8)

###############
# gFTL-shared #
###############

set(GFTL_SHARED_VERSION    v1.0.7)
set(GFTL_SHARED_URL        https://github.com/Goddard-Fortran-Ecosystem/gFTL-shared/archive/${GFTL_SHARED_VERSION}.tar.gz)
set(GFTL_SHARED_HASH       SHA512=88a6cf8cdee555b8a275d590b6e36bdd27763fe2a5336a46c630ee7dd1439125c51159822a05db8c6ad4ea22c05eb01ff8665af9cbd28ff2746a1fb68d973c78)

########
# gFTL #
########

FetchContent_Declare(gftl
   URL      ${GFTL_URL}
   URL_HASH ${GFTL_HASH}
)
FetchContent_GetProperties(gftl)
if(NOT gftl_POPULATED)
   message(STATUS "Fetching gftl...")
   FetchContent_Populate(gftl)
endif()

ExternalProject_Add(gftl
   SOURCE_DIR ${gftl_SOURCE_DIR}

   CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}

   BUILD_COMMAND $(MAKE)

   INSTALL_COMMAND $(MAKE) install
   INSTALL_DIR ${CMAKE_INSTALL_PREFIX}

   LOG_DIR               ${CMAKE_INSTALL_PREFIX}/logs/gftl
   LOG_CONFIGURE         TRUE
   LOG_BUILD             TRUE
   LOG_INSTALL           TRUE
   LOG_MERGED_STDOUTERR  TRUE
   LOG_OUTPUT_ON_FAILURE TRUE
   )

###############
# gFTL-shared #
###############

FetchContent_Declare(gftl-shared
   URL      ${GFTL_SHARED_URL}
   URL_HASH ${GFTL_SHARED_HASH}
)
FetchContent_GetProperties(gftl-shared)
if(NOT gftl-shared_POPULATED)
   message(STATUS "Fetching gftl-shared...")
   FetchContent_Populate(gftl-shared)
endif()

ExternalProject_Add(gftl-shared
   SOURCE_DIR ${gftl-shared_SOURCE_DIR}

   CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}

   BUILD_COMMAND $(MAKE)

   INSTALL_COMMAND $(MAKE) install
   INSTALL_DIR ${CMAKE_INSTALL_PREFIX}

   LOG_DIR               ${CMAKE_INSTALL_PREFIX}/logs/gftl-shared
   LOG_CONFIGURE         TRUE
   LOG_BUILD             TRUE
   LOG_INSTALL           TRUE
   LOG_MERGED_STDOUTERR  TRUE
   LOG_OUTPUT_ON_FAILURE TRUE

   DEPENDS gftl
   )

#############
# fArgParse #
#############

FetchContent_Declare(fargparse
   URL      ${FARGPARSE_URL}
   URL_HASH ${FARGPARSE_HASH}
)
FetchContent_GetProperties(fargparse)
if(NOT fargparse_POPULATED)
   message(STATUS "Fetching fargparse...")
   FetchContent_Populate(fargparse)
endif()

ExternalProject_Add(fargparse
   SOURCE_DIR ${fargparse_SOURCE_DIR}

   CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}

   BUILD_COMMAND $(MAKE)

   INSTALL_COMMAND $(MAKE) install
   INSTALL_DIR ${CMAKE_INSTALL_PREFIX}

   LOG_DIR               ${CMAKE_INSTALL_PREFIX}/logs/fargparse
   LOG_CONFIGURE         TRUE
   LOG_BUILD             TRUE
   LOG_INSTALL           TRUE
   LOG_MERGED_STDOUTERR  TRUE
   LOG_OUTPUT_ON_FAILURE TRUE

   DEPENDS gftl
   DEPENDS gftl-shared
   )

##########
# pFUnit #
##########

FetchContent_Declare(pfunit
   URL      ${PFUNIT_URL}
   URL_HASH ${PFUNIT_HASH}
)
FetchContent_GetProperties(pfunit)
if(NOT pfunit_POPULATED)
   message(STATUS "Fetching pfunit...")
   FetchContent_Populate(pfunit)
endif()

ExternalProject_Add(pfunit
   SOURCE_DIR ${pfunit_SOURCE_DIR}

   CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
      -DSKIP_OPENMP:BOOL=YES

   BUILD_COMMAND $(MAKE)

   INSTALL_COMMAND $(MAKE) install
   INSTALL_DIR ${CMAKE_INSTALL_PREFIX}

   LOG_DIR               ${CMAKE_INSTALL_PREFIX}/logs/pfunit
   LOG_CONFIGURE         TRUE
   LOG_BUILD             TRUE
   LOG_INSTALL           TRUE
   LOG_MERGED_STDOUTERR  TRUE
   LOG_OUTPUT_ON_FAILURE TRUE

   DEPENDS gftl
   DEPENDS gftl-shared
   DEPENDS fargparse
   )
include(ExternalProject)

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