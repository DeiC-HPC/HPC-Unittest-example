# Note that this section is a bit hack-ish, as ExternalProject_Add does
# not by default build the project at configure time. However, for pFUnit,
# this is an advantage.
# taken from: https://gist.github.com/plevold/330d490d994395e18729ea1ed5a6f5b5

include (ProcessorCount)
ProcessorCount(NPROC)
if (${NPROC} EQUAL 0)
    set (${NPROC} 1)
    message (WARNING "Processor count not found, setting to 1")
endif (${NPROC} EQUAL 0)

## pFUnit config and build settings
if (WIN32)
    set (PFUNIT_CONFIG_FLAGS "-DROBUST=OFF")
endif (WIN32)

if (CMAKE_GENERATOR MATCHES ".*Makefiles.*")
    set (PFUNIT_BUILD_FLAGS "-j${NPROC}")
endif (CMAKE_GENERATOR MATCHES ".*Makefiles.*")


# Store Fortran mod files and generated interfaces in separate folder
set (CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include/)
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/include/)

# Download and unpack pfunit at configure time
configure_file (${CMAKE_CURRENT_LIST_DIR}/pfunit-CMakeLists.txt.in ${PFUNIT_DOWNLOAD_DIR}/CMakeLists.txt)
execute_process(
    COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
    WORKING_DIRECTORY ${PFUNIT_DOWNLOAD_DIR})
execute_process(
    COMMAND ${CMAKE_COMMAND} --build .
    WORKING_DIRECTORY ${PFUNIT_DOWNLOAD_DIR})

# Configure pFUnit
execute_process(
    COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" ${PFUNIT_SRC_DIR} -DCMAKE_INSTALL_PREFIX=${PFUNIT_INSTALL_DIR} ${PFUNIT_CONFIG_FLAGS}
    WORKING_DIRECTORY ${PFUNIT_BUILD_DIR})

## Build pFUnit
execute_process(
    COMMAND ${CMAKE_COMMAND} --build . --target install -- ${PFUNIT_BUILD_FLAGS}
    WORKING_DIRECTORY ${PFUNIT_BUILD_DIR})