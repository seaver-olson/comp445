# Add set(CONFIG_USE_driver_conn_fwloader true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_ocotp AND (CONFIG_USE_component_osa_bm OR CONFIG_USE_component_osa_free_rtos) AND (CONFIG_USE_component_mflash_rdrw610 OR CONFIG_USE_component_mflash_frdmrw612))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/fsl_loader.c
  ${CMAKE_CURRENT_LIST_DIR}/fsl_loader_utils.c
  ${CMAKE_CURRENT_LIST_DIR}/nboot_hal.c
  ${CMAKE_CURRENT_LIST_DIR}/life_cycle.c
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin/rw61x/rw61x_cpu1.c
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin/rw61x/rw61x_cpu2.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/include
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin/inc
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin/rw61x
  ${CMAKE_CURRENT_LIST_DIR}/fw_bin/script
)

else()

message(SEND_ERROR "driver_conn_fwloader.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
