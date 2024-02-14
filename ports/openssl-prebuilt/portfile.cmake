if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
    if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
        vcpkg_download_distfile(OPENSSL_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/openssl_x64-windows_3.0.2_1.7z"
            FILENAME openssl.zip
            SHA512 c3118333954975d2a5e726d12f40d18196335e6812f0578fafc2cf161aa8ff923c8c08e891cb4c128620168a5954d357cd83e4b0a006fe51ac3cb4ad05514423
        )
    else ()
        vcpkg_download_distfile(OPENSSL_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/openssl_x64-windows-static-md_3.0.2_1.7z"
            FILENAME openssl.zip
            SHA512 c4375d4785207149fe27ce4fa1564527b2afd51812e7ac14d344b6237277dfb3e85815091b8ccb0724b1128af545b91df6a39a0152e0af921cfccc50fc3d6572
        )
    endif ()
else ()
    if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
        vcpkg_download_distfile(OPENSSL_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/openssl_x64-windows-mt_3.0.2_1.7z"
            FILENAME openssl.zip
            SHA512 4f85ff7810ee1e3889f686124ec8610da12578bf3447676464e70ca1eca9f4fcf67707fd11ecf8c05800c364e89e2da7c803f26903308abc7dbf64384c1234ca
        )
    else ()
        vcpkg_download_distfile(OPENSSL_DISTRO
            URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/openssl_x64-windows-static_3.0.2_1.7z"
            FILENAME openssl.zip
            SHA512 83f5d192c6e911911dbe7bfec2e236c0f9a947c4b294f3980df420c601f50036ad25b1f7a38a7604d3e6b6b46f9fb1e5f4158ca03d4e1eca21c851ab30d22867
        )
    endif ()
endif ()

vcpkg_extract_source_archive(
    "${OPENSSL_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/openssl.zip.extracted")
