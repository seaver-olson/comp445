# Add set(CONFIG_USE_middleware_wireless_framework_sec_lib_mbedtls_m33_nodsp true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_USE_middleware_wireless_framework_platform_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_connected_mcu) AND (CONFIG_USE_middleware_wireless_framework_mbedtls_config_rw61x OR CONFIG_USE_middleware_wireless_framework_mbedtls_config_connected_mcu))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/SecLib_mbedTLS.c
  ${CMAKE_CURRENT_LIST_DIR}/SecLib_aes_mmo.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL iar OR CONFIG_TOOLCHAIN STREQUAL mdk))
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/lib_crypto_m33_nodsp.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_wireless_framework_sec_lib_mbedtls_m33_nodsp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
