# Copyright 2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

cmake_policy(SET CMP0076 NEW)
cmake_policy(SET CMP0079 NEW)

if(${COEX_NXP_BASE} STREQUAL "bt_ble")
    message(STATUS "Add bt_ble")
    add_subdirectory(${COEX_NXP_BASE})
endif()

if(COEX_ENABLE_OT)
message(STATUS "Add ot-cli")

# path of ot-nxp repo/ot libs
set(NXP_OT_SRC_DIR ${PROJECT_SOURCE_DIR}/third_party/ot-nxp)
set(NXP_OT_LIB_DIR ${PROJECT_SOURCE_DIR}/third_party/ot-nxp/build_rw612/rw612_ot_cli/lib)
message(STATUS "Build with external ot-cli libs, path=${NXP_OT_LIB_DIR}")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    # ot_includes_rw612
    ${NXP_OT_SRC_DIR}/src/rw/rw612

    # ot_includes_common
    ${NXP_OT_SRC_DIR}/src/common

    # openthread
    ${NXP_OT_SRC_DIR}/openthread/src
    ${NXP_OT_SRC_DIR}/openthread/include
    ${NXP_OT_SRC_DIR}/openthread/src/core
    ${NXP_OT_SRC_DIR}/openthread/examples/platforms
    ${NXP_OT_SRC_DIR}/openthread/third_party/mbedtls
)

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--start-group)

# ot libs
target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${NXP_OT_LIB_DIR}/libopenthread-cli-ftd.a
    ${NXP_OT_LIB_DIR}/libopenthread-ftd.a
    ${NXP_OT_LIB_DIR}/libopenthread-hdlc.a
    ${NXP_OT_LIB_DIR}/libopenthread-ncp-ftd.a
    ${NXP_OT_LIB_DIR}/libopenthread-platform.a
    ${NXP_OT_LIB_DIR}/libopenthread-rw612.a
    ${NXP_OT_LIB_DIR}/libopenthread-spinel-ncp.a
    ${NXP_OT_LIB_DIR}/libot-cli-addons.a
    ${NXP_OT_LIB_DIR}/libot-cli-rw612.a
    ${NXP_OT_LIB_DIR}/libopenthread-url.a
    ${NXP_OT_LIB_DIR}/libopenthread-radio-spinel.a
)

TARGET_LINK_LIBRARIES(${MCUX_SDK_PROJECT_NAME} PRIVATE -Wl,--end-group)

endif()

