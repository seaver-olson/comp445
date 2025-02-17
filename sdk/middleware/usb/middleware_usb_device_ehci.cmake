# Add set(CONFIG_USE_middleware_usb_device_ehci true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(((CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1171xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1172xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612 OR CONFIG_DEVICE_ID STREQUAL MIMXRT1181xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1182xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1187xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1189xxxxx OR CONFIG_DEVICE_ID STREQUAL MCXN546 OR CONFIG_DEVICE_ID STREQUAL MCXN547 OR CONFIG_DEVICE_ID STREQUAL MCXN946 OR CONFIG_DEVICE_ID STREQUAL MCXN947 OR CONFIG_DEVICE_ID STREQUAL MCXN235 OR CONFIG_DEVICE_ID STREQUAL MCXN236) AND CONFIG_USE_middleware_usb_device_ehci_config_header AND CONFIG_USE_middleware_usb_device_common_header AND ((CONFIG_USE_middleware_usb_phy AND (CONFIG_DEVICE_ID STREQUAL MCXN235 OR CONFIG_DEVICE_ID STREQUAL MCXN236 OR CONFIG_DEVICE_ID STREQUAL MCXN546 OR CONFIG_DEVICE_ID STREQUAL MCXN547 OR CONFIG_DEVICE_ID STREQUAL MCXN946 OR CONFIG_DEVICE_ID STREQUAL MCXN947 OR CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1171xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1172xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1187xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1189xxxxx)) OR (NOT (CONFIG_NOT STREQUAL MCXN235 OR CONFIG_NOT STREQUAL MCXN236 OR CONFIG_NOT STREQUAL MCXN546 OR CONFIG_NOT STREQUAL MCXN547 OR CONFIG_NOT STREQUAL MCXN946 OR CONFIG_NOT STREQUAL MCXN947 OR CONFIG_NOT STREQUAL MIMXRT1061xxxxA OR CONFIG_NOT STREQUAL MIMXRT1061xxxxB OR CONFIG_NOT STREQUAL MIMXRT1062xxxxA OR CONFIG_NOT STREQUAL MIMXRT1062xxxxB OR CONFIG_NOT STREQUAL MIMXRT1171xxxxx OR CONFIG_NOT STREQUAL MIMXRT1172xxxxx OR CONFIG_NOT STREQUAL MIMXRT1173xxxxx OR CONFIG_NOT STREQUAL MIMXRT1175xxxxx OR CONFIG_NOT STREQUAL MIMXRT1176xxxxx OR CONFIG_NOT STREQUAL MIMXRT1187xxxxx OR CONFIG_NOT STREQUAL MIMXRT1189xxxxx))) AND (NOT (CONFIG_NOT STREQUAL RW612 OR CONFIG_NOT STREQUAL RW610))) OR ((CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1061xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB OR CONFIG_DEVICE_ID STREQUAL MIMXRT1171xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1172xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1176xxxxx OR CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612 OR CONFIG_DEVICE_ID STREQUAL MIMXRT1181xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1182xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1187xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1189xxxxx OR CONFIG_DEVICE_ID STREQUAL MCXN546 OR CONFIG_DEVICE_ID STREQUAL MCXN547 OR CONFIG_DEVICE_ID STREQUAL MCXN946 OR CONFIG_DEVICE_ID STREQUAL MCXN947 OR CONFIG_DEVICE_ID STREQUAL MCXN235 OR CONFIG_DEVICE_ID STREQUAL MCXN236) AND CONFIG_USE_middleware_usb_device_ehci_config_header AND CONFIG_USE_middleware_usb_device_common_header AND CONFIG_USE_driver_memory AND (CONFIG_DEVICE_ID STREQUAL RW612 OR CONFIG_DEVICE_ID STREQUAL RW610)))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/device/usb_device_ehci.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/device
  ${CMAKE_CURRENT_LIST_DIR}/include
)

else()

message(SEND_ERROR "middleware_usb_device_ehci dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
