# Add set(CONFIG_USE_middleware_wireless_coex true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/app_services_init.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/board.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/clock_config.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/hardware_init.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/peripherals.c
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612/pin_mux.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/coex_app/main.c
  ${CMAKE_CURRENT_LIST_DIR}/src/common/controller_coex_nxp.c
  ${CMAKE_CURRENT_LIST_DIR}/src/common/host_msd_fatfs.c
  ${CMAKE_CURRENT_LIST_DIR}/src/edgefast/coex_shell.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/boards/rw612
  ${CMAKE_CURRENT_LIST_DIR}/cmake
  ${CMAKE_CURRENT_LIST_DIR}/cmake/platform/rw612
  ${CMAKE_CURRENT_LIST_DIR}/cmake/toolchain
  ${CMAKE_CURRENT_LIST_DIR}/examples
  ${CMAKE_CURRENT_LIST_DIR}/examples/coex_app
  ${CMAKE_CURRENT_LIST_DIR}/examples/linker
  ${CMAKE_CURRENT_LIST_DIR}/script
  ${CMAKE_CURRENT_LIST_DIR}/src
  ${CMAKE_CURRENT_LIST_DIR}/src/common
  ${CMAKE_CURRENT_LIST_DIR}/src/configs
  ${CMAKE_CURRENT_LIST_DIR}/src/configs/ble
  ${CMAKE_CURRENT_LIST_DIR}/src/configs/lwip
  ${CMAKE_CURRENT_LIST_DIR}/src/configs/mbedtls
  ${CMAKE_CURRENT_LIST_DIR}/src/configs/platform
  ${CMAKE_CURRENT_LIST_DIR}/src/configs/wifi
  ${CMAKE_CURRENT_LIST_DIR}/src/edgefast
  ${CMAKE_CURRENT_LIST_DIR}/third_party
  ${CMAKE_CURRENT_LIST_DIR}/third_party/mcu-sdk
)

