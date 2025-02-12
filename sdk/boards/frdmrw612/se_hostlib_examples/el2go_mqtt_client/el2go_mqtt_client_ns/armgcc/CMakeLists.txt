# CROSS COMPILER SETTING
SET(CMAKE_SYSTEM_NAME Generic)
CMAKE_MINIMUM_REQUIRED (VERSION 3.10.0)

# THE VERSION NUMBER
SET (MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION 2)
SET (MCUXPRESSO_CMAKE_FORMAT_MINOR_VERSION 0)

include(ide_overrides.cmake OPTIONAL)

if(CMAKE_SCRIPT_MODE_FILE)
  message("${MCUXPRESSO_CMAKE_FORMAT_MAJOR_VERSION}")
  return()
endif()


# ENABLE ASM
ENABLE_LANGUAGE(ASM)

SET(CMAKE_STATIC_LIBRARY_PREFIX)
SET(CMAKE_STATIC_LIBRARY_SUFFIX)

SET(CMAKE_EXECUTABLE_LIBRARY_PREFIX)
SET(CMAKE_EXECUTABLE_LIBRARY_SUFFIX)

# CURRENT DIRECTORY
SET(ProjDirPath ${CMAKE_CURRENT_SOURCE_DIR})

SET(EXECUTABLE_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})
SET(LIBRARY_OUTPUT_PATH ${ProjDirPath}/${CMAKE_BUILD_TYPE})


project(el2go_mqtt_client_ns)

set(MCUX_BUILD_TYPES debug release)

set(MCUX_SDK_PROJECT_NAME el2go_mqtt_client_ns.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${ProjDirPath}/../../../../../..)
endif()

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_executable(${MCUX_SDK_PROJECT_NAME} 
"${ProjDirPath}/../app_config.h"
"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/Device/Source/startup_frdmrw612.c"
"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/Device/Include/cmsis.h"
"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/Device/Include/platform_regs.h"
"${SdkRootDirPath}/devices/RW612/system_RW612.c"
"${SdkRootDirPath}/devices/RW612/system_RW612.h"
"${ProjDirPath}/../fsl_sss_ftr.h"
"${ProjDirPath}/../el2go_mqtt_client.c"
"${ProjDirPath}/../FreeRTOSConfig.h"
"${ProjDirPath}/../FreeRTOSIPConfig.h"
"${ProjDirPath}/../FreeRTOSConfig.c"
"${ProjDirPath}/../el2go_mbedtls_user_config.h"
"${SdkRootDirPath}/middleware/aws_iot/iot-reference/Middleware/FreeRTOS/transport_mbedtls/using_mbedtls.h"
"${SdkRootDirPath}/middleware/aws_iot/iot-reference/Middleware/FreeRTOS/transport_mbedtls/using_mbedtls.c"
"${ProjDirPath}/../core_mqtt_config.h"
"${ProjDirPath}/../os_wrapper_freertos.c"
"${ProjDirPath}/../lwipopts.h"
"${ProjDirPath}/../lwippools.h"
"${ProjDirPath}/../wifi_config.h"
"${ProjDirPath}/../board.c"
"${ProjDirPath}/../board.h"
"${ProjDirPath}/../clock_config.c"
"${ProjDirPath}/../clock_config.h"
"${ProjDirPath}/../hardware_init.c"
"${ProjDirPath}/../app.h"
"${ProjDirPath}/../pin_mux.c"
"${ProjDirPath}/../pin_mux.h"
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${ProjDirPath}/..
    ${SdkRootDirPath}/boards/frdmrw612
    ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/Device/Include
    ${SdkRootDirPath}/devices/RW612
    ${SdkRootDirPath}/middleware/aws_iot/iot-reference/Middleware/FreeRTOS/transport_mbedtls
)

set_source_files_properties("${ProjDirPath}/../app_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_wifi_template")
set_source_files_properties("${ProjDirPath}/../FreeRTOSConfig.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_freertos-kernel_template")
set_source_files_properties("${ProjDirPath}/../core_mqtt_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_freertos_coremqtt_template")
set_source_files_properties("${ProjDirPath}/../lwipopts.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_lwip_template")
set_source_files_properties("${ProjDirPath}/../wifi_config.h" PROPERTIES COMPONENT_CONFIG_FILE "middleware_wifi_template")

if(CMAKE_BUILD_TYPE STREQUAL debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_USER_CONFIG_FILE="el2go_mbedtls_user_config.h" TARGET_CONFIG_HEADER_FILE="config_tfm_target.h" MBEDTLS_CONFIG_FILE="mcux_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL debug)

if(CMAKE_BUILD_TYPE STREQUAL release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_USER_CONFIG_FILE="el2go_mbedtls_user_config.h" TARGET_CONFIG_HEADER_FILE="config_tfm_target.h" MBEDTLS_CONFIG_FILE="mcux_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL release)

ADD_CUSTOM_TARGET(MCUX_PREBUILD
COMMAND ${TOOLCHAIN_DIR}/bin/arm-none-eabi-gcc -E -P -xc -I ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/partition -I ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/armgcc/tfm_common_ns.ld -o ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/armgcc/tfm_common_ns_pre.ld
)

ADD_DEPENDENCIES(${MCUX_SDK_PROJECT_NAME} MCUX_PREBUILD)

include(${SdkRootDirPath}/devices/RW612/all_lib_device.cmake)

IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)  
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")  
ENDIF()  

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

if(CMAKE_BUILD_TYPE STREQUAL debug)
    target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${ProjDirPath}/../../el2go_mqtt_client_s/armgcc/${CMAKE_BUILD_TYPE}/el2go_mqtt_client_s_CMSE_lib.o)
endif(CMAKE_BUILD_TYPE STREQUAL debug)

if(CMAKE_BUILD_TYPE STREQUAL release)
    target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${ProjDirPath}/../../el2go_mqtt_client_s/armgcc/${CMAKE_BUILD_TYPE}/el2go_mqtt_client_s_CMSE_lib.o)
endif(CMAKE_BUILD_TYPE STREQUAL release)

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

ADD_CUSTOM_COMMAND(TARGET ${MCUX_SDK_PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY}
-Obinary ${EXECUTABLE_OUTPUT_PATH}/${MCUX_SDK_PROJECT_NAME} ${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin)

set_target_properties(${MCUX_SDK_PROJECT_NAME} PROPERTIES ADDITIONAL_CLEAN_FILES "output.map;${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin")

