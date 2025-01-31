IF(NOT DEFINED FPU)  
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")  
ENDIF()  

IF(NOT DEFINED SPECS)  
    SET(SPECS "--specs=nano.specs --specs=nosys.specs")  
ENDIF()  

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)  
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE=1")  
ENDIF()  

SET(CMAKE_ASM_FLAGS_FLASH_DEBUG " \
    ${CMAKE_ASM_FLAGS_FLASH_DEBUG} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -g \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_FLASH_RELEASE " \
    ${CMAKE_ASM_FLAGS_FLASH_RELEASE} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_FLASH_DEBUG " \
    ${CMAKE_C_FLAGS_FLASH_DEBUG} \
    -include ${ProjDirPath}/../monolithic_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DDEBUG \
    -DCPU3 \
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DFSL_OSA_TASK_ENABLE \
    -DFSL_OSA_BM_TIMER_CONFIG \
    -DFSL_OSA_MAIN_FUNC_ENABLE=0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DgMemManagerLightExtendHeapAreaUsage=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DTIMER_PORT_TYPE_MRT=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=0 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -g \
    -O0 \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -mcpu=cortex-m33+nodsp \
    -fomit-frame-pointer \
    -Wno-unused-function \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_FLASH_RELEASE " \
    ${CMAKE_C_FLAGS_FLASH_RELEASE} \
    -include ${ProjDirPath}/../monolithic_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DNDEBUG \
    -DCPU3 \
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DFSL_OSA_TASK_ENABLE \
    -DFSL_OSA_BM_TIMER_CONFIG \
    -DFSL_OSA_MAIN_FUNC_ENABLE=0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DgMemManagerLightExtendHeapAreaUsage=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DTIMER_PORT_TYPE_MRT=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=0 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -Os \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -mcpu=cortex-m33+nodsp \
    -fomit-frame-pointer \
    -Wno-unused-function \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_FLASH_DEBUG " \
    ${CMAKE_CXX_FLAGS_FLASH_DEBUG} \
    -DDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DTIMER_PORT_TYPE_MRT=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=0 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -g \
    -O0 \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_FLASH_RELEASE " \
    ${CMAKE_CXX_FLAGS_FLASH_RELEASE} \
    -DNDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DTIMER_PORT_TYPE_MRT=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=0 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -Os \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG} \
    -g \
    -Xlinker \
    -Map=output.map \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Wl,--gc-sections \
    -Wl,-static \
    -Wl,-z \
    -Wl,muldefs \
    -Wl,-Map=output.map \
    -Wl,--print-memory-usage \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${SPECS} \
    -T\"${ProjDirPath}/RW61x_flash.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE} \
    -Xlinker \
    -Map=output.map \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Wl,--gc-sections \
    -Wl,-static \
    -Wl,-z \
    -Wl,muldefs \
    -Wl,-Map=output.map \
    -Wl,--print-memory-usage \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${SPECS} \
    -T\"${ProjDirPath}/RW61x_flash.ld\" -static \
")
