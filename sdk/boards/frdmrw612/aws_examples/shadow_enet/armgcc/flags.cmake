IF(NOT DEFINED FPU)  
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")  
ENDIF()  

IF(NOT DEFINED SPECS)  
    SET(SPECS "--specs=nosys.specs")  
ENDIF()  

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)  
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE=1")  
ENDIF()  

SET(CMAKE_ASM_FLAGS_FLASH_DEBUG " \
    ${CMAKE_ASM_FLAGS_FLASH_DEBUG} \
    -D__STARTUP_CLEAR_BSS \
    -mcpu=cortex-m33+nodsp \
    -mthumb \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_FLASH_RELEASE " \
    ${CMAKE_ASM_FLAGS_FLASH_RELEASE} \
    -D__STARTUP_CLEAR_BSS \
    -mcpu=cortex-m33+nodsp \
    -mthumb \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_FLASH_DEBUG " \
    ${CMAKE_C_FLAGS_FLASH_DEBUG} \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DFSL_FEATURE_PHYKSZ8081_USE_RMII50M_MODE \
    -DUSE_RTOS=1 \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DDISABLE_LOGGING \
    -DCPU_RW612ETA2I \
    -DMCUXPRESSO_SDK \
    -DBOOT_HEADER_ENABLE=1 \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DLWIP_TIMEVAL_PRIVATE=0 \
    -DMQTT_AGENT_DO_NOT_USE_CUSTOM_CONFIG \
    -DSDK_OS_FREE_RTOS \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DNS=1 \
    -DMBEDTLS_THREADING_ALT \
    -DMBEDTLS_THREADING_C \
    -g \
    -O0 \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -fomit-frame-pointer \
    -Wno-unused-function \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_FLASH_RELEASE " \
    ${CMAKE_C_FLAGS_FLASH_RELEASE} \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DFSL_FEATURE_PHYKSZ8081_USE_RMII50M_MODE \
    -DUSE_RTOS=1 \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DDISABLE_LOGGING \
    -DCPU_RW612ETA2I \
    -DMCUXPRESSO_SDK \
    -DBOOT_HEADER_ENABLE=1 \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DLWIP_TIMEVAL_PRIVATE=0 \
    -DMQTT_AGENT_DO_NOT_USE_CUSTOM_CONFIG \
    -DSDK_OS_FREE_RTOS \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DNS=1 \
    -DMBEDTLS_THREADING_ALT \
    -DMBEDTLS_THREADING_C \
    -Os \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -fomit-frame-pointer \
    -Wno-unused-function \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_FLASH_DEBUG " \
    ${CMAKE_CXX_FLAGS_FLASH_DEBUG} \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DCPU_RW612ETA2I \
    -DMCUXPRESSO_SDK \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -g \
    -O0 \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_FLASH_RELEASE " \
    ${CMAKE_CXX_FLAGS_FLASH_RELEASE} \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DCPU_RW612ETA2I \
    -DMCUXPRESSO_SDK \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -Os \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG} \
    -g \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Xlinker \
    --gc-sections \
    -Xlinker \
    -static \
    -Xlinker \
    -z \
    -Xlinker \
    muldefs \
    -Xlinker \
    -Map=output.map \
    -Wl,--print-memory-usage \
    -Xlinker \
    --defsym=__stack_size__=0x200 \
    -Xlinker \
    --defsym=__heap_size__=0x200 \
    ${FPU} \
    ${SPECS} \
    -T\"${ProjDirPath}/linker/RW610_flash.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE} \
    -mcpu=cortex-m33+nodsp \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Xlinker \
    --gc-sections \
    -Xlinker \
    -static \
    -Xlinker \
    -z \
    -Xlinker \
    muldefs \
    -Xlinker \
    -Map=output.map \
    -Wl,--print-memory-usage \
    -Xlinker \
    --defsym=__stack_size__=0x200 \
    -Xlinker \
    --defsym=__heap_size__=0x200 \
    ${FPU} \
    ${SPECS} \
    -T\"${ProjDirPath}/linker/RW610_flash.ld\" -static \
")
