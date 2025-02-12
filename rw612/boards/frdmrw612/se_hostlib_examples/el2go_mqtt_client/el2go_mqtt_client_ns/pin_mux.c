/*
 * Copyright 2019, 2022 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_gpio.h"
#include "fsl_io_mux.h"
#include "pin_mux.h"
#include "board.h"

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
{
    GPIO_PortInit(GPIO, RGB_LED_GPIO_PORT);

    GPIO_PinInit(GPIO, RGB_LED_GPIO_PORT, RGB_LED_RED_GPIO_PIN, &(gpio_pin_config_t){kGPIO_DigitalOutput, LOGIC_LED_OFF});
    GPIO_PinInit(GPIO, RGB_LED_GPIO_PORT, RGB_LED_GREEN_GPIO_PIN, &(gpio_pin_config_t){kGPIO_DigitalOutput, LOGIC_LED_OFF});
    GPIO_PinInit(GPIO, RGB_LED_GPIO_PORT, RGB_LED_BLUE_GPIO_PIN, &(gpio_pin_config_t){kGPIO_DigitalOutput, LOGIC_LED_OFF});

    IO_MUX_SetPinMux(IO_MUX_GPIO1);
    IO_MUX_SetPinMux(IO_MUX_GPIO12);
    IO_MUX_SetPinMux(IO_MUX_GPIO0);

    IO_MUX_SetPinMux(IO_MUX_FC3_USART_DATA);
}

/***********************************************************************************************************************
 * EOF
 **********************************************************************************************************************/
