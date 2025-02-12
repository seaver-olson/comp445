IF(NOT DEFINED FPU)  
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")  
ENDIF()  

IF(NOT DEFINED SPECS)  
    SET(SPECS "--specs=nano.specs --specs=nosys.specs")  
ENDIF()  

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)  
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE=1")  
ENDIF()  

SET(CMAKE_ASM_FLAGS_DEBUG " \
    ${CMAKE_ASM_FLAGS_DEBUG} \
    -DDEBUG \
    -D__STARTUP_CLEAR_BSS \
    -mcpu=cortex-m33+nodsp \
    -mthumb \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_RELEASE " \
    ${CMAKE_ASM_FLAGS_RELEASE} \
    -DNDEBUG \
    -D__STARTUP_CLEAR_BSS \
    -mcpu=cortex-m33+nodsp \
    -mthumb \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_DEBUG " \
    ${CMAKE_C_FLAGS_DEBUG} \
    -include ${ProjDirPath}/../app_config.h \
    -DDEBUG \
    -DUSE_OCOTP_DRIVER_IN_LOAD_SERVICE \
    -DAX_EMBEDDED=1 \
    -DconfigRUN_FREERTOS_SECURE_ONLY=0 \
    -DNXP_IOT_AGENT_AMAZON_LOG_DISABLE \
    -DNXP_IOT_AGENT_HAVE_PSA_IMPL_TFM=1 \
    -DNXP_IOT_AGENT_USE_COREJSON \
    -DNXP_IOT_AGENT_USE_MBEDTLS_TRANSPORT_FOR_MQTT \
    -DOS_DYNAMIC_MEM_SIZE=7168 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DSSS_USE_FTR_FILE \
    -DUSE_RTOS=1 \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DFSL_OSA_TASK_ENABLE=1 \
    -DLWIP_TIMEVAL_PRIVATE=0 \
    -DSDK_OS_FREE_RTOS \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DPB_FIELD_32BIT \
    -DEXTERNAL_CUSTOMER_BUILD_CONFIGURATION=1 \
    -DOSA_USED \
    -DLWIP_DNS=1 \
    -DLWIP_NETIF_HOSTNAME=1 \
    -DLWIP_IGMP=1 \
    -D_XOPEN_SOURCE=500 \
    -DSO_REUSE=1 \
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
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_RELEASE " \
    ${CMAKE_C_FLAGS_RELEASE} \
    -include ${ProjDirPath}/../app_config.h \
    -DNDEBUG \
    -DUSE_OCOTP_DRIVER_IN_LOAD_SERVICE \
    -DAX_EMBEDDED=1 \
    -DconfigRUN_FREERTOS_SECURE_ONLY=0 \
    -DNXP_IOT_AGENT_AMAZON_LOG_DISABLE \
    -DNXP_IOT_AGENT_HAVE_PSA_IMPL_TFM=1 \
    -DNXP_IOT_AGENT_USE_COREJSON \
    -DNXP_IOT_AGENT_USE_MBEDTLS_TRANSPORT_FOR_MQTT \
    -DOS_DYNAMIC_MEM_SIZE=7168 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DSSS_USE_FTR_FILE \
    -DUSE_RTOS=1 \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DFSL_OSA_TASK_ENABLE=1 \
    -DLWIP_TIMEVAL_PRIVATE=0 \
    -DSDK_OS_FREE_RTOS \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DPB_FIELD_32BIT \
    -DEXTERNAL_CUSTOMER_BUILD_CONFIGURATION=1 \
    -DOSA_USED \
    -DLWIP_DNS=1 \
    -DLWIP_NETIF_HOSTNAME=1 \
    -DLWIP_IGMP=1 \
    -D_XOPEN_SOURCE=500 \
    -DSO_REUSE=1 \
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
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_DEBUG " \
    ${CMAKE_CXX_FLAGS_DEBUG} \
    -DDEBUG \
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
SET(CMAKE_CXX_FLAGS_RELEASE " \
    ${CMAKE_CXX_FLAGS_RELEASE} \
    -DNDEBUG \
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
SET(CMAKE_EXE_LINKER_FLAGS_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_DEBUG} \
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
    ${FPU} \
    ${SPECS} \
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/armgcc/tfm_common_ns_pre.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
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
    ${FPU} \
    ${SPECS} \
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/frdmrw612/armgcc/tfm_common_ns_pre.ld\" -static \
")
