# Add set(CONFIG_USE_middleware_mbedtls3x_port_rng true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_mbedtls3x AND CONFIG_USE_middleware_mbedtls3x_port_config AND ((CONFIG_USE_driver_trng AND CONFIG_USE_middleware_mbedtls3x_port_hw_init AND (CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612)) OR (CONFIG_USE_middleware_secure-subsystem_elemu AND CONFIG_USE_middleware_secure-subsystem_elemu_port_kw45_k4w1 AND CONFIG_USE_driver_elemu AND (CONFIG_DEVICE_ID STREQUAL KW45B41Z83xxxA OR CONFIG_DEVICE_ID STREQUAL K32W1480xxxA OR CONFIG_DEVICE_ID STREQUAL MCXW716CxxxA OR CONFIG_DEVICE_ID STREQUAL MCXW716AxxxA)) OR (NOT (CONFIG_NOT STREQUAL KW45B41Z83xxxA OR CONFIG_NOT STREQUAL RW610 OR CONFIG_NOT STREQUAL RW612 OR CONFIG_NOT STREQUAL MIMXRT1189xxxxx OR CONFIG_NOT STREQUAL MIMXRT1187xxxxx OR CONFIG_NOT STREQUAL K32W1480xxxA OR CONFIG_NOT STREQUAL MCXW716CxxxA OR CONFIG_NOT STREQUAL MCXW716AxxxA))))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/port/rng/psa_mcux_entropy.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/port/rng
)

else()

message(SEND_ERROR "middleware_mbedtls3x_port_rng dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
