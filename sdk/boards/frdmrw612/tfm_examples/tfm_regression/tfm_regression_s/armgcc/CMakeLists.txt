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


project(tfm_regression_s)

set(MCUX_BUILD_TYPES debug release)

set(MCUX_SDK_PROJECT_NAME tfm_regression_s.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${ProjDirPath}/../../../../../..)
endif()

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_executable(${MCUX_SDK_PROJECT_NAME} 
"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/Device/Source/startup_frdmrw612.c"
"${SdkRootDirPath}/devices/RW612/system_RW612.c"
"${SdkRootDirPath}/devices/RW612/system_RW612.h"
"${ProjDirPath}/../pin_mux.c"
"${ProjDirPath}/../pin_mux.h"
"${ProjDirPath}/../hardware_init.c"
"${ProjDirPath}/../app.h"
"${ProjDirPath}/../board.c"
"${ProjDirPath}/../board.h"
"${ProjDirPath}/../clock_config.c"
"${ProjDirPath}/../clock_config.h"
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${SdkRootDirPath}/devices/RW612
    ${ProjDirPath}/..
    ${SdkRootDirPath}/boards/frdmrw612
)


if(CMAKE_BUILD_TYPE STREQUAL debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE PROJECT_CONFIG_HEADER_FILE="config_profile_large.h" MBEDTLS_CONFIG_FILE="tfm_mbedcrypto_config_profile_large.h" MBEDTLS_PSA_CRYPTO_CONFIG_FILE="crypto_config_profile_large.h" TARGET_CONFIG_HEADER_FILE="config_tfm_target.h")
endif(CMAKE_BUILD_TYPE STREQUAL debug)

if(CMAKE_BUILD_TYPE STREQUAL release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE PROJECT_CONFIG_HEADER_FILE="config_profile_large.h" MBEDTLS_CONFIG_FILE="tfm_mbedcrypto_config_profile_large.h" MBEDTLS_PSA_CRYPTO_CONFIG_FILE="crypto_config_profile_large.h" TARGET_CONFIG_HEADER_FILE="config_tfm_target.h")
endif(CMAKE_BUILD_TYPE STREQUAL release)

ADD_CUSTOM_TARGET(MCUX_PREBUILD
COMMAND ${TOOLCHAIN_DIR}/bin/arm-none-eabi-gcc -DCONFIG_TFM_PARTITION_META -DENABLE_HEAP -D__ARM_ARCH_8M_MAIN__ -DCONFIG_TFM_USE_TRUSTZONE -DTFM_PARTITION_TEST_SECURE_SERVICES -E -P -xc -I ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/partition -I ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/armgcc/tfm_common_s.ld -o ${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/armgcc/tfm_common_s_pre.ld
)

ADD_DEPENDENCIES(${MCUX_SDK_PROJECT_NAME} MCUX_PREBUILD)

include(${SdkRootDirPath}/devices/RW612/all_lib_device.cmake)

IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)  
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")  
ENDIF()  

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

ADD_CUSTOM_COMMAND(TARGET ${MCUX_SDK_PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY}
-Obinary ${EXECUTABLE_OUTPUT_PATH}/${MCUX_SDK_PROJECT_NAME} ${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin)

set_target_properties(${MCUX_SDK_PROJECT_NAME} PROPERTIES ADDITIONAL_CLEAN_FILES "output.map;${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin;${ProjDirPath}/debug/tfm_regression_s_CMSE_lib.o;${ProjDirPath}/release/tfm_regression_s_CMSE_lib.o")

