/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016, 2022 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*${header:start}*/
#include "pin_mux.h"
#include "board.h"
/*${header:end}*/

/*${function:start}*/
void BOARD_InitHardware(void)
{
    BOARD_InitDebugConsole();
}

uint32_t USART3_GetFreq(void)
{
    return CLOCK_GetFlexCommClkFreq(3U);
}
/*${function:end}*/
