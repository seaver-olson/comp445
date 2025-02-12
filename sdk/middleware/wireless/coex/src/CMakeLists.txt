# Copyright 2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

add_subdirectory(configs)

add_subdirectory(common)

if(${COEX_NXP_BASE} STREQUAL "edgefast")
    add_subdirectory(${COEX_NXP_BASE})
endif()