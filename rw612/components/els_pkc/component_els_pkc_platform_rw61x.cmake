# Add set(CONFIG_USE_component_els_pkc_platform_rw61x true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612) AND CONFIG_USE_component_els_pkc_platform_rw61x_interface_files AND CONFIG_USE_component_els_pkc AND CONFIG_USE_component_els_pkc_trng_type_rng4 AND CONFIG_USE_component_els_pkc_standalone_gdet AND CONFIG_USE_component_els_pkc_random_modes_ctr)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/platforms/rw61x
)

else()

message(SEND_ERROR "component_els_pkc_platform_rw61x dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
