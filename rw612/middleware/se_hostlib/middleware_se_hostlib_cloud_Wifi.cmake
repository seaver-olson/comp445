# Add set(CONFIG_USE_middleware_se_hostlib_cloud_Wifi true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_flexcomm_i2c_freertos AND CONFIG_USE_middleware_freertos-kernel_cm33_non_trustzone)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/demos/ksdk/common
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DLPC_WIFI
  )

endif()

else()

message(SEND_ERROR "middleware_se_hostlib_cloud_Wifi dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
