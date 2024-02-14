#header-only library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Tessil/hat-trie
  REF d0d3ff6e1ec6c835cac9b510ae8f9375babb8004
  SHA512 7903f61db7e1cb4224aeb7db58836704350be57aa3b553fe2123f6f801a709a8cc8e3122efd8db6e91dfab62668463b4a47d56eb442838ec811909739879c4ec
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_build_cmake()

file(INSTALL "${SOURCE_PATH}/include/tsl/"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include/tsl/")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
