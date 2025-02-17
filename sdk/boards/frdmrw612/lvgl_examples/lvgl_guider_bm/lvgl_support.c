/*
 * Copyright 2024 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "lvgl_support.h"
#include "lvgl.h"

#if defined(SDK_OS_FREE_RTOS)
#include "FreeRTOS.h"
#include "semphr.h"
#endif

#include "fsl_dc_fb.h"
#include "fsl_debug_console.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
static void DEMO_ReadTouch(lv_indev_drv_t *drv, lv_indev_data_t *data);
static void DEMO_FlushDisplay(lv_disp_drv_t *disp_drv, const lv_area_t *area, lv_color_t *color_p);

/*******************************************************************************
 * Variables
 ******************************************************************************/

#if defined(SDK_OS_FREE_RTOS)
static SemaphoreHandle_t s_transferDone;
#else
static volatile bool s_transferDone;
#endif

AT_NONCACHEABLE_SECTION_ALIGN(static uint8_t s_frameBuffer[2][LCD_VIRTUAL_BUF_SIZE * DEMO_BUFFER_BYTE_PER_PIXEL], 4);

static lv_disp_drv_t disp_drv; /*Descriptor of a display driver*/
static dc_fb_info_t s_fbInfo;

/*******************************************************************************
 * Code
 ******************************************************************************/
void lv_port_pre_init(void)
{
}

static void DEMO_BufferSwitchOffCallback(void *param, void *inactiveFrameBuffer)
{
    lv_disp_flush_ready(&disp_drv);

#if defined(SDK_OS_FREE_RTOS)
    BaseType_t taskAwake = pdFALSE;

#if defined(__GIC_PRIO_BITS)
    if ((__get_CPSR() & CPSR_M_Msk) == 0x13)
#else
    if (0U != __get_IPSR())
#endif
    {
        xSemaphoreGiveFromISR(s_transferDone, &taskAwake);

        portYIELD_FROM_ISR(taskAwake);
    }
    else
    {
        xSemaphoreGive(s_transferDone);
    }
#else /* !SDK_OS_FREE_RTOS */
    s_transferDone = true;
#endif
}

static void DEMO_WaitBufferSwitchOff(void)
{
#if defined(SDK_OS_FREE_RTOS)
    if (xSemaphoreTake(s_transferDone, portMAX_DELAY) != pdTRUE)
    {
        PRINTF("Display flush failed\r\n");
        assert(0);
    }
#else
    while (false == s_transferDone)
    {
    }
    s_transferDone = false;
#endif
}

void lv_port_disp_init(void)
{
    status_t status;
    static lv_disp_draw_buf_t disp_buf;

    memset(s_frameBuffer[0], 0, LCD_VIRTUAL_BUF_SIZE);
    memset(s_frameBuffer[1], 0, LCD_VIRTUAL_BUF_SIZE);
    lv_disp_draw_buf_init(&disp_buf, s_frameBuffer[0], s_frameBuffer[1], LCD_VIRTUAL_BUF_SIZE);

    /*-------------------------
     * Initialize your display
     * -----------------------*/
    BOARD_PrepareDisplayController();
    status = g_dc.ops->init(&g_dc);
    if (kStatus_Success != status)
    {
        PRINTF("Display initialization failed\r\n");
        assert(0);
    }

    g_dc.ops->getLayerDefaultConfig(&g_dc, 0, &s_fbInfo);
    s_fbInfo.pixelFormat = kVIDEO_PixelFormatRGB565;
    s_fbInfo.width       = DEMO_BUFFER_WIDTH;
    s_fbInfo.height      = DEMO_BUFFER_HEIGHT;
    s_fbInfo.startX      = DEMO_BUFFER_START_X;
    s_fbInfo.startY      = DEMO_BUFFER_START_Y;
    s_fbInfo.strideBytes = DEMO_BUFFER_WIDTH * DEMO_BUFFER_BYTE_PER_PIXEL;
    g_dc.ops->setLayerConfig(&g_dc, 0, &s_fbInfo);

    g_dc.ops->setCallback(&g_dc, 0, DEMO_BufferSwitchOffCallback, NULL);

#if defined(SDK_OS_FREE_RTOS)
    s_transferDone = xSemaphoreCreateBinary();
    if (NULL == s_transferDone)
    {
        PRINTF("Frame semaphore create failed\r\n");
        for (;;)
            ;
    }
#else
    s_transferDone = false;
#endif

    /* Clear initial frame. */
#if DEMO_PANEL_TYPE_DBI
    /* TODO: Clear the buffer to blank */
#else
    /* lvgl starts render in frame buffer 0, so show frame buffer 1 first. */
    g_dc.ops->setFrameBuffer(&g_dc, 0, (void *)s_frameBuffer[1]);
#endif

    g_dc.ops->enableLayer(&g_dc, 0);

    /*-----------------------------------
     * Register the display in LittlevGL
     *----------------------------------*/

    lv_disp_drv_init(&disp_drv); /*Basic initialization*/

    /*Set the resolution of the display*/
    disp_drv.hor_res = DEMO_BUFFER_WIDTH;
    disp_drv.ver_res = DEMO_BUFFER_HEIGHT;

    /*Used to copy the buffer's content to the display*/
    disp_drv.flush_cb = DEMO_FlushDisplay;

    /*Set a display buffer*/
    disp_drv.draw_buf = &disp_buf;

    /*Finally register the driver*/
    lv_disp_drv_register(&disp_drv);
}

static void DEMO_FlushDisplay(lv_disp_drv_t *disp_drv, const lv_area_t *area, lv_color_t *color_p)
{
    /*
     * Before new frame flushing, clear previous frame flush done status.
     */
#if !defined(SDK_OS_FREE_RTOS)
    s_transferDone = false;
#else
    (void)xSemaphoreTake(s_transferDone, 0);
#endif

#if DEMO_PANEL_TYPE_DBI
    /*
     * For DBI type panel (the panel has internal RAM), it supports
     * update part of the region.
     * For DPI type panel, it always uses full screen refresh, so
     * can't change the region.
     */
    s_fbInfo.startX      = DEMO_BUFFER_START_X + area->x1;
    s_fbInfo.startY      = DEMO_BUFFER_START_Y + area->y1;
    s_fbInfo.width       = area->x2 - area->x1 + 1;
    s_fbInfo.height      = area->y2 - area->y1 + 1;
    s_fbInfo.strideBytes = s_fbInfo.width * DEMO_BUFFER_BYTE_PER_PIXEL;

    g_dc.ops->setLayerConfig(&g_dc, 0, &s_fbInfo);
#endif

    g_dc.ops->setFrameBuffer(&g_dc, 0, (void *)color_p);
}

void lv_port_indev_init(void)
{
    static lv_indev_drv_t indev_drv;

    /*------------------
     * Touchpad
     * -----------------*/

    /*Initialize your touchpad */
    BOARD_PrepareTouchPanel();
    BOARD_InitTouchPanel();

    /*Register a touchpad input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type    = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = DEMO_ReadTouch;
    lv_indev_drv_register(&indev_drv);
}

/* Will be called by the library to read the touchpad */
static void DEMO_ReadTouch(lv_indev_drv_t *drv, lv_indev_data_t *data)
{
    int x, y;
    status_t status;

    status = BOARD_GetTouchPanelPoint(&x, &y);

    if (kStatus_Success == status)
    {
        data->state = LV_INDEV_STATE_PR;
    }
    else
    {
        data->state = LV_INDEV_STATE_REL;
    }

    data->point.x = x;
    data->point.y = y;
}
