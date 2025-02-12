# Add set(CONFIG_USE_middleware_tfm_ns_loader_service true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_conn_fwloader_ns)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/rw61x/partitions/loader_service/interface/src/tfm_lds_api.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/rw61x/partitions/loader_service
  ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/rw61x/partitions/loader_service/interface/include
)

else()

message(SEND_ERROR "middleware_tfm_ns_loader_service dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
