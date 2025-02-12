# Add set(CONFIG_USE_middleware_tfm_s_its_load_info_rw61x true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/rw61x/load_info_tfm_internal_trusted_storage.c
)

else()

message(SEND_ERROR "middleware_tfm_s_its_load_info_rw61x dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
