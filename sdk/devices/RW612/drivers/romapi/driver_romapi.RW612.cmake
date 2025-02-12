# Add set(CONFIG_USE_driver_romapi true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_driver_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/bootloader/fsl_romapi.c
  ${CMAKE_CURRENT_LIST_DIR}/otp/fsl_romapi_otp.c
  ${CMAKE_CURRENT_LIST_DIR}/nboot/fsl_romapi_nboot.c
  ${CMAKE_CURRENT_LIST_DIR}/flexspi/fsl_romapi_flexspi.c
  ${CMAKE_CURRENT_LIST_DIR}/iap/fsl_romapi_iap.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/bootloader
  ${CMAKE_CURRENT_LIST_DIR}/otp
  ${CMAKE_CURRENT_LIST_DIR}/nboot
  ${CMAKE_CURRENT_LIST_DIR}/flexspi
  ${CMAKE_CURRENT_LIST_DIR}/iap
  ${CMAKE_CURRENT_LIST_DIR}/.
)

else()

message(SEND_ERROR "driver_romapi.RW612 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
