get_filename_component(RegistryFalloutPath "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Bethesda Softworks\\Fallout 4;Installed Path]" ABSOLUTE CACHE])
if (RegistryFalloutPath)
    message("Found Fallout 4 install at ${RegistryFalloutPath}.")
else()
    message(FATAL_ERROR "No Fallout 4 install was found.")
endif()
cmake_path(SET FalloutPath ${RegistryFalloutPath})

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${FalloutPath}/Data/Scripts.zip"
)

file(GLOB GAME_SCRIPTS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.psc"
)
file(GLOB GAME_FLAGS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.flg"
)

file(COPY ${GAME_SCRIPTS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fallout4"
)
file(COPY ${GAME_FLAGS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fallout4"
)
