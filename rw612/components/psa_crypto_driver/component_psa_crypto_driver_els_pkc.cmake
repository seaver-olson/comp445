# Add set(CONFIG_USE_component_psa_crypto_driver_els_pkc true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_psa_crypto_driver_els_pkc_oracle AND CONFIG_USE_component_psa_crypto_driver_els_pkc_common AND CONFIG_USE_component_psa_crypto_driver_els_pkc_transparent AND CONFIG_USE_component_psa_crypto_driver_els_pkc_opaque AND CONFIG_USE_component_els_pkc_psa_driver AND ((CONFIG_USE_driver_trng AND (CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612)) OR ((CONFIG_DEVICE_ID STREQUAL MCXN546 OR CONFIG_DEVICE_ID STREQUAL MCXN547 OR CONFIG_DEVICE_ID STREQUAL MCXN946 OR CONFIG_DEVICE_ID STREQUAL MCXN947 OR CONFIG_DEVICE_ID STREQUAL MCXN235 OR CONFIG_DEVICE_ID STREQUAL MCXN236))) AND (CONFIG_USE_component_psa_crypto_driver_osal_baremetal OR CONFIG_USE_component_psa_crypto_driver_osal_frtos) AND ((CONFIG_USE_middleware_mbedtls3x_port_psa_crypto_config AND CONFIG_USE_middleware_mbedtls3x_crypto) OR (CONFIG_USE_middleware_mbedcrypto)))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/els_pkc
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DPSA_CRYPTO_DRIVER_ELS_PKC
  )

endif()

else()

message(SEND_ERROR "component_psa_crypto_driver_els_pkc dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
