if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.3/commonlibsse-ng_x64-windows-static-md_3.2.3_0.7z"
      FILENAME commonlibsse.zip
      SHA512 a861e17381511aa576cb2a8cf60bc036f074ba66926358e1d18abe43c1f6a550dc0a23e193adafea2659b6c56c3316245381d112eb5e6ab4830963989e5a2435
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.3/commonlibsse-ng_x64-windows-static_3.2.3_0.7z"
      FILENAME commonlibsse.zip
      SHA512 a24af942f6f23cc12c39f9c20a75a0ceda15c7ae475f6e3cf3d610cdac6917db5481e429c2331fcd283a2fe2026734766122bf6a59f5693a92e92418b0fe9607
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")

message(DEPRECATION "CommonLibSSE NG prebuilds are no longer supported. Switch to `commonlibsse-ng` to get new releases.")
