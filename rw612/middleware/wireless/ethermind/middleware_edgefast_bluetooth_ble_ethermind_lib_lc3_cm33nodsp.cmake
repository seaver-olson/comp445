# Add set(CONFIG_USE_middleware_edgefast_bluetooth_ble_ethermind_lib_lc3_cm33nodsp true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_CORE STREQUAL cm33) AND CONFIG_USE_middleware_edgefast_bluetooth_ble_ethermind_cm33nodsp)

else()

message(SEND_ERROR "middleware_edgefast_bluetooth_ble_ethermind_lib_lc3_cm33nodsp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
