/*
 * Copyright 2024 NXP
 *
 * SPDX-License-Identifier: BSD-3-Clause
 * The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html
 */

///////////////////////////////////////////////////////////////////////////////
//  Includes
///////////////////////////////////////////////////////////////////////////////

#include "fsl_debug_console.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"

#include "fsl_common.h"
#include "fsl_gpio.h"
#include "fsl_adapter_uart.h"

#ifdef RW612_SERIES
#if defined(MBEDTLS_NXP_SSSAPI)
#include "sssapi_mbedtls.h"
#elif defined(MBEDTLS_MCUX_CSS_API)
#include "platform_hw_ip.h"
#include "css_mbedtls.h"
#elif defined(MBEDTLS_MCUX_CSS_PKC_API)
#include "platform_hw_ip.h"
#include "css_pkc_mbedtls.h"
#elif defined(MBEDTLS_MCUX_ELS_PKC_API)
#include "platform_hw_ip.h"
#include "els_pkc_mbedtls.h"
#elif defined(MBEDTLS_MCUX_ELS_API)
#include "platform_hw_ip.h"
#include "els_mbedtls.h"
#elif defined(MBEDTLS_MCUX_ELE_S400_API)
#include "ele_mbedtls.h"
#else
#ifdef CONFIG_KSDK_MBEDTLS
#include "ksdk_mbedtls.h"
#endif
#endif

#if defined(APP_LOWPOWER_ENABLED) && (APP_LOWPOWER_ENABLED > 0)
#include "PWR_Interface.h"
#endif /* APP_LOWPOWER_ENABLED */
#endif /* RW612_SERIES */

#include "app_config.h"
#include "coex_shell.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

extern void BOARD_InitHardware(void);
extern void APP_InitServices(void);
extern void coex_controller_init(void);
extern void otSysRunIdleTask(void);

/*******************************************************************************
 * Variables
 ******************************************************************************/

/* Allocate the memory for the heap. */
#if defined(configAPPLICATION_ALLOCATED_HEAP) && (configAPPLICATION_ALLOCATED_HEAP)
#ifndef RW612_SERIES
APP_FREERTOS_HEAP_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) uint8_t ucHeap[configTOTAL_HEAP_SIZE];
#else
uint8_t __attribute__((section(".heap"))) ucHeap[configTOTAL_HEAP_SIZE];
#endif /* RW612_SERIES */
#endif

#ifdef RW612_SERIES
#if defined(configUSE_TICKLESS_IDLE) && (configUSE_TICKLESS_IDLE == 1)
/* Tickless idle is allowed by default but can be disabled runtime with APP_SetTicklessIdle */
static int ticklessIdleAllowed = 1;
#endif
#endif

const int TASK_MAIN_PRIO       = (configMAX_PRIORITIES-5);
const int TASK_MAIN_STACK_SIZE = (2 * 1024);
TaskHandle_t task_main_handle;

/*******************************************************************************
 * Code
 ******************************************************************************/

static void printSeparator(void)
{
    PRINTF("========================================\r\n");
}

void task_main(void *param)
{
    printSeparator();
#if defined(RW612_SERIES)
    PRINTF("     Initialize RW612 Module\r\n");
#endif
    printSeparator();

    coex_cli_init();
    coex_controller_init();

    while (1)
    {
        vTaskDelay(1000);
    }
}

int main(void)
{
    BaseType_t result = 0;

    BOARD_InitHardware();
    APP_InitServices();

    PRINTF("        Coex APP\r\n");
    printSeparator();

    result =
        xTaskCreate(task_main, "main", TASK_MAIN_STACK_SIZE, NULL, TASK_MAIN_PRIO, &task_main_handle);
    assert(pdPASS == result);

    vTaskStartScheduler();
    for (;;)
    {
        ;
    }
}


#ifdef RW612_SERIES
void vApplicationIdleHook(void)
{
#if(CONFIG_OT_CLI)
    otSysRunIdleTask();
#endif
}

#if defined(configUSE_TICKLESS_IDLE) && (configUSE_TICKLESS_IDLE == 1)
void vPortSuppressTicksAndSleep(TickType_t xExpectedIdleTime)
{
#if defined(APP_LOWPOWER_ENABLED) && (APP_LOWPOWER_ENABLED > 0)
    bool abortIdle = false;
    uint64_t expectedIdleTimeUs, actualIdleTimeUs;

    if(ticklessIdleAllowed > 0)
    {
        uint32_t irqMask = DisableGlobalIRQ();

        /* Disable and prepare systicks for low power */
        abortIdle = PWR_SysticksPreProcess((uint32_t)xExpectedIdleTime, &expectedIdleTimeUs);

        if (abortIdle == false)
        {
            /* Enter low power with a maximal timeout */
            actualIdleTimeUs = PWR_EnterLowPower(expectedIdleTimeUs);

            /* Re enable systicks and compensate systick timebase */
            PWR_SysticksPostProcess(expectedIdleTimeUs, actualIdleTimeUs);
        }

        /* Exit from critical section */
        EnableGlobalIRQ(irqMask);
    }
    else
    {
        /* Tickless idle is not allowed, wait for next tick interrupt */
        __WFI();
    }
#endif /* APP_LOWPOWER_ENABLED */
}

void APP_SetTicklessIdle(bool enable)
{
    if(enable == true)
    {
        ticklessIdleAllowed++;
    }
    else
    {
        ticklessIdleAllowed--;
    }
}

#endif /* configUSE_TICKLESS_IDLE */
#endif /* RW612_SERIES*/


/**
 * @brief Loop forever if stack overflow is detected.
 *
 * If configCHECK_FOR_STACK_OVERFLOW is set to 1,
 * this hook provides a location for applications to
 * define a response to a stack overflow.
 *
 * Use this hook to help identify that a stack overflow
 * has occurred.
 *
 */
void vApplicationStackOverflowHook(TaskHandle_t xTask, char * pcTaskName)
{
    PRINTF("ERROR: stack overflow on task %s.\r\n", pcTaskName);

    portDISABLE_INTERRUPTS();

    /* Unused Parameters */
    (void)xTask;
    (void)pcTaskName;

    /* Loop forever */
    for (;;)
    {
    }
}

#ifndef __GNUC__
void __assert_func(const char *file, int line, const char *func, const char *failedExpr)
{
    PRINTF("ASSERT ERROR \" %s \": file \"%s\" Line \"%d\" function name \"%s\" \n", failedExpr, file, line, func);
    for (;;)
    {
        __BKPT(0);
    }
}
#endif
