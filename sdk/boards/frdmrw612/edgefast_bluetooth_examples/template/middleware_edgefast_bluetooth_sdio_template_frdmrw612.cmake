# Add set(CONFIG_USE_middleware_edgefast_bluetooth_sdio_template_frdmrw612 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW612) AND (CONFIG_BOARD STREQUAL frdmrw612))

else()

message(SEND_ERROR "middleware_edgefast_bluetooth_sdio_template_frdmrw612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
