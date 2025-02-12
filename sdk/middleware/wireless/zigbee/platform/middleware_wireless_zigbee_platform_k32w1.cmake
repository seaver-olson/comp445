# Add set(CONFIG_USE_middleware_wireless_zigbee_platform_k32w1 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/framework/PDM/PDM_adapter.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/framework/PWRM/PWRM_adapter.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/framework/SecLib/SecLib_.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/framework/SecLib/aes_mmo.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/buttons.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/console.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/crypto.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/glue.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/leds.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/timer.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/uart.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/uart_hal.c
  ${CMAKE_CURRENT_LIST_DIR}/K32W1/platform/wdog.c
)

