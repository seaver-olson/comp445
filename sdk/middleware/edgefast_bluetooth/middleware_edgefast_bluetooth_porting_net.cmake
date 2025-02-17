# Add set(CONFIG_USE_middleware_edgefast_bluetooth_porting_net true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_edgefast_bluetooth_pal)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/source/porting/buf.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/source/porting
  ${CMAKE_CURRENT_LIST_DIR}/include
)

else()

message(SEND_ERROR "middleware_edgefast_bluetooth_porting_net dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
