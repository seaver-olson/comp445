# Add set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_mqtt_client true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_lwip_enet OR CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_lwip_wifi)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/ex/src/utils/iot_agent_mqtt_freertos.c
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/src/protobuf/pb_common.c
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/src/protobuf/pb_decode.c
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/src/protobuf/ServiceDescriptor.pb.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/inc
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/ex/inc
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/src/protobuf
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DPB_FIELD_32BIT
    -DIOT_AGENT_MQTT_ENABLE=1
  )

endif()

else()

message(SEND_ERROR "middleware_se_hostlib_nxp_iot_agent_mqtt_client dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
