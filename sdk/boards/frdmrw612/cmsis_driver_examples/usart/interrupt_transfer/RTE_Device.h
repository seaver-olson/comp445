/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2020 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _RTE_DEVICE_H
#define _RTE_DEVICE_H

extern void USART3_InitPins();
extern void USART3_DeinitPins();

/* Driver name mapping. */
/* User needs to provide the implementation of USARTX_GetFreq/USARTX_InitPins/USARTX_DeinitPins for the enabled USART
 * instance. */
#define RTE_USART3        1
#define RTE_USART3_DMA_EN 0

/* USART configuration. */
#define USART_RX_BUFFER_LEN      64
#define USART0_RX_BUFFER_ENABLE  0
#define USART1_RX_BUFFER_ENABLE  0
#define USART2_RX_BUFFER_ENABLE  0
#define USART3_RX_BUFFER_ENABLE  1
#define USART14_RX_BUFFER_ENABLE 0

#define RTE_USART3_PIN_INIT        USART3_InitPins
#define RTE_USART3_PIN_DEINIT      USART3_DeinitPins
#define RTE_USART3_DMA_TX_CH       7
#define RTE_USART3_DMA_TX_DMA_BASE DMA0
#define RTE_USART3_DMA_RX_CH       6
#define RTE_USART3_DMA_RX_DMA_BASE DMA0

#endif /* _RTE_DEVICE_H */
