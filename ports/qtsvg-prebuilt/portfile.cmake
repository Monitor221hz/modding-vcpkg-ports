if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtsvg_x64-windows-static-md_6.2.4.7z"
    FILENAME qtsvg.zip
    SHA512 5f14bb18b4892400ac4aaaa5506cb5d007329969f3f1d7d0dd7b115dbee0424025d4e899ce265951e37ad0d0206810681a1f92ff4a684b420bb7cef851ea67f6
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtsvg.zip.extracted")
