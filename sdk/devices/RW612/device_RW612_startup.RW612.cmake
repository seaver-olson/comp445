# Add set(CONFIG_USE_device_RW612_startup true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_device_RW612_system)

if(CONFIG_TOOLCHAIN STREQUAL iar)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/iar/startup_RW612.s "" device_RW612_startup.RW612)
endif()

if(CONFIG_TOOLCHAIN STREQUAL armgcc)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/gcc/startup_RW612.S "" device_RW612_startup.RW612)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mdk)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/arm/startup_RW612.S "" device_RW612_startup.RW612)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/mcuxpresso/startup_rw612.c "" device_RW612_startup.RW612)
  add_config_file(${CMAKE_CURRENT_LIST_DIR}/mcuxpresso/startup_rw612.cpp "" device_RW612_startup.RW612)
endif()

else()

message(SEND_ERROR "device_RW612_startup.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
