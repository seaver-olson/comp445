# Add set(CONFIG_USE_component_els_pkc_hmac true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_key AND CONFIG_USE_component_els_pkc_toolchain AND CONFIG_USE_component_els_pkc_padding)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_Els.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_Functions.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_Helper.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_KeyTypes.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_Modes.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/src/mcuxClHmac_Sw.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/inc
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClHmac/inc/internal
)

else()

message(SEND_ERROR "component_els_pkc_hmac dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
