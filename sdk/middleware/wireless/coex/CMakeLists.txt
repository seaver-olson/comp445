# Copyright 2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

# CROSS COMPILER SETTING
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.10.0)

# THE VERSION NUMBER
set (MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION 2)
set (MCUXPRESSO_CMAKE_FORMAT_MINOR_VERSION 0)

if(CMAKE_SCRIPT_MODE_FILE)
  message("${MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION}")
  return()
endif()

project(coex-app
    VERSION 0.2.0
    LANGUAGES C CXX ASM
)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# include CMake module
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/platform/${COEX_NXP_PLATFORM})

include(utils)
include(config_${COEX_EXAMPLE_BOARD})
include(${COEX_NXP_PLATFORM} OPTIONAL)
include(options)

set(MCUX_SDK_PROJECT_NAME ${COEX_EXAMPLE_NAME})

if(NOT NXP_SDK_ROOT)
    message(SEND_ERROR "No NXP_SDK_ROOT specified, please check ${NXP_SDK_ROOT}")
endif()

# Check build options
if(COEX_APP_SUPP)
    if(${COEX_EXAMPLE_NAME} STREQUAL "coex_cli")
        message(SEND_ERROR "You are building ${COEX_EXAMPLE_NAME}, COEX_APP_SUPP should be set to OFF!")
    endif()
else()
    if(${COEX_EXAMPLE_NAME} STREQUAL "coex_wpa_supplicant")
        message(SEND_ERROR "You are building ${COEX_EXAMPLE_NAME}, COEX_APP_SUPP should be set to ON!")
    endif()
endif()

# Determine whether the SDK used is a package or the internal repo
if(EXISTS ${NXP_SDK_ROOT}/SW-Content-Register.txt)
    set(SDK_TYPE "PACKAGE")
else()
    set(SDK_TYPE "INTERNAL")
endif()
message(STATUS "SDK_TYPE: ${SDK_TYPE}")

add_executable(${MCUX_SDK_PROJECT_NAME}
    ${PROJECT_SOURCE_DIR}/boards/${COEX_NXP_PLATFORM}/app_config.h
)

if(${COEX_EXAMPLE_BOARD} STREQUAL "frdmrw612")
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DFRDMRW610)
endif()

set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/lwip/lwipopts.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_lwip_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/platform/ffconf.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_fatfs_template_usb")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/platform/usb_host_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_usb_host_ehci_config_header")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/wifi/wifi_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_wifi_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/ble/app_bluetooth_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_edgefast_bluetooth_config_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/ble/edgefast_bluetooth_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_edgefast_bluetooth_config_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/ble/edgefast_bluetooth_debug_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_edgefast_bluetooth_config_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/boards/${COEX_NXP_PLATFORM}/app_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_wifi_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/boards/${COEX_NXP_PLATFORM}/FreeRTOSConfig.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_freertos-kernel_template")
set_source_files_properties("${PROJECT_SOURCE_DIR}/src/configs/mbedtls/mbedtls_config_client.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_edgefast_bluetooth_template")

target_compile_definitions(${MCUX_SDK_PROJECT_NAME}
    PRIVATE
    LWIP_HOOK_FILENAME="lwip_default_hooks.h"
    MBEDTLS_CONFIG_FILE="mbedtls_config_client.h"
)

if(COEX_ENABLE_WIFI)
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_WIFI_BLE_COEX_APP=1)
    if(COEX_APP_SUPP)
        target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_WPA_SUPP_MBEDTLS)
    endif()
else()
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_WIFI_BLE_COEX_APP=0)
endif()

if(COEX_ENABLE_BLE)
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_DISABLE_BLE=0)
else()
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_DISABLE_BLE=1)
endif()

if(COEX_ENABLE_OT)
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_OT_CLI=1)
else()
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_OT_CLI=0)
endif()

if(${COEX_NXP_BASE} STREQUAL "edgefast")
    target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC -DCONFIG_COEX_SHELL=1)
endif()

add_subdirectory(src)
add_subdirectory(boards)
if(${COEX_NXP_BASE} STREQUAL "edgefast")
    add_subdirectory(examples)
endif()
add_subdirectory(third_party)

if(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)
    set(TARGET_LINK_SYSTEM_LIBRARIES "-lstdc++ -lm -lc -lgcc -lnosys")
endif()

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)
target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})
TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

include(${NXP_SDK_ROOT}/devices/RW612/all_lib_device.cmake)

if(COEX_NXP_EXPORT_TO_BIN)
    export_all_targets_to_bin()
endif()

