# Add set(CONFIG_USE_component_els_pkc_oscca true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_oscca_aeadmodes AND CONFIG_USE_component_els_pkc_oscca_ciphermodes AND CONFIG_USE_component_els_pkc_oscca_macmodes AND CONFIG_USE_component_els_pkc_oscca_randommodes AND CONFIG_USE_component_els_pkc_oscca_sm2 AND CONFIG_USE_component_els_pkc_oscca_sm3 AND CONFIG_USE_component_els_pkc_oscca_sm4 AND CONFIG_USE_component_els_pkc_oscca_pkc AND CONFIG_USE_component_els_pkc_oscca_safo AND CONFIG_USE_component_els_pkc_signature AND CONFIG_USE_component_els_pkc_crc)

else()

message(SEND_ERROR "component_els_pkc_oscca dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
