# Add set(CONFIG_USE_middleware_wireless_framework_NVS true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_USE_middleware_wireless_framework_platform_ota_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_ota_connected_mcu) AND (CONFIG_USE_middleware_wireless_framework_platform_extflash_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_extflash_connected_mcu) AND ((CONFIG_USE_middleware_wireless_framework_NVS_Internal AND (CONFIG_DEVICE_ID STREQUAL K32W1480xxxA OR CONFIG_DEVICE_ID STREQUAL KW45B41Z52xxxA OR CONFIG_DEVICE_ID STREQUAL KW45B41Z53xxxA OR CONFIG_DEVICE_ID STREQUAL KW45B41Z82xxxA OR CONFIG_DEVICE_ID STREQUAL KW45B41Z83xxxA OR CONFIG_DEVICE_ID STREQUAL MCXW716CxxxA OR CONFIG_DEVICE_ID STREQUAL MCXW716AxxxA)) OR ((CONFIG_DEVICE_ID STREQUAL RW612 OR CONFIG_DEVICE_ID STREQUAL RW610))))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source/nvs.c
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source/fwk_nvs_flash.c
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source/fwk_nvs_stats.c
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source/fwk_nvs_ExternalFlash.c
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source/crc8.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Interface
  ${CMAKE_CURRENT_LIST_DIR}/framework/NVS/Source
)

else()

message(SEND_ERROR "middleware_wireless_framework_NVS dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
