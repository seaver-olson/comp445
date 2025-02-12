# Add set(CONFIG_USE_middleware_lwip_sys_arch_dynamic true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_lwip_template)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/port/sys_arch/dynamic/sys_arch.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/port
  ${CMAKE_CURRENT_LIST_DIR}/port/sys_arch/dynamic
)

else()

message(SEND_ERROR "middleware_lwip_sys_arch_dynamic dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
