vcpkg_download_distfile(PYTHON_DISTRO
    URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/pybind11_header-only_2.9.2.7z"
    FILENAME pybind11.zip
    SHA512 669a34af5557fa5f79fae3f07fc34283779be9f860396daca2921ff31546b56606753b2c8f10be71e889a525e0e75b0498a2d1d65433cae469adcb95b0d1f09d
)

vcpkg_extract_source_archive(
    "${PYTHON_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/pybind11.zip.extracted")
