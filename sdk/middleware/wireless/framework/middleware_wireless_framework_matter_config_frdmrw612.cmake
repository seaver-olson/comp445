# Add set(CONFIG_USE_middleware_wireless_framework_matter_config_frdmrw612 true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/board.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/board_comp.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612/board_lp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/boards/frdmrw612
  ${CMAKE_CURRENT_LIST_DIR}/Common/devices/frdmrw612/gcc
)

