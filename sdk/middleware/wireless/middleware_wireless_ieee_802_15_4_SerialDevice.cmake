# Add set(CONFIG_USE_middleware_wireless_ieee_802_15_4_SerialDevice true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/ieee_802_15_4/phy/source/SerialDevice/ASP.c
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/ieee_802_15_4/phy/source/SerialDevice/Phy.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/ieee-802.15.4/ieee_802_15_4/phy/source/SerialDevice
)

