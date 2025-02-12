# Copyright 2022-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

option(COEX_NXP_EXPORT_TO_BIN "Convert all executables to raw binary" OFF)
option(COEX_NXP_EXPORT_TO_SREC "Convert all executables to srec" OFF)
option(COEX_APP_SUPP "Enable wpa_supplicant" OFF)
option(COEX_USE_EXTERNAL_OT_LIB "Build with external ot-cli library" OFF)
option(COEX_ENABLE_WIFI "Enable Wi-Fi" OFF)
option(COEX_ENABLE_BLE "Enable BLE" OFF)
option(COEX_ENABLE_OT "Enable OT" OFF)

message(STATUS COEX_NXP_EXPORT_TO_BIN=${COEX_NXP_EXPORT_TO_BIN})
message(STATUS COEX_NXP_EXPORT_TO_SREC=${COEX_NXP_EXPORT_TO_SREC})
message(STATUS COEX_APP_SUPP=${COEX_APP_SUPP})
message(STATUS COEX_USE_EXTERNAL_OT_LIB=${COEX_USE_EXTERNAL_OT_LIB})
message(STATUS COEX_ENABLE_WIFI=${COEX_ENABLE_WIFI})
message(STATUS COEX_ENABLE_BLE=${COEX_ENABLE_BLE})
message(STATUS COEX_ENABLE_OT=${COEX_ENABLE_OT})
