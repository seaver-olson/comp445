# CROSS COMPILER SETTING
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.10.0)

# THE VERSION NUMBER
SET (MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION 2)
SET (MCUXPRESSO_CMAKE_FORMAT_MINOR_VERSION 0)

include(ide_overrides.cmake OPTIONAL)

if(CMAKE_SCRIPT_MODE_FILE)
  message("${MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION}")
  return()
endif()


set(CMAKE_STATIC_LIBRARY_PREFIX)
set(CMAKE_STATIC_LIBRARY_SUFFIX)

set(CMAKE_EXECUTABLE_LIBRARY_PREFIX)
set(CMAKE_EXECUTABLE_LIBRARY_SUFFIX)

# CURRENT DIRECTORY
set(ProjDirPath ${CMAKE_CURRENT_SOURCE_DIR})

set(EXECUTABLE_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})
set(LIBRARY_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})


project(ncp_device)

enable_language(ASM)

set(MCUX_BUILD_TYPES flash_release flash_debug)

set(MCUX_SDK_PROJECT_NAME ncp_device.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${ProjDirPath}/../../../../..)
endif()

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_executable(${MCUX_SDK_PROJECT_NAME} 
"${ProjDirPath}/../main.c"
"${ProjDirPath}/../lwipopts.h"
"${ProjDirPath}/../lwippools.h"
"${ProjDirPath}/../lwiphooks.h"
"${ProjDirPath}/../controller_coex_nxp.c"
"${ProjDirPath}/../ncp_system.h"
"${ProjDirPath}/../ncp_system.c"
"${ProjDirPath}/../ncp_glue_system.h"
"${ProjDirPath}/../ncp_glue_system.c"
"${ProjDirPath}/../wifi/ncp_wifi.c"
"${ProjDirPath}/../wifi/ncp_wifi.h"
"${ProjDirPath}/../wifi/ncp_glue_wifi.c"
"${ProjDirPath}/../wifi/ncp_glue_wifi.h"
"${ProjDirPath}/../wifi/wifi_config.h"
"${ProjDirPath}/../ble/gap.c"
"${ProjDirPath}/../ble/gatt.c"
"${ProjDirPath}/../ble/l2cap.c"
"${ProjDirPath}/../ble/ncp_ble.c"
"${ProjDirPath}/../ble/ncp_ble.h"
"${ProjDirPath}/../ble/ncp_glue_ble.c"
"${ProjDirPath}/../ble/ncp_glue_ble.h"
"${ProjDirPath}/../ble/ble_config.h"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_hrs.c"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_hrs.h"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_hts.c"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_hts.h"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_ncs.c"
"${ProjDirPath}/../ble/service/gatt_server/peripheral_ncs.h"
"${ProjDirPath}/../ble/service/gatt_client/central_hrc.c"
"${ProjDirPath}/../ble/service/gatt_client/central_hrc.h"
"${ProjDirPath}/../ble/service/gatt_client/central_htc.c"
"${ProjDirPath}/../ble/service/gatt_client/central_htc.h"
"${ProjDirPath}/../ble/service/bas.c"
"${ProjDirPath}/../ble/service/bas.h"
"${ProjDirPath}/../ble/service/service.c"
"${ProjDirPath}/../ble/service/service.h"
"${ProjDirPath}/../ncp_cmd_common.h"
"${ProjDirPath}/../ncp_cmd_system.h"
"${ProjDirPath}/../ncp_cmd_wifi.h"
"${ProjDirPath}/../ncp_cmd_ble.h"
"${ProjDirPath}/../ncp_glue_common.c"
"${ProjDirPath}/../app_notify.h"
"${ProjDirPath}/../app_notify.c"
"${ProjDirPath}/../ncp_adapter.h"
"${ProjDirPath}/../ncp_tlv_adapter.c"
"${ProjDirPath}/../ncp_tlv_adapter.h"
"${ProjDirPath}/../ncp_intf_pm.c"
"${ProjDirPath}/../ncp_intf_pm.h"
"${ProjDirPath}/../ncp_intf_uart.c"
"${ProjDirPath}/../ncp_intf_uart.h"
"${ProjDirPath}/../usb_device_cdc_app.c"
"${ProjDirPath}/../usb_device_cdc_app.h"
"${ProjDirPath}/../ncp_intf_usb_device_cdc.c"
"${ProjDirPath}/../ncp_intf_usb_device_cdc.h"
"${ProjDirPath}/../usb_device_descriptor.c"
"${ProjDirPath}/../usb_device_descriptor.h"
"${ProjDirPath}/../ncp_intf_spi_slave.c"
"${ProjDirPath}/../ncp_intf_spi_slave.h"
"${ProjDirPath}/../ncp_intf_sdio.c"
"${ProjDirPath}/../ncp_intf_sdio.h"
"${ProjDirPath}/../littlefs_config.c"
"${ProjDirPath}/../littlefs_config.h"
"${ProjDirPath}/../littlefs_adapter.c"
"${ProjDirPath}/../littlefs_adapter.h"
"${ProjDirPath}/../ncp_config.c"
"${ProjDirPath}/../ncp_config.h"
"${ProjDirPath}/../mdns_service.c"
"${ProjDirPath}/../mdns_service.h"
"${ProjDirPath}/../ncp_lpm.c"
"${ProjDirPath}/../ncp_lpm.h"
"${ProjDirPath}/../host_sleep.c"
"${ProjDirPath}/../host_sleep.h"
"${ProjDirPath}/../host_sleep_wifi.c"
"${ProjDirPath}/../host_sleep_wifi.h"
"${ProjDirPath}/../crc.c"
"${ProjDirPath}/../crc.h"
"${ProjDirPath}/../ncp_debug.h"
"${ProjDirPath}/../jsmn.h"
"${ProjDirPath}/../json_generator.h"
"${ProjDirPath}/../json_parser.h"
"${ProjDirPath}/../httpc.h"
"${ProjDirPath}/../http-strings.h"
"${ProjDirPath}/../serial_errno.h"
"${ProjDirPath}/../serial_httpc.h"
"${ProjDirPath}/../serial_network.h"
"${ProjDirPath}/../serial_socket.h"
"${ProjDirPath}/../websockets.h"
"${ProjDirPath}/../wmstats.h"
"${ProjDirPath}/../httpc.c"
"${ProjDirPath}/../httpc_tests.c"
"${ProjDirPath}/../json_generator.c"
"${ProjDirPath}/../serial_httpc.c"
"${ProjDirPath}/../serial_network.c"
"${ProjDirPath}/../serial_socket.c"
"${ProjDirPath}/../websockets.c"
"${ProjDirPath}/../wslay.h"
"${ProjDirPath}/../wslay_frame.c"
"${ProjDirPath}/../wslay_frame.h"
"${ProjDirPath}/../wslayver.h"
"${ProjDirPath}/../httpsrv_fs_data.c"
"${ProjDirPath}/../http_server.c"
"${ProjDirPath}/../http_server.h"
"${ProjDirPath}/../uap_prov.c"
"${ProjDirPath}/../uap_prov.h"
"${ProjDirPath}/../FreeRTOSConfig.h"
"${ProjDirPath}/../FreeRTOSConfigBoard.h"
"${ProjDirPath}/../app_config.h"
"${ProjDirPath}/../board.h"
"${ProjDirPath}/../board.c"
"${ProjDirPath}/../clock_config.h"
"${ProjDirPath}/../clock_config.c"
"${ProjDirPath}/../pin_mux.c"
"${ProjDirPath}/../pin_mux.h"
"${ProjDirPath}/../hardware_init.c"
"${ProjDirPath}/../app.h"
"${ProjDirPath}/../FreeRTOSConfig_Gen.h"
"${ProjDirPath}/../edgefast_bluetooth_audio_config_Gen.h"
"${ProjDirPath}/../edgefast_bluetooth_config_Gen.h"
"${ProjDirPath}/../edgefast_bluetooth_debug_config_Gen.h"
"${ProjDirPath}/../edgefast_bluetooth_extension_config_Gen.h"
"${ProjDirPath}/../ffconf_gen.h"
"${ProjDirPath}/../fsl_debug_console_conf.h"
"${ProjDirPath}/../fsl_os_abstraction_config.h"
"${ProjDirPath}/../mcux_config.h"
"${ProjDirPath}/../usb_device_config.h"
"${ProjDirPath}/../usb_host_config.h"
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${ProjDirPath}/..
    ${ProjDirPath}/../wifi
    ${ProjDirPath}/../ble
    ${ProjDirPath}/../ble/service
    ${ProjDirPath}/../ble/service/gatt_client
    ${ProjDirPath}/../ble/service/gatt_server
)

