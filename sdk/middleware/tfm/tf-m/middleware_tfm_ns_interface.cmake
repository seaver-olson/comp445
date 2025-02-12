# Add set(CONFIG_USE_middleware_tfm_ns_interface true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_common AND (CONFIG_USE_middleware_tfm_ns_os_wrapper_baremetal OR CONFIG_USE_middleware_tfm_ns_os_wrapper_rtos) AND ((CONFIG_USE_middleware_tfm_ns_loader_service AND (CONFIG_BOARD STREQUAL frdmrw612 OR CONFIG_BOARD STREQUAL rdrw612bga)) OR (NOT (CONFIG_NOT STREQUAL frdmrw612 OR CONFIG_NOT STREQUAL rdrw612bga))))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_crypto_api.c
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_attest_api.c
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_its_api.c
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_ps_api.c
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_platform_api.c
  ${CMAKE_CURRENT_LIST_DIR}/interface/src/tfm_psa_ns_api.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/interface/include
  ${CMAKE_CURRENT_LIST_DIR}/interface/include/crypto_keys
  ${CMAKE_CURRENT_LIST_DIR}/interface/include/psa
  ${CMAKE_CURRENT_LIST_DIR}/interface/include/psa_manifest
  ${CMAKE_CURRENT_LIST_DIR}/interface/include/psa/tfm
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DCONFIG_TFM_FLOAT_ABI=2
    -DCONFIG_TFM_ENABLE_CP10CP11
    -DCONFIG_TFM_LAZY_STACKING
    -D__DOMAIN_NS=1
    -DDOMAIN_NS=1
    -DCONFIG_TFM_USE_TRUSTZONE
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1
    -DPLATFORM_DEFAULT_CRYPTO_KEYS
    -DPS_ENCRYPTION
  )

endif()

else()

message(SEND_ERROR "middleware_tfm_ns_interface dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
