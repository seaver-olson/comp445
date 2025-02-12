# Add set(CONFIG_USE_middleware_wireless_zigbee_core_ZCL_Clusters_OTA_Client true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA.c
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA_common.c
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA_CustomCommandHandler.c
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA_CustomReceiveCommands.c
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA_client.c
  ${CMAKE_CURRENT_LIST_DIR}/Source/OTA_ClientUpgradeManager.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/Include
  ${CMAKE_CURRENT_LIST_DIR}/Source
)

