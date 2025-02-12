# Add set(CONFIG_USE_driver_cns_io_mux true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_common AND (CONFIG_DEVICE_ID STREQUAL RW612))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

else()

message(SEND_ERROR "driver_cns_io_mux.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
