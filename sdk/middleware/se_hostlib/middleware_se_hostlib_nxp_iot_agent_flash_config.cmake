# Add set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_flash_config true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_flash_config_frdmrw612 AND (CONFIG_BOARD STREQUAL frdmrw612)) OR (CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_flash_config_rdrw612 AND (CONFIG_BOARD STREQUAL rdrw612bga)))

else()

message(SEND_ERROR "middleware_se_hostlib_nxp_iot_agent_flash_config dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
