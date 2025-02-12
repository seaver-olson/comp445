# Add set(CONFIG_USE_middleware_wireless_zigbee_zb_serial_link true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/serial_link_cmds_wkr.c
  ${CMAKE_CURRENT_LIST_DIR}/serial_link_wkr.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

