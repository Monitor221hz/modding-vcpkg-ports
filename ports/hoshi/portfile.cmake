#header-only library

vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/hoshi
  REF 4ddd8570beba71cecb3f13015fbe3e4b92b163c4
  SHA512 94d6178779f3fa748f478bcd85df47270081b497c9489c53db7c674eed968fffb0216bc3dde06c118d1ac3bcbd1fad909672ec5b3a0eadb55468cec1a4e9212c
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
