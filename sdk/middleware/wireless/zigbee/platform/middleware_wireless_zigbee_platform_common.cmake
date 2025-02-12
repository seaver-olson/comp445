# Add set(CONFIG_USE_middleware_wireless_zigbee_platform_common true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/common/console.c
  ${CMAKE_CURRENT_LIST_DIR}/common/crypto.c
  ${CMAKE_CURRENT_LIST_DIR}/common/framework/PDM/PDM_adapter_nvs.c
  ${CMAKE_CURRENT_LIST_DIR}/common/framework/PWRM/PWRM_adapter.c
  ${CMAKE_CURRENT_LIST_DIR}/common/framework/SecLib/SecLib_.c
  ${CMAKE_CURRENT_LIST_DIR}/common/framework/SecLib/aes_mmo.c
  ${CMAKE_CURRENT_LIST_DIR}/common/timer.c
)

