cmake_minimum_required(VERSION 2.8)

PROJECT("wxwidgets")

INCLUDE(ExternalProject)


SET(MUHKUH_WIN32_INSTALL "/tmp/wxwidgets/windows_x86")
SET(MUHKUH_WIN64_INSTALL "/tmp/wxwidgets/windows_amd64")

# The version number is a combination of the wxWidget version and the packaging.
# The major and minor numbers are taken from the wxWidget version, i.e. wxWidgets 3.0.2
# results in the package version 3.0 .
# The patch version of the package indicates...
#  1) updates of the wxWidgets source in the same major and minor, e.g. 3.0.2 -> 3.0.3
#  2) updates of the packaging
#
SET(CPACK_PACKAGE_VERSION_MAJOR 3)
SET(CPACK_PACKAGE_VERSION_MINOR 0)
SET(CPACK_PACKAGE_VERSION_PATCH 0)
SET(VERSION_FULL ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH})


SET(PACKAGE_CMAKE_ARGS "")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DMUHKUH_WIN32_INSTALL=${MUHKUH_WIN32_INSTALL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DMUHKUH_WIN64_INSTALL=${MUHKUH_WIN64_INSTALL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_MAJOR=${CPACK_PACKAGE_VERSION_MAJOR}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_MINOR=${CPACK_PACKAGE_VERSION_MINOR}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_PATCH=${CPACK_PACKAGE_VERSION_PATCH}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DVERSION_FULL=${VERSION_FULL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DARTIFACT_LISTS_OUTPUT=${CMAKE_CURRENT_BINARY_DIR}/artifacts")

ExternalProject_Add(TARGET_wxwidgets
                    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/wxwidgets
                    CMAKE_ARGS ${PACKAGE_CMAKE_ARGS}
                    INSTALL_COMMAND make package
)

# Create a copy of the artifacts without a version number in the filename.
# This allows easy deploy to GitHub.
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/TARGET_wxwidgets-prefix/src/TARGET_wxwidgets-build/wxwidgets${MY_TARGET_BITS}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}.zip
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
        RENAME wxwidgets${MY_TARGET_BITS}.zip)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/TARGET_wxwidgets-prefix/src/TARGET_wxwidgets-build/ivy-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}.xml
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
        RENAME ivy.xml)

#----------------------------------------------------------------------------

