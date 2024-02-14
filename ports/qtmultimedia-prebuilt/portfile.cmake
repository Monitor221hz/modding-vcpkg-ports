if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtmultimedia_x64-windows-static-md_6.2.4.7z"
    FILENAME qtmultimedia.zip
    SHA512 50fdd7b4700ad17592ae7980c74b8e68364627bd6e5185a0601db2758b6cd65c45da21df97892961b1c4db6b9a17c9c36f3c81ae00e53cb47a6d6d1c197385b6
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtmultimedia.zip.extracted")
