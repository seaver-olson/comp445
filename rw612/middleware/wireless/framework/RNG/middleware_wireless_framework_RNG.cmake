# Add set(CONFIG_USE_middleware_wireless_framework_RNG true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_wireless_framework_platform_rng_rw61x OR CONFIG_USE_middleware_wireless_framework_platform_rng_connected_mcu)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/RNG.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

else()

message(SEND_ERROR "middleware_wireless_framework_RNG dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
