if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(STATUS "Note: Fully Dynamic Game Engine overrides static library linkage to dynamic to build its DLL; you can still statically link to Trueflame/Hopesfire.")
endif ()
set(VCPKG_LIBRARY_LINKAGE dynamic)

vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/fully-dynamic-game-engine
  REF 7e2bd3fe4d9effae74014606b12b1640fca43b3a
  SHA512 9bccc98c9c91b5c2659ecd828a9f069645467cb7c60ae212ac797d61b10cffd898f3b6cf508a297b628ff119d1cf9fe231b952425ee5d0c5877163bd583d5f5a
  HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "trueflame"             BUILD_TRUEFLAME
        "black-book"            BUILD_BLACK_BOOK
        "black-book-scripts"    INSTALL_BLACK_BOOK_SCRIPTS
        "hopesfire"             BUILD_HOPESFIRE
        )

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS ${FEATURE_OPTIONS}
  MAYBE_UNUSED_VARIABLES INSTALL_BLACK_BOOK_SCRIPTS
)
vcpkg_install_cmake()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME FullyDynamicGameEngine CONFIG_PATH share)

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine")
file(REMOVE "${CURRENT_PACKAGES_DIR}/lib/FullyDynamicGameEngine.dll")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/lib/FullyDynamicGameEngine.dll")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

if (INSTALL_BLACK_BOOK_SCRIPTS)
  file(GLOB FDGE_SCRIPTS
    "${SOURCE_PATH}/contrib/Distribution/Scripts/Source/*.psc"
  )
  file(INSTALL ${FDGE_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fully-dynamic-game-engine"
  )

  file(GLOB FDGE_TEST_SCRIPTS
    "${SOURCE_PATH}/contrib/PapyrusTestSources/*.psc"
  )
  file(INSTALL ${FDGE_TEST_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fully-dynamic-game-engine"
  )
endif ()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
