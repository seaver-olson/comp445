# Add set(CONFIG_USE_driver_smartcard_phy_usim true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_smartcard_usim AND (CONFIG_DEVICE_ID STREQUAL RW612) AND (CONFIG_BOARD STREQUAL rdrw612bga OR CONFIG_BOARD STREQUAL frdmrw612) AND CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/fsl_smartcard_phy_usim.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DUSING_PHY_EMVSIM
  )

endif()

else()

message(SEND_ERROR "driver_smartcard_phy_usim.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
