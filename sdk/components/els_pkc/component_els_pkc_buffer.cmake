# Add set(CONFIG_USE_component_els_pkc_buffer true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_core AND CONFIG_USE_component_els_pkc_flow_protection AND CONFIG_USE_component_els_pkc_data_integrity AND CONFIG_USE_component_els_pkc_toolchain)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClBuffer/src/mcuxClBuffer.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClBuffer/inc
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClBuffer/inc/internal
)

else()

message(SEND_ERROR "component_els_pkc_buffer dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
