# Add set(CONFIG_USE_middleware_wireless_framework_board_base_frdmrw612 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/board.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/clock_config.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/hardware_init.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/pin_mux.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612
)

