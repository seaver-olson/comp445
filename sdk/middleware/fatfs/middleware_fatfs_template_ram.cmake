# Add set(CONFIG_USE_middleware_fatfs_template_ram true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_middleware_fatfs_ram)

add_config_file(${CMAKE_CURRENT_LIST_DIR}/template/ram/ffconf.h ${CMAKE_CURRENT_LIST_DIR}/template/ram middleware_fatfs_template_ram)

else()

message(SEND_ERROR "middleware_fatfs_template_ram dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
