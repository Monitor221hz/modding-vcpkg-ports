if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtbase_x64-windows-static-md_6.2.4.7z"
    FILENAME qtbase.zip
    SHA512 f590d62b444da8a391dda1a970978563891ac868ec213d4041e9a599a0917cc017b4822d3960259b3a364cd63a267412443f4f241b42a21b5f4e009cc0248284
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtbase.zip.extracted")