set_source_files_properties("${ProjDirPath}/../FreeRTOSConfig.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_freertos-kernel_config")
set_source_files_properties("${ProjDirPath}/../FreeRTOSConfig_Gen.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_freertos-kernel_config")
set_source_files_properties("${ProjDirPath}/../ffconf_gen.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_fatfs_template_usb")
set_source_files_properties("${ProjDirPath}/../fsl_os_abstraction_config.h" PROPERTIES COMPONENT_CONFIG_FILE "component_osa_template_config")

if(CMAKE_BUILD_TYPE STREQUAL flash_release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE $<$<COMPILE_LANGUAGE:C>:MBEDTLS_CONFIG_FILE="els_pkc_mbedtls_config.h" MBEDTLS_USER_CONFIG_FILE="wpa_supp_els_pkc_mbedtls_config.h" LWIP_HOOK_FILENAME="lwip_default_hooks.h">)
endif()

if(CMAKE_BUILD_TYPE STREQUAL flash_debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE $<$<COMPILE_LANGUAGE:C>:MBEDTLS_CONFIG_FILE="els_pkc_mbedtls_config.h" MBEDTLS_USER_CONFIG_FILE="wpa_supp_els_pkc_mbedtls_config.h" LWIP_HOOK_FILENAME="lwip_default_hooks.h">)
endif()

if(CMAKE_BUILD_TYPE STREQUAL flash_release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE $<$<COMPILE_LANGUAGE:CXX>:MBEDTLS_CONFIG_FILE="els_pkc_mbedtls_config.h">)
endif()

if(CMAKE_BUILD_TYPE STREQUAL flash_debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE $<$<COMPILE_LANGUAGE:CXX>:MBEDTLS_CONFIG_FILE="els_pkc_mbedtls_config.h">)
endif()

include(${SdkRootDirPath}/devices/RW612/all_lib_device.cmake)

IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)  
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")  
ENDIF()  

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

ADD_CUSTOM_COMMAND(TARGET ${MCUX_SDK_PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY}
-Obinary ${EXECUTABLE_OUTPUT_PATH}/${MCUX_SDK_PROJECT_NAME} ${EXECUTABLE_OUTPUT_PATH}/ncp_device.bin)

set_target_properties(${MCUX_SDK_PROJECT_NAME} PROPERTIES ADDITIONAL_CLEAN_FILES "output.map;${EXECUTABLE_OUTPUT_PATH}/ncp_device.bin")

# wrap all libraries with -Wl,--start-group -Wl,--end-group to prevent link order issue
group_link_libraries()

