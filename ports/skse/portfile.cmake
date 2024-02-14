vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "plugin"              BUILD_PLUGIN
        "scripts"             INSTALL_SCRIPTS
        "internal-xbyak"      INSTALL_INTERNAL_XBYAK
        )

if (BUILD_PLUGIN)
  if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(WARNING "Warning: SKSE only supports static linkage, overriding setting.")
  endif ()
  if (VCPKG_CRT_LINKAGE STREQUAL dyanmic)
    message(WARNING "Warning: SKSE only supports static linkage against CRT, overriding setting.")
  endif ()
  set(VCPKG_LIBRARY_LINKAGE static)
  set(VCPKG_CRT_LINKAGE static)

  vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ianpatt/skse64
    REF v2.2.3
    SHA512 c7c0ebc2182c2397d9f54080a7efc1296a909a08c99f63bfc4529f0126f51cc181ae5a502eddbd468ac31ca6b04c566eadb57e379ec1e35bfd28b50e4d3aa7c7
    HEAD_REF master
  )

  vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
  )

  vcpkg_install_cmake()
  vcpkg_copy_pdbs()
  vcpkg_cmake_config_fixup(
    PACKAGE_NAME skse64
    CONFIG_PATH "lib/cmake/skse64"
  )

  file(
    INSTALL "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/skse64/skse64-config.cmake"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64"
  )

  file(GLOB SKSE_CMAKE_FILES
    "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-*/skse64/CMakeFiles/Export/**/*.cmake"
  )
  file(
    INSTALL ${SKSE_CMAKE_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64"
  )

  file(GLOB SKSE_COMMON_CMAKE_FILES
    "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-*/skse64_common/CMakeFiles/Export/**/*.cmake"
  )
  file(
    INSTALL ${SKSE_CMAKE_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64_common"
  )

  file(GLOB SKSE_LOADER_COMMON_CMAKE_FILES
  "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-*/skse64_loader/skse64_loader_common/CMakeFiles/Export/**/*.cmake"
  )
  file(
    INSTALL ${SKSE_LOADER_COMMON_CMAKE_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64_loader_common"
  )

  file(
    INSTALL "${SOURCE_PATH}/skse64_license.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
  )
  if (NOT INSTALL_INTERNAL_XBYAK)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/xbyak")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/xbyak")
  endif()
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
  # We do want the DLLs even if we're compiling static, so this is commented out
  # if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
  #   file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
  # endif()
endif()

if (INSTALL_SCRIPTS)
  vcpkg_download_distfile(SKSE_DISTRO
    URLS "https://skse.silverlock.org/beta/skse64_2_02_03.7z"
    FILENAME skse64_2_2_3.zip
    SHA512 b57f33bf673c70b98c33d686c1bb28ce985719ab83cf4968bd0d4f9ee594126108fae1b825febab0dc3419cc19e3c72e1729d66d47367c80f406ca5e8aef9485
  )

  vcpkg_extract_source_archive(
      "${SKSE_DISTRO}"
  )

  file(GLOB SKSE_SCRIPTS
    "${CURRENT_BUILDTREES_DIR}/src/skse64_2_02_03/Data/Scripts/Source/*.psc"
  )

  file(COPY ${SKSE_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skse"
  )

  if (NOT BUILD_PLUGIN)
    file(
      INSTALL "${CURRENT_BUILDTREES_DIR}/src/skse64_2_02_03/src/skse64/skse64_license.txt"
      DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
      RENAME copyright
    )
  endif()
endif()
