/*
* Copyright 2023-2024 NXP
* All rights reserved.
*
* SPDX-License-Identifier: BSD-3-Clause
*/

#include <stdint.h>
#include <stdbool.h>

#include "fsl_component_button.h"
#include "fsl_gpio.h"
#include "fsl_port.h"

#include "board.h"
#include "board_comp.h"
#include "pin_mux.h"
#include "zb_platform.h"

/* Number of buttons on K32W1480-EVK board */
#define BOARD_BUTTONS_NUM (2)

static BUTTON_HANDLE_ARRAY_DEFINE(board_button_handles, BOARD_BUTTONS_NUM);

button_cb app_cb;
static uint8_t app_num_buttons;

#if defined(gAppButtonCnt_c) && (gAppButtonCnt_c > 0)
static button_status_t buttons_cb(button_handle_t handle, button_callback_message_t *msg, void *param)
{
    /* Param will hold the button ID, in order to send it to Zigbee stack */
    uint8_t button = (uint32_t)param & 0xFF;
    // DBG_vPrintf(TRACE_APP_BUTTON, "Button: Pressed %u\r\n", button);
    switch (msg->event)
    {
        case kBUTTON_EventOneClick:
        case kBUTTON_EventShortPress:
        case kBUTTON_EventLongPress:
        {
            app_cb(button);
            break;
        }

        default:
        {
            ; /* No action required */
            break;
        }
    }
    return kStatus_BUTTON_Success;
}
#endif

static void deinitButtons(void)
{
    if (app_num_buttons == 0)
    {
        return;
    }

    BUTTON_Deinit(board_button_handles[0]);

    if (app_num_buttons > 1)
    {
        BUTTON_Deinit(board_button_handles[1]);
    }

    app_num_buttons = 0;
    app_cb = NULL;
}

bool zbPlatButtonInit(uint8_t num_buttons, button_cb cb)
{
    if (NULL == cb || num_buttons > BOARD_BUTTONS_NUM)
    {
        return false;
    }

    /* Deinit Buttons to avoid double init conflicts */
    deinitButtons();

    app_cb          = cb;
    app_num_buttons = num_buttons;

#if defined(gAppButtonCnt_c) && (gAppButtonCnt_c > 0)
    BOARD_InitButton0(board_button_handles[0]);

    /* Init BUTTON1 if needed */
    if (app_num_buttons > 1)
    {
        BOARD_InitButton1(board_button_handles[1]);
    }

    for (uint8_t i = 0; i < app_num_buttons; i++)
    {
        BUTTON_InstallCallback((button_handle_t)board_button_handles[i],
                               buttons_cb,
                               (void *)(uint32_t)i);
    }
#endif

    return true;
}

uint32_t zbPlatButtonGetState(void)
{
    if (app_num_buttons == 0)
    {
        return 0;
    }

    uint32_t state = 0;

    for (uint8_t i = 0; i < app_num_buttons; i++)
    {
        uint8_t button_state;

        /* Fill state mask with button states */
        if (BUTTON_GetInput(board_button_handles[i], &button_state) == kStatus_BUTTON_Success)
        {
            /* Buttons are configured as pull-up,
             * so GetInput will return 1 if not pressed,
             * 0 if pressed.
             */
            state |= ((!button_state) << i);
        }
    }

    return state;
}
