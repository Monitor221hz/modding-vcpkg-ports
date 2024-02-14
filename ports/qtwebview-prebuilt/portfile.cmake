if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtwebview_x64-windows-static-md_6.2.4.7z"
    FILENAME qtwebview.zip
    SHA512 ef0e073e882b6a8cc6e3ee9402d3a35e8fa9ae4c530b08b27215ad158b420e5dd7e88c76b103252a6873897bc992452d1debb721a30dfab443f427fb99cac5a1
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtwebview.zip.extracted")
