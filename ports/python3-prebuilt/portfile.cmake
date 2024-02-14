set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
    if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
        vcpkg_download_distfile(PYTHON_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/python3_x64-windows_3.10.2_1.7z"
            FILENAME python3.zip
            SHA512 f4969d598db53e90af82bb2d7d9b80e97185f05520666c7092e207f9150a4889e96455ee7eaea00055cec67c029488b0de07ea5a6fe18c20dedd77b91ab126c5
        )
    else ()
        vcpkg_download_distfile(PYTHON_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/python3_x64-windows-static-md_3.10.2_1.7z"
            FILENAME python3.zip
            SHA512 5c20acee3969b8c535b908147f41d6f4c1c61a7fdb1f12a8e8c2f4e09c4c72eaa9bc742b72ddd8241662cb983f3141c2772699afdb1ac4f7921a3a4729bee1b7
        )
    endif ()
else ()
    if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
        vcpkg_download_distfile(PYTHON_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/python3_x64-windows-mt_3.10.2_1.7z"
            FILENAME python3.zip
            SHA512 38096b4fa86b6c10ceb37580a20fcd63df99486a2aa9ddf68d6ff7d08194a6f4b22e2b9c7880a782853ad0b1d7313c77bbb053ca6295a4122027662bb7d18dfe
        )
    else ()
        vcpkg_download_distfile(PYTHON_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/python3_x64-windows-static_3.10.2_1.7z"
            FILENAME python3.zip
            SHA512 07e007bd49bf5a3acb093fb100979383ac3a3e885c81f636a854ba87f74e313965a3043977e56e7d24b83dfef6bafa9fe159675de5475c7c68e66be9572cfb50
        )
    endif ()
endif ()

vcpkg_extract_source_archive(
    "${PYTHON_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/python3.zip.extracted")
