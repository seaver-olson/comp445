IF(NOT DEFINED FPU)  
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")  
ENDIF()  

IF(NOT DEFINED SPECS)  
    SET(SPECS "--specs=nano.specs --specs=nosys.specs")  
ENDIF()  

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)  
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE=1")  
ENDIF()  

SET(CMAKE_ASM_FLAGS_FLASH_RELEASE " \
    ${CMAKE_ASM_FLAGS_FLASH_RELEASE} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -g \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_FLASH_DEBUG " \
    ${CMAKE_ASM_FLAGS_FLASH_DEBUG} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DOSA_USED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -g \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_FLASH_RELEASE " \
    ${CMAKE_C_FLAGS_FLASH_RELEASE} \
    -include ${ProjDirPath}/../app_config.h \
    -include ${ProjDirPath}/../app_bluetooth_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DUSE_RTOS=1 \
    -DSDK_OS_FREE_RTOS \
    -DFSL_OSA_TASK_ENABLE=1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_ENABLE_TRNG_AS_ENTROPY_SEED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DGATT_CLIENT \
    -DGATT_DB \
    -DFSL_DRIVER_TRANSFER_DOUBLE_WEAK_IRQ=0 \
    -DFSL_FEATURE_FLASH_PAGE_SIZE_BYTES=4096 \
    -DgMemManagerLight=0 \
    -DCFG_BLE \
    -DgPlatformDisableBleLowPower_d=1 \
    -DSHELL_TASK_STACK_SIZE=6144 \
    -DLPUART_RING_BUFFER_SIZE=1024U \
    -DHAL_AUDIO_DMA_INIT_ENABLE=0 \
    -DLFS_NO_INTRINSICS=1 \
    -DLFS_NO_ERROR=1 \
    -DCONFIG_ARM=1 \
    -DBT_PLATFORM \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DFSL_OSA_MAIN_FUNC_ENABLE=0 \
    -DEDGEFAST_BT_LITTLEFS_MFLASH \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DDEBUG_CONSOLE_RX_ENABLE=0 \
    -DBOOT_HEADER_ENABLE=1 \
    -DSHELL_ADVANCE=1 \
    -DOSA_USED=1 \
    -DSHELL_USE_COMMON_TASK=0 \
    -DLOG_ENABLE_ASYNC_MODE=1 \
    -DLOG_MAX_ARGUMENT_COUNT=10 \
    -DLOG_ENABLE_OVERWRITE=0 \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DSHELL_TASK_PRIORITY=1 \
    -DCONFIG_HOSTAPD=0 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DTIMER_PORT_TYPE_CTIMER=1 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
    -DLFS_THREADSAFE=1 \
    -g \
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
SET(CMAKE_C_FLAGS_FLASH_DEBUG " \
    ${CMAKE_C_FLAGS_FLASH_DEBUG} \
    -include ${ProjDirPath}/../app_config.h \
    -include ${ProjDirPath}/../app_bluetooth_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DDEBUG \
    -DUSE_RTOS=1 \
    -DSDK_OS_FREE_RTOS \
    -DFSL_OSA_TASK_ENABLE=1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_ENABLE_TRNG_AS_ENTROPY_SEED \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DGATT_CLIENT \
    -DGATT_DB \
    -DFSL_DRIVER_TRANSFER_DOUBLE_WEAK_IRQ=0 \
    -DFSL_FEATURE_FLASH_PAGE_SIZE_BYTES=4096 \
    -DgMemManagerLight=0 \
    -DCFG_BLE \
    -DgPlatformDisableBleLowPower_d=1 \
    -DSHELL_TASK_STACK_SIZE=6144 \
    -DLPUART_RING_BUFFER_SIZE=1024U \
    -DHAL_AUDIO_DMA_INIT_ENABLE=0 \
    -DLFS_NO_INTRINSICS=1 \
    -DLFS_NO_ERROR=1 \
    -DCONFIG_ARM=1 \
    -DBT_PLATFORM \
    -DFSL_SDK_DRIVER_QUICK_ACCESS_ENABLE=1 \
    -DFSL_OSA_MAIN_FUNC_ENABLE=0 \
    -DEDGEFAST_BT_LITTLEFS_MFLASH \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DDEBUG_CONSOLE_RX_ENABLE=0 \
    -DBOOT_HEADER_ENABLE=1 \
    -DSHELL_ADVANCE=1 \
    -DOSA_USED=1 \
    -DSHELL_USE_COMMON_TASK=0 \
    -DLOG_ENABLE_ASYNC_MODE=1 \
    -DLOG_MAX_ARGUMENT_COUNT=10 \
    -DLOG_ENABLE_OVERWRITE=0 \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DSHELL_TASK_PRIORITY=1 \
    -DCONFIG_HOSTAPD=0 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DTIMER_PORT_TYPE_CTIMER=1 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
    -DLFS_THREADSAFE=1 \
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
SET(CMAKE_CXX_FLAGS_FLASH_RELEASE " \
    ${CMAKE_CXX_FLAGS_FLASH_RELEASE} \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DOSA_USED=1 \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DTIMER_PORT_TYPE_CTIMER=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=1 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
    -DLFS_NO_INTRINSICS=1 \
    -DLFS_NO_ERROR=1 \
    -DLFS_THREADSAFE=1 \
    -DCFG_BLE \
    -DLOG_ENABLE_ASYNC_MODE=1 \
    -DLOG_MAX_ARGUMENT_COUNT=10 \
    -DLOG_ENABLE_OVERWRITE=0 \
    -DCONFIG_ARM=1 \
    -DSHELL_ADVANCE=1 \
    -DDEBUG_CONSOLE_RX_ENABLE=0 \
    -DSHELL_USE_COMMON_TASK=0 \
    -DSDK_OS_FREE_RTOS \
    -g \
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
SET(CMAKE_CXX_FLAGS_FLASH_DEBUG " \
    ${CMAKE_CXX_FLAGS_FLASH_DEBUG} \
    -DDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DDEBUG_CONSOLE_TRANSFER_NON_BLOCKING \
    -DOSA_USED=1 \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DTIMER_PORT_TYPE_CTIMER=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=1 \
    -DWIFI_BOARD_RW610 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_USE_PKC \
    -DRPMSG_ADAPTER_NON_BLOCKING_MODE=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
    -DLFS_NO_INTRINSICS=1 \
    -DLFS_NO_ERROR=1 \
    -DLFS_THREADSAFE=1 \
    -DCFG_BLE \
    -DLOG_ENABLE_ASYNC_MODE=1 \
    -DLOG_MAX_ARGUMENT_COUNT=10 \
    -DLOG_ENABLE_OVERWRITE=0 \
    -DCONFIG_ARM=1 \
    -DSHELL_ADVANCE=1 \
    -DDEBUG_CONSOLE_RX_ENABLE=0 \
    -DSHELL_USE_COMMON_TASK=0 \
    -DSDK_OS_FREE_RTOS \
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
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE} \
    -Xlinker \
    --defsym=__stack_size__=0x400 \
    -Xlinker \
    --defsym=__heap_size__=0x400 \
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
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG} \
    -g \
    -Xlinker \
    --defsym=__stack_size__=0x400 \
    -Xlinker \
    --defsym=__heap_size__=0x400 \
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
