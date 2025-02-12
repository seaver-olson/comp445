# Copyright 2022-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

IF(NOT DEFINED FPU)
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")
ENDIF()

IF(NOT DEFINED SPECS)
    SET(SPECS "--specs=nano.specs --specs=nosys.specs")
ENDIF()

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE_UART=1")
ENDIF()

SET(PLATFORM_C_FLAGS " \
    -D__STARTUP_CLEAR_BSS \
    -g \
    -mthumb -mcpu=cortex-m33+nodsp -mthumb -mapcs -std=gnu99 \
    -fno-common -ffunction-sections -fdata-sections -ffreestanding -fno-builtin \
    -fomit-frame-pointer \
    -Wno-unused-function -Wall \
    ${FPU} \
")
SET(PLATFORM_LINKER_FLAGS "${PLATFORM_C_FLAGS} \
    -Xlinker --gc-sections \
    -Xlinker -static \
    -Xlinker -z \
    -Xlinker muldefs \
    -Xlinker -Map=output.map -Wl,--print-memory-usage \
    -Xlinker --defsym=__stack_size__=0x1000 \
    -Xlinker --defsym=__heap_size__=0x1000 \
    ${SPECS} \
    -T\"${COEX_NXP_LINKER_FILE}\" -static \
")

SET(CMAKE_ASM_FLAGS_FLASH_RELEASE "${CMAKE_ASM_FLAGS_FLASH_RELEASE} -DDEBUG ${PLATFORM_C_FLAGS}")
SET(CMAKE_ASM_FLAGS_FLASH_DEBUG "${CMAKE_ASM_FLAGS_FLASH_DEBUG} ${PLATFORM_C_FLAGS}")

SET(CMAKE_C_FLAGS_FLASH_RELEASE "${CMAKE_C_FLAGS_FLASH_RELEASE} -DDEBUG -Os ${PLATFORM_C_FLAGS} ${COEX_NXP_APP_CONFIG}")
SET(CMAKE_C_FLAGS_FLASH_DEBUG "${CMAKE_C_FLAGS_FLASH_DEBUG} -O0 ${PLATFORM_C_FLAGS} ${COEX_NXP_APP_CONFIG}")

SET(CMAKE_CXX_FLAGS_FLASH_RELEASE "${CMAKE_CXX_FLAGS_FLASH_RELEASE} -DDEBUG -Os ${PLATFORM_C_FLAGS} ${COEX_NXP_APP_CONFIG}")
SET(CMAKE_CXX_FLAGS_FLASH_DEBUG "${CMAKE_CXX_FLAGS_FLASH_DEBUG} -O0 ${PLATFORM_C_FLAGS} ${COEX_NXP_APP_CONFIG}")

SET(CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE "${CMAKE_EXE_LINKER_FLAGS_FLASH_RELEASE} ${PLATFORM_LINKER_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG " ${CMAKE_EXE_LINKER_FLAGS_FLASH_DEBUG} ${PLATFORM_LINKER_FLAGS}")
