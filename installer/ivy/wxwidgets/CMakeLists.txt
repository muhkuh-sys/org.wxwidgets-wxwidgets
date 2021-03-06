cmake_minimum_required(VERSION 2.8)

SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME wxwidgets${MY_TARGET_BITS}-${VERSION_FULL})

SET(CPACK_GENERATOR "ZIP")
INCLUDE(CPack)

# Build the ivy file.
CONFIGURE_FILE(ivy.xml ivy-${VERSION_FULL}.xml)

#-----------------------------------------------------------------------------
#
# Install the 32bit files.
#
IF( ${MY_TARGET_BITS} EQUAL 32)
	INSTALL(DIRECTORY ${MUHKUH_WIN32_INSTALL}
	        DESTINATION .
	)
ENDIF( ${MY_TARGET_BITS} EQUAL 32)

#-----------------------------------------------------------------------------
#
# Install the 64bit files.
#
IF( ${MY_TARGET_BITS} EQUAL 64)
	INSTALL(DIRECTORY ${MUHKUH_WIN64_INSTALL}
	        DESTINATION .
	)
ENDIF( ${MY_TARGET_BITS} EQUAL 64)

#-----------------------------------------------------------------------------
#
# Filter the pom.xml file.
#
SET(POM_ARTIFACT_ID  "wxwidgets${MY_TARGET_BITS}")
SET(POM_GROUP_ID     "wxwidgets.org")
SET(POM_VERSION      "${VERSION_FULL}")
SET(POM_PACKAGING    "zip")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/../pom.xml pom.xml)


#-----------------------------------------------------------------------------
#
# Filter the artifacts.xml file.
#
SET(ARTIFACT_DIRECTORY    "${CMAKE_CURRENT_BINARY_DIR}")
SET(ARTIFACT_ARTIFACT_ID  "wxwidgets${MY_TARGET_BITS}")
SET(ARTIFACT_GROUP_ID     "wxwidgets.org")
SET(ARTIFACT_VERSION      "${VERSION_FULL}_${MY_TARGET_BITS}")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/../artifacts.xml ${ARTIFACT_LISTS_OUTPUT}/artifacts_wxwidgets.xml)

