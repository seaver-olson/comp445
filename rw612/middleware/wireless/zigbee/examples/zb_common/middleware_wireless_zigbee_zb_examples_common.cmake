# Add set(CONFIG_USE_middleware_wireless_zigbee_zb_examples_common true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/app_leds.c
  ${CMAKE_CURRENT_LIST_DIR}/app_zigbee_config.c
  ${CMAKE_CURRENT_LIST_DIR}/app_buttons.c
  ${CMAKE_CURRENT_LIST_DIR}/app_console.c
  ${CMAKE_CURRENT_LIST_DIR}/app_uart.c
  ${CMAKE_CURRENT_LIST_DIR}/app_crypto.c
)

