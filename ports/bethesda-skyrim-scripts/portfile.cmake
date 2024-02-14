get_filename_component(RegistrySkyrimPath "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Bethesda Softworks\\Skyrim Special Edition;Installed Path]" ABSOLUTE CACHE])
if (RegistrySkyrimPath)
    message("Found Skyrim Special Edition install at ${RegistrySkyrimPath}.")
else()
    get_filename_component(RegistrySkyrimPath "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Bethesda Softworks\\Skyrim VR;Installed Path]" ABSOLUTE CACHE])
    if (RegistrySkyrimPath)
        message("Found Skyrim VR install at ${RegistrySkyrimPath}.")
    else()
        message(FATAL_ERROR "No Skyrim install was found.")
    endif()
endif()
cmake_path(SET SkyrimPath ${RegistrySkyrimPath})

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${SkyrimPath}/Data/Scripts.zip"
)

file(GLOB GAME_SCRIPTS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.psc"
)
file(GLOB GAME_FLAGS
    "${CURRENT_BUILDTREES_DIR}/src/Source/Scripts/*.flg"
)

file(COPY ${GAME_SCRIPTS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skyrim"
)
file(COPY ${GAME_FLAGS}
   DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skyrim"
)
