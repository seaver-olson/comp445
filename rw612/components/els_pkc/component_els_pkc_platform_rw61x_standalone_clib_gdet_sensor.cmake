# Add set(CONFIG_USE_component_els_pkc_platform_rw61x_standalone_clib_gdet_sensor true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612) AND CONFIG_USE_component_els_pkc_els_header_only AND CONFIG_USE_component_els_pkc_els_common AND CONFIG_USE_component_els_pkc_memory AND CONFIG_USE_component_els_pkc_standalone_gdet AND CONFIG_USE_component_els_pkc_platform_rw61x_inf_header_only AND CONFIG_USE_component_els_pkc_buffer)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/platforms/rw61x
)

else()

message(SEND_ERROR "component_els_pkc_platform_rw61x_standalone_clib_gdet_sensor dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
