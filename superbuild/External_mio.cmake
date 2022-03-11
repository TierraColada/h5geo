message("external project: mio")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/mio")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/mio-build")
set(EP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/mio-install")
list(APPEND CMAKE_PREFIX_PATH ${EP_INSTALL_DIR})

#-----------------------------------------------------------------------------
set(mio_ROOT PATH ${EP_INSTALL_DIR})
find_package(mio)

set(DEPENDENCIES "")

if(NOT DEFINED mio_FOUND OR NOT mio_FOUND)
  ExternalProject_Add(mio
    GIT_REPOSITORY "https://github.com/tierra-colada/mio.git"
    GIT_TAG "ce7b245ca54f62ce1e8de85764feeb1894889e56"
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
      -DBUILD_TESTING:BOOL=OFF
    DEPENDS ${DEPENDENCIES}
    )
else()
  # Add empty project that exports target mio
  ExternalProject_Add(mio
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
