# Add set(CONFIG_USE_middleware_edgefast_bluetooth_mcux_linker_template_frdmrw612 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW612) AND (CONFIG_BOARD STREQUAL frdmrw612))

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/end_text.ldt
      ${CMAKE_CURRENT_LIST_DIR}/main_data.ldt
      ${CMAKE_CURRENT_LIST_DIR}/main_text.ldt
      ${CMAKE_CURRENT_LIST_DIR}/symbols.ldt
  )
endif()

else()

message(SEND_ERROR "middleware_edgefast_bluetooth_mcux_linker_template_frdmrw612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
