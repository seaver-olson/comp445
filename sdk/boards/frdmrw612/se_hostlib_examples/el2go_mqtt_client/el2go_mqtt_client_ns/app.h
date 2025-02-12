/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016, 2022 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _APP_H_
#define _APP_H_

#include "board.h"
#include "pin_mux.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/*${macro:start}*/
#define HAVE_RGB_LED

#define RGB_LED_RED    1U << RGB_LED_RED_GPIO_PIN
#define RGB_LED_GREEN  1U << RGB_LED_GREEN_GPIO_PIN
#define RGB_LED_BLUE   1U << RGB_LED_BLUE_GPIO_PIN

#define LED_On(mask)  GPIO_PortClear(GPIO, RGB_LED_GPIO_PORT, mask)
#define LED_Off(mask) GPIO_PortSet(GPIO, RGB_LED_GPIO_PORT, mask)
/*${macro:end}*/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*${prototype:start}*/
void BOARD_InitHardware(void);
/*${prototype:end}*/

#endif /* _APP_H_ */
