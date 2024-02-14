#header-only library

vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/gluino
  REF 31064a3a77cd689965c6ee6c1e1fda1b3dc7a423
  SHA512 89202fc1e0ad355f2a7fbf2fa8735bd7df6303436d031536d8279bc7ebeaed580895de88d7025375b79c52091abafc0df24154d53e8c49819ba54b042b0efd5c
  HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "tests"                 BUILD_TESTS
        )

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
