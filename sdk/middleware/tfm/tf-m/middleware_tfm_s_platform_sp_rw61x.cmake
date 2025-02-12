# Add set(CONFIG_USE_middleware_tfm_s_platform_sp_rw61x true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/rw61x/platform_sp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/secure_fw/partitions/platform
)

else()

message(SEND_ERROR "middleware_tfm_s_platform_sp_rw61x dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
