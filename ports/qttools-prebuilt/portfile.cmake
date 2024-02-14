if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qttools_x64-windows_6.2.4.7z"
    FILENAME qttools.zip
    SHA512 b22501ef70ffccb56b1cbe24bfe909afb78f3bf7659683cad61408d9d9af682944ad4bc2f7d2aae7a7bbed96d3678161ee5893af2eb3a78b4141fc42c7c8add6
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qttools.zip.extracted")
