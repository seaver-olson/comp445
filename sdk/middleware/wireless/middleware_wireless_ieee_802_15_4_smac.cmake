# Add set(CONFIG_USE_middleware_wireless_ieee_802_15_4_smac true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/smac/source/SMAC.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/smac/source
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/smac/common
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/smac/interface
)

