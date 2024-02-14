if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtdeclarative_x64-windows-static-md_6.2.4.7z"
    FILENAME qtdeclarative.zip
    SHA512 e1e113f1b0ebbc4d3a0f616e786d4c5d597b1659ea63736cdde3819e5944a59c8a2ba39d7fb437959171276f3f6380c0af1a5144f659b11c53cf6fa24ffd7eb6
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtdeclarative.zip.extracted")
