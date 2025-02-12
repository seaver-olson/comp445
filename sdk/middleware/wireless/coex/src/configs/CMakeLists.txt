# Copyright 2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

cmake_policy(SET CMP0076 NEW)
cmake_policy(SET CMP0079 NEW)

target_sources(${MCUX_SDK_PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/lwip/lwipopts.h
        ${CMAKE_CURRENT_LIST_DIR}/mbedtls/mbedtls_config_client.h
        ${CMAKE_CURRENT_LIST_DIR}/platform/ffconf.h
        ${CMAKE_CURRENT_LIST_DIR}/platform/usb_host_config.h
        ${CMAKE_CURRENT_LIST_DIR}/wifi/wifi_config.h
        ${CMAKE_CURRENT_LIST_DIR}/ble/app_bluetooth_config.h
        ${CMAKE_CURRENT_LIST_DIR}/ble/edgefast_bluetooth_audio_config.h
        ${CMAKE_CURRENT_LIST_DIR}/ble/edgefast_bluetooth_config.h
        ${CMAKE_CURRENT_LIST_DIR}/ble/edgefast_bluetooth_debug_config.h
)

target_include_directories(${MCUX_SDK_PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/lwip
        ${CMAKE_CURRENT_LIST_DIR}/mbedtls
        ${CMAKE_CURRENT_LIST_DIR}/platform
        ${CMAKE_CURRENT_LIST_DIR}/wifi
        ${CMAKE_CURRENT_LIST_DIR}/ble
)
