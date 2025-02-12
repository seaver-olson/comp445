# Add set(CONFIG_USE_middleware_edgefast_bluetooth_common_ethermind_hci_platform true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_edgefast_bluetooth_common_ethermind AND (CONFIG_DEVICE_ID STREQUAL RW612) AND CONFIG_USE_middleware_edgefast_bluetooth_rw610_controller)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/port/pal/mcux/bluetooth/hci_platform.c
)

else()

message(SEND_ERROR "middleware_edgefast_bluetooth_common_ethermind_hci_platform dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
