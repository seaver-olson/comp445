# Add set(CONFIG_USE_middleware_wireless_framework_platform_common_rw61x true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/rw61x/fwk_platform_hdlc.c
  ${CMAKE_CURRENT_LIST_DIR}/rw61x/fwk_platform_coex.c
  ${CMAKE_CURRENT_LIST_DIR}/rw61x/fwk_platform_ot.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/include
)

