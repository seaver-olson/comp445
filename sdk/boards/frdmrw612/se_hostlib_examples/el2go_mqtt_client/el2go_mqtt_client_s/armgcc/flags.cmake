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
    -DDEBUG \
    -DOCOTP_NV_COUNTERS_RAM_EMULATION=1 \
    -DRW61X_IPED_ITS_ROLLBACK_PROTECTION_ENABLE=0 \
    -DTFM_SPM_LOG_LEVEL=TFM_SPM_LOG_LEVEL_INFO \
    -DTFM_SP_LOG_RAW_ENABLED \
    -DTFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_INFO \
    -DDAUTH_CHIP_DEFAULT \
    -D__SEMIHOST_HARDFAULT_DISABLE \
    -DENABLE_HEAP \
    -DTFM_WIFI_FLASH_REGION \
    -DPSA_WANT_ALG_SHA_1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DCONFIG_TFM_BUILDING_SPE=1 \
    -DCONFIG_TFM_ENABLE_MEMORY_PROTECT \
    -DTFM_PARTITION_NS_AGENT_TZ \
    -DTFM_PARTITION_IDLE \
    -DPLATFORM_DEFAULT_OTP \
    -DPLATFORM_DEFAULT_PROVISIONING \
    -DOTP_WRITEABLE \
    -DTFM_DUMMY_PROVISIONING \
    -DCONFIG_TFM_PARTITION_META \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -DCONFIG_TFM_HALT_ON_CORE_PANIC \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DTEST_NS_ATTESTATION \
    -DTEST_S_ATTESTATION \
    -DPS_ENCRYPTION \
    -DPS_ROLLBACK_PROTECTION \
    -DTFM_PARTITION_PROTECTED_STORAGE \
    -DTFM_LVL=2 \
    -DPS_CRYPTO_AEAD_ALG=PSA_ALG_CCM \
    -DUSE_ELS_PKC_HUK \
    -DUSE_ELS_PKC_IAK \
    -DHARDENING_MACROS_ENABLED \
    -DPSA_WANT_ECC_SECP_R1_224 \
    -DTFM_PARTITION_LOADER_SERVICE \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DTFM_PARTITION_CRYPTO \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DMBEDTLS_PSA_CRYPTO_DRIVERS \
    -DMBEDTLS_PSA_CRYPTO_BUILTIN_KEYS \
    -DPSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY \
    -DPSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY_LOADER \
    -DATTEST_KEY_BITS=256 \
    -DT_COSE_DISABLE_MAC0 \
    -DT_COSE_DISABLE_ES384 \
    -DT_COSE_DISABLE_ES512 \
    -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE \
    -DTFM_PARTITION_PLATFORM \
    -DPSA_CRYPTO_DRIVER_ELS_PKC \
    -DCRYPTO_HW_ACCELERATOR \
    -DTFM_PARTITION_INITIAL_ATTESTATION \
    -DT_COSE_USE_PSA_CRYPTO \
    -DQCBOR_DISABLE_FLOAT_HW_USE \
    -DUSEFULBUF_DISABLE_ALL_FLOAT \
    -DQCBOR_DISABLE_PREFERRED_FLOAT \
    -g \
    -O0 \
    -mcmse \
    -Wno-unused-but-set-variable \
    -Wno-unused-value \
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
    -DNDEBUG \
    -DOCOTP_NV_COUNTERS_RAM_EMULATION=1 \
    -DRW61X_IPED_ITS_ROLLBACK_PROTECTION_ENABLE=0 \
    -DTFM_SPM_LOG_LEVEL=TFM_SPM_LOG_LEVEL_INFO \
    -DTFM_SP_LOG_RAW_ENABLED \
    -DTFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_INFO \
    -DDAUTH_CHIP_DEFAULT \
    -D__SEMIHOST_HARDFAULT_DISABLE \
    -DENABLE_HEAP \
    -DTFM_WIFI_FLASH_REGION \
    -DPSA_WANT_ALG_SHA_1 \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DCONFIG_TFM_BUILDING_SPE=1 \
    -DCONFIG_TFM_ENABLE_MEMORY_PROTECT \
    -DTFM_PARTITION_NS_AGENT_TZ \
    -DTFM_PARTITION_IDLE \
    -DPLATFORM_DEFAULT_OTP \
    -DPLATFORM_DEFAULT_PROVISIONING \
    -DOTP_WRITEABLE \
    -DTFM_DUMMY_PROVISIONING \
    -DCONFIG_TFM_PARTITION_META \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -DCONFIG_TFM_HALT_ON_CORE_PANIC \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DTEST_NS_ATTESTATION \
    -DTEST_S_ATTESTATION \
    -DPS_ENCRYPTION \
    -DPS_ROLLBACK_PROTECTION \
    -DTFM_PARTITION_PROTECTED_STORAGE \
    -DTFM_LVL=2 \
    -DPS_CRYPTO_AEAD_ALG=PSA_ALG_CCM \
    -DUSE_ELS_PKC_HUK \
    -DUSE_ELS_PKC_IAK \
    -DHARDENING_MACROS_ENABLED \
    -DPSA_WANT_ECC_SECP_R1_224 \
    -DTFM_PARTITION_LOADER_SERVICE \
    -DMFLASH_FILE_BASEADDR=7340032 \
    -DTFM_PARTITION_CRYPTO \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DMBEDTLS_PSA_CRYPTO_DRIVERS \
    -DMBEDTLS_PSA_CRYPTO_BUILTIN_KEYS \
    -DPSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY \
    -DPSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY_LOADER \
    -DATTEST_KEY_BITS=256 \
    -DT_COSE_DISABLE_MAC0 \
    -DT_COSE_DISABLE_ES384 \
    -DT_COSE_DISABLE_ES512 \
    -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE \
    -DTFM_PARTITION_PLATFORM \
    -DPSA_CRYPTO_DRIVER_ELS_PKC \
    -DCRYPTO_HW_ACCELERATOR \
    -DTFM_PARTITION_INITIAL_ATTESTATION \
    -DT_COSE_USE_PSA_CRYPTO \
    -DQCBOR_DISABLE_FLOAT_HW_USE \
    -DUSEFULBUF_DISABLE_ALL_FLOAT \
    -DQCBOR_DISABLE_PREFERRED_FLOAT \
    -Os \
    -mcmse \
    -Wno-unused-but-set-variable \
    -Wno-unused-value \
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
    -g \
    -O0 \
    -mcmse \
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
    -Os \
    -mcmse \
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
    -Wl,--out-implib=${ProjDirPath}/debug/el2go_mqtt_client_s_CMSE_lib.o \
    -g \
    -Wl,--cmse-implib \
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
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/armgcc/tfm_common_s_pre.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
    -Wl,--out-implib=${ProjDirPath}/release/el2go_mqtt_client_s_CMSE_lib.o \
    -Wl,--cmse-implib \
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
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/target/nxp/common/armgcc/tfm_common_s_pre.ld\" -static \
")
