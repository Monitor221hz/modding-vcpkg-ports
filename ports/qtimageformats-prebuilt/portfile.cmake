if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(FATAL_ERROR "Warning: Prebuilt Qt libraries can only be linked dynamically.")
endif ()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_download_distfile(QT_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/qtimageformats_x64-windows-static-md_6.2.4.7z"
    FILENAME qtimageformats.zip
    SHA512 9b1401144fdd584cdf4efc993e08a51388acd2d5507ad33a91d9cdee4a2f6cb8caba30ddc4f624158d517552fb7cc9a5440ed365b816823a0fa8b67aad128252
)

vcpkg_extract_source_archive(
    "${QT_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/qtimageformats.zip.extracted")
