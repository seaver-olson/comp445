# Copyright 2022-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

# try_compile will test the compiler with a library target instead of an executable
# It is required here to avoid linking issue when cross-compiling
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# All executables will have the .elf suffix and libs will have .a
set(CMAKE_EXECUTABLE_SUFFIX ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C ${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_EXECUTABLE_SUFFIX_CXX ${CMAKE_EXECUTABLE_SUFFIX})
set(CMAKE_STATIC_LIBRARY_PREFIX "")
set(CMAKE_STATIC_LIBRARY_SUFFIX ".a")

include(${CMAKE_SOURCE_DIR}/cmake/toolchain/armgcc.cmake)
