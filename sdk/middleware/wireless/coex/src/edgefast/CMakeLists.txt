# Copyright 2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

cmake_policy(SET CMP0076 NEW) # target_sources() command now converts relative source file paths to absolute
cmake_policy(SET CMP0079 NEW)

target_sources(${MCUX_SDK_PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/coex_shell.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}
)
