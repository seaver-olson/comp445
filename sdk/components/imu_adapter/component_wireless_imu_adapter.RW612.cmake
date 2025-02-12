# Add set(CONFIG_USE_component_wireless_imu_adapter true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_common AND CONFIG_USE_driver_gdma AND CONFIG_USE_driver_imu AND (CONFIG_USE_component_osa_bm OR CONFIG_USE_component_osa_free_rtos))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/fsl_adapter_imu.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DFSL_OSA_TASK_ENABLE=1
  )

endif()

else()

message(SEND_ERROR "component_wireless_imu_adapter.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
