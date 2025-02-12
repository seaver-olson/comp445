# Add set(CONFIG_USE_middleware_wireless_zigbee_platform_ncp_host true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/OtaSupport/Source/Posix/OtaSupport_adapter.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/PDM/Source/Posix/PDM_adapter.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/PDUM/Source/pdum.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/PDUM/Source/pdum_apl.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/PDUM/Source/pdum_dbg.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/framework/PDUM/Source/pdum_nwk.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/console.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/crypto.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/glue.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/leds.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/timer.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/uart.c
  ${CMAKE_CURRENT_LIST_DIR}/NCP_HOST/platform/Posix/wdog.c
)

