if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtwebengine_x64-windows-static-md_6.2.4.7z"
    FILENAME qtwebengine.zip
    SHA512 59c9a51d74539e5566bd27993a6cc548792be689f430b314474ea9c990d3e8f3a17b4121bc50fd6fcf81ce158d471dc398f9b394f6af282cf498b72c78761efe
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtwebengine.zip.extracted")
