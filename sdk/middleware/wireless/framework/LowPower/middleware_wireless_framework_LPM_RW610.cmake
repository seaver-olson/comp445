# Add set(CONFIG_USE_middleware_wireless_framework_LPM_RW610 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_USE_middleware_wireless_framework_platform_lowpower_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_lowpower_connected_mcu) AND (CONFIG_USE_middleware_wireless_framework_platform_lowpower_timer_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_lowpower_timer_connected_mcu))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/PWR.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DHAL_UART_ADAPTER_LOWPOWER=1
  )

endif()

else()

message(SEND_ERROR "middleware_wireless_framework_LPM_RW610 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
