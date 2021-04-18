message("external project: TBB")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/TBB")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/TBB-build")
set(EP_INSTALL_DIR "${CMAKE_BINARY_DIR}/TBB-install")
list(APPEND CMAKE_PREFIX_PATH ${EP_INSTALL_DIR})

#-----------------------------------------------------------------------------
set(TBB_ROOT PATH ${EP_INSTALL_DIR})
find_package(TBB)

set(DEPENDENCIES "")

if(NOT DEFINED TBB_FOUND OR NOT TBB_FOUND)
  ExternalProject_Add(TBB
    GIT_REPOSITORY "https://github.com/oneapi-src/oneTBB.git"
    GIT_TAG "v2021.2.0-rc"
    SOURCE_DIR ${EP_SOURCE_DIR}
    BINARY_DIR ${EP_BINARY_DIR}
    INSTALL_DIR ${EP_INSTALL_DIR}
    CMAKE_CACHE_ARGS
      # CMake settings
      -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
      -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
      -DCMAKE_CXX_STANDARD:STRING=${CMAKE_CXX_STANDARD}
      -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=${CMAKE_CXX_STANDARD_REQUIRED}
      -DCMAKE_CXX_EXTENSIONS:BOOL=${CMAKE_CXX_EXTENSIONS}
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      # Lib settings
    DEPENDS ${DEPENDENCIES}
    )
else()
  # Add empty project that exports target TBB
  ExternalProject_Add(TBB
    SOURCE_DIR ${EP_SOURCE_DIR}
    BINARY_DIR ${EP_BINARY_DIR}
    INSTALL_DIR ${EP_INSTALL_DIR}
    DOWNLOAD_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    DEPENDS ${DEPENDENCIES}
    )
endif()
