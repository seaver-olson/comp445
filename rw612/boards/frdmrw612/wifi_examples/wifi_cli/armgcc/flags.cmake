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
    -DOSA_USED \
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
    -DOSA_USED \
    -g \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_FLASH_RELEASE " \
    ${CMAKE_C_FLAGS_FLASH_RELEASE} \
    -include ${ProjDirPath}/../wifi_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DUSE_RTOS=1 \
    -DCONFIG_MONOLITHIC_WIFI=1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
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
    -std=gnu99 \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_FLASH_DEBUG " \
    ${CMAKE_C_FLAGS_FLASH_DEBUG} \
    -include ${ProjDirPath}/../wifi_config.h \
    -include ${ProjDirPath}/../mcux_config.h \
    -DDEBUG \
    -DUSE_RTOS=1 \
    -DCONFIG_MONOLITHIC_WIFI=1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DGENERIC_LIST_LIGHT=1 \
    -DWIFI_BOARD_RW610 \
    -DCONFIG_NXP_WIFI_SOFTAP_SUPPORT=1 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
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
    -std=gnu99 \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_FLASH_RELEASE " \
    ${CMAKE_CXX_FLAGS_FLASH_RELEASE} \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=1 \
    -DWIFI_BOARD_RW610 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
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
    -DOSA_USED \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DUSE_RTOS=1 \
    -DWIFI_BOARD_RW610 \
    -DSO_REUSE=1 \
    -DPRINTF_FLOAT_ENABLE=1 \
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
    -T\"${ProjDirPath}/RW610_flash.ld\" -static \
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
    -T\"${ProjDirPath}/RW610_flash.ld\" -static \
")
