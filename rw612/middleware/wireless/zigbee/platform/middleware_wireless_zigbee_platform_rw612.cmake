# Add set(CONFIG_USE_middleware_wireless_zigbee_platform_rw612 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/buttons.c
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/glue.c
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/leds.c
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/rw61x_cpu2.c
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/uart.c
  ${CMAKE_CURRENT_LIST_DIR}/RW612/platform/wdog.c
)

