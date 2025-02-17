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


project(els_pkc_fips_st)

set(MCUX_BUILD_TYPES release flash_debug flash_release debug)

set(MCUX_SDK_PROJECT_NAME els_pkc_fips_st.elf)

if (NOT DEFINED SdkRootDirPath)
    SET(SdkRootDirPath ${ProjDirPath}/../../../../..)
endif()

include(${ProjDirPath}/flags.cmake)

include(${ProjDirPath}/config.cmake)

add_executable(${MCUX_SDK_PROJECT_NAME} 
"${ProjDirPath}/../els_pkc_fips_mbedtls_config.h"
"${ProjDirPath}/../els_pkc_fips_st.c"
"${ProjDirPath}/../els_pkc_fips_cipher.c"
"${ProjDirPath}/../els_pkc_fips_cipher.h"
"${ProjDirPath}/../els_pkc_fips_ecdsa.c"
"${ProjDirPath}/../els_pkc_fips_ecdsa.h"
"${ProjDirPath}/../els_pkc_fips_rsa.c"
"${ProjDirPath}/../els_pkc_fips_rsa.h"
"${ProjDirPath}/../els_pkc_fips_hash.c"
"${ProjDirPath}/../els_pkc_fips_hash.h"
"${ProjDirPath}/../els_pkc_fips_mac.c"
"${ProjDirPath}/../els_pkc_fips_mac.h"
"${ProjDirPath}/../els_pkc_fips_drbg.c"
"${ProjDirPath}/../els_pkc_fips_drbg.h"
"${ProjDirPath}/../els_pkc_fips_key_gen.c"
"${ProjDirPath}/../els_pkc_fips_key_gen.h"
"${ProjDirPath}/../els_pkc_fips_kdf.c"
"${ProjDirPath}/../els_pkc_fips_kdf.h"
"${ProjDirPath}/../els_pkc_fips_ecdh.c"
"${ProjDirPath}/../els_pkc_fips_ecdh.h"
"${ProjDirPath}/../els_pkc_fips_util.c"
"${ProjDirPath}/../els_pkc_fips_util.h"
"${ProjDirPath}/../els_pkc_fips_config.h"
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
    ${ProjDirPath}/..
    ${SdkRootDirPath}/boards/frdmrw612
)


if(CMAKE_BUILD_TYPE STREQUAL release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_CONFIG_FILE="els_pkc_fips_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL release)

if(CMAKE_BUILD_TYPE STREQUAL flash_debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_CONFIG_FILE="els_pkc_fips_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL flash_debug)

if(CMAKE_BUILD_TYPE STREQUAL flash_release)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_CONFIG_FILE="els_pkc_fips_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL flash_release)

if(CMAKE_BUILD_TYPE STREQUAL debug)
     target_compile_definitions(${MCUX_SDK_PROJECT_NAME}  PRIVATE MBEDTLS_CONFIG_FILE="els_pkc_fips_mbedtls_config.h")
endif(CMAKE_BUILD_TYPE STREQUAL debug)

include(${SdkRootDirPath}/devices/RW612/all_lib_device.cmake)

IF(NOT DEFINED TARGET_LINK_SYSTEM_LIBRARIES)  
    SET(TARGET_LINK_SYSTEM_LIBRARIES "-lm -lc -lgcc -lnosys")  
ENDIF()  

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE ${TARGET_LINK_SYSTEM_LIBRARIES})

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

ADD_CUSTOM_COMMAND(TARGET ${MCUX_SDK_PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY}
-Obinary ${EXECUTABLE_OUTPUT_PATH}/${MCUX_SDK_PROJECT_NAME} ${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin)

set_target_properties(${MCUX_SDK_PROJECT_NAME} PROPERTIES ADDITIONAL_CLEAN_FILES "output.map;${EXECUTABLE_OUTPUT_PATH}/sdk20-app.bin")

