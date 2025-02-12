# Add set(CONFIG_USE_component_els_pkc true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_els AND CONFIG_USE_component_els_pkc_pkc AND CONFIG_USE_component_els_pkc_trng AND ((CONFIG_USE_component_els_pkc_platform_mcxn AND CONFIG_USE_component_els_pkc_doc_mcxn AND CONFIG_USE_component_els_pkc_static_lib_mcxn AND (CONFIG_DEVICE_ID STREQUAL MCXN546 OR CONFIG_DEVICE_ID STREQUAL MCXN547 OR CONFIG_DEVICE_ID STREQUAL MCXN946 OR CONFIG_DEVICE_ID STREQUAL MCXN947 OR CONFIG_DEVICE_ID STREQUAL MCXN235 OR CONFIG_DEVICE_ID STREQUAL MCXN236)) OR (CONFIG_USE_component_els_pkc_platform_rw61x AND CONFIG_USE_component_els_pkc_doc_rw61x AND CONFIG_USE_component_els_pkc_static_lib_rw61x AND (CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612))))

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/inc
)

else()

message(SEND_ERROR "component_els_pkc dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
