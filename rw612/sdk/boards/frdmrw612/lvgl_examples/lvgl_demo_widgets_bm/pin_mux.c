/*
 * Copyright 2022 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_common.h"
#include "pin_mux.h"
#include "fsl_io_mux.h"

/* FUNCTION ************************************************************************************************************
 *
 * Function Name : BOARD_InitBootPins
 * Description   : Calls initialization functions.
 *
 * END ****************************************************************************************************************/
void BOARD_InitBootPins(void)
{
    BOARD_InitPins();
}

/* FUNCTION ************************************************************************************************************
 *
 * Function Name : BOARD_InitPins
 * Description   : Configures pin routing and optionally pin electrical features.
 *
 * END ****************************************************************************************************************/
void BOARD_InitPins(void)
{ /*!< Function assigned for the core: Cortex-M33[cm33] */
    IO_MUX_SetPinMux(IO_MUX_FC3_USART_DATA);
}

void BOARD_InitLcd0Pins(void)
{
    IO_MUX_SetPinMux(IO_MUX_FC1_SPI_SS0);
    IO_MUX_SetPinMux(IO_MUX_FC2_I2C_16_17);
    IO_MUX_SetPinMux(IO_MUX_GPIO52);
}

void BOARD_InitLcd1Pins(void)
{
    IO_MUX_SetPinMux(IO_MUX_LCD_SPI);
    IO_MUX_SetPinMux(IO_MUX_FC2_I2C_16_17);
}

/***********************************************************************************************************************
 * EOF
 **********************************************************************************************************************/
