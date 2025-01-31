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
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -g \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_RELEASE " \
    ${CMAKE_ASM_FLAGS_RELEASE} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -mthumb \
    -mcpu=cortex-m33+nodsp \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_DEBUG " \
    ${CMAKE_C_FLAGS_DEBUG} \
    -include ${ProjDirPath}/../mcux_config.h \
    -DDEBUG \
    -DOS_DYNAMIC_MEM_SIZE=7168 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DRTE_COMPONENTS_H \
    -DWIFI_BOARD_RW610 \
    -DTFM_LVL=2 \
    -DTFM_CRYPTO_TEST_ALG_CBC \
    -DTFM_CRYPTO_TEST_ALG_CCM \
    -DTFM_CRYPTO_TEST_ALG_GCM \
    -DTFM_CRYPTO_TEST_ALG_SHA_512 \
    -DTFM_CRYPTO_TEST_HKDF \
    -DTFM_CRYPTO_TEST_ECDH \
    -DTFM_CRYPTO_TEST_UNSUPPORTED_ALG \
    -DQCBOR_DISABLE_FLOAT_HW_USE \
    -DUSEFULBUF_DISABLE_ALL_FLOAT \
    -DQCBOR_DISABLE_PREFERRED_FLOAT \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DTFM_NS_REG_TEST \
    -DTEST_NS_PS \
    -DTEST_NS_ITS \
    -DTFM_S_REG_TEST \
    -DT_COSE_USE_PSA_CRYPTO \
    -DTEST_NS_ATTESTATION \
    -DTEST_NS_CRYPTO \
    -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE \
    -DTEST_NS_QCBOR \
    -DTFM_PARTITION_IPC_TEST \
    -DTEST_NS_IPC \
    -DTEST_NS_SLIH_IRQ \
    -DTEST_NS_PLATFORM \
    -g \
    -O0 \
    -Wno-unused-variable \
    -Wno-unused-but-set-variable \
    -Wno-return-type \
    -Wno-maybe-uninitialized \
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
SET(CMAKE_C_FLAGS_RELEASE " \
    ${CMAKE_C_FLAGS_RELEASE} \
    -include ${ProjDirPath}/../mcux_config.h \
    -DNDEBUG \
    -DOS_DYNAMIC_MEM_SIZE=7168 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DRTE_COMPONENTS_H \
    -DWIFI_BOARD_RW610 \
    -DTFM_LVL=2 \
    -DTFM_CRYPTO_TEST_ALG_CBC \
    -DTFM_CRYPTO_TEST_ALG_CCM \
    -DTFM_CRYPTO_TEST_ALG_GCM \
    -DTFM_CRYPTO_TEST_ALG_SHA_512 \
    -DTFM_CRYPTO_TEST_HKDF \
    -DTFM_CRYPTO_TEST_ECDH \
    -DTFM_CRYPTO_TEST_UNSUPPORTED_ALG \
    -DQCBOR_DISABLE_FLOAT_HW_USE \
    -DUSEFULBUF_DISABLE_ALL_FLOAT \
    -DQCBOR_DISABLE_PREFERRED_FLOAT \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DTFM_NS_REG_TEST \
    -DTEST_NS_PS \
    -DTEST_NS_ITS \
    -DTFM_S_REG_TEST \
    -DT_COSE_USE_PSA_CRYPTO \
    -DTEST_NS_ATTESTATION \
    -DTEST_NS_CRYPTO \
    -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE \
    -DTEST_NS_QCBOR \
    -DTFM_PARTITION_IPC_TEST \
    -DTEST_NS_IPC \
    -DTEST_NS_SLIH_IRQ \
    -DTEST_NS_PLATFORM \
    -Os \
    -Wno-unused-variable \
    -Wno-unused-but-set-variable \
    -Wno-return-type \
    -Wno-maybe-uninitialized \
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
SET(CMAKE_CXX_FLAGS_DEBUG " \
    ${CMAKE_CXX_FLAGS_DEBUG} \
    -DDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DWIFI_BOARD_RW610 \
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
SET(CMAKE_CXX_FLAGS_RELEASE " \
    ${CMAKE_CXX_FLAGS_RELEASE} \
    -DNDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_RW612ETA2I \
    -DBOOT_HEADER_ENABLE=1 \
    -DWIFI_BOARD_RW610 \
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
SET(CMAKE_EXE_LINKER_FLAGS_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_DEBUG} \
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
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common/gcc/tfm_common_ns_pre.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
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
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common/gcc/tfm_common_ns_pre.ld\" -static \
")
