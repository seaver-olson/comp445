# Add set(CONFIG_USE_middleware_wireless_framework_platform_flash_rw61x true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_wireless_framework_platform_rw61x)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/rw61x/fwk_platform_flash.c
  ${CMAKE_CURRENT_LIST_DIR}/rw61x/fwk_platform_extflash.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/rw61x
  ${CMAKE_CURRENT_LIST_DIR}/Common
)

else()

message(SEND_ERROR "middleware_wireless_framework_platform_flash_rw61x dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
