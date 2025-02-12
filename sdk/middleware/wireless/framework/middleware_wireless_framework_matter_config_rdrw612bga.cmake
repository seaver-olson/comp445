# Add set(CONFIG_USE_middleware_wireless_framework_matter_config_rdrw612bga true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/boards/rdrw612bga/board.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rdrw612bga/board_comp.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rdrw612bga/board_lp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/boards/rdrw612bga
  ${CMAKE_CURRENT_LIST_DIR}/Common/devices/rdrw612bga/gcc
)

