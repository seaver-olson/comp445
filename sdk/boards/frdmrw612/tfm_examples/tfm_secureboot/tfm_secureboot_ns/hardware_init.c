/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2023 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "pin_mux.h"
#include "clock_config.h"

#include "board.h"
void BOARD_InitHardware(void)
{
}

void SystemInit(void)
{
    BOARD_InitHardware();
}
