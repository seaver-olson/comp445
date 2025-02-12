# Add set(CONFIG_USE_component_els_pkc_platform_rw61x_interface_files true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_platform_rw61x_inf_header_only AND (CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/src/platforms/rw61x/mcux_els.c
  ${CMAKE_CURRENT_LIST_DIR}/src/platforms/rw61x/mcux_pkc.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/platforms/rw61x
)

else()

message(SEND_ERROR "component_els_pkc_platform_rw61x_interface_files dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
