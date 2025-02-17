/*
 * Copyright 2024 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/***********************************************************************************************************************
 * This file was generated by the MCUXpresso Config Tools. Any manual edits made to this file
 * will be overwritten if the respective MCUXpresso Config Tools is used to update this file.
 **********************************************************************************************************************/

/* clang-format off */
/*
 * TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
!!GlobalInfo
product: Pins v15.0
processor: RW612
package_id: RW612ETA2I
mcu_data: ksdk2_0
processor_version: 0.16.9
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS ***********
 */
/* clang-format on */

#include "fsl_common.h"
#include "fsl_io_mux.h"
#include "fsl_inputmux.h"
#include "pin_mux.h"

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

/* clang-format off */
/*
 * TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
BOARD_InitPins:
- options: {callFromInitBoot: 'true', coreID: cm33, enableClock: 'true'}
- pin_list:
  - {pin_num: E5, peripheral: FLEXCOMM3, signal: USART_RXD, pin_signal: GPIO_24}
  - {pin_num: B3, peripheral: FLEXSPI, signal: SRAM_CLK0, pin_signal: GPIO_35}
  - {pin_num: B4, peripheral: FLEXSPI, signal: SRAM_SSEL0, pin_signal: GPIO_36}
  - {pin_num: B2, peripheral: FLEXSPI, signal: SRAM_DQS, pin_signal: GPIO_37, pull_up_down: down}
  - {pin_num: C3, peripheral: FLEXSPI, signal: SRAM_DATA0, pin_signal: GPIO_38}
  - {pin_num: A2, peripheral: FLEXSPI, signal: SRAM_DATA1, pin_signal: GPIO_39}
  - {pin_num: A1, peripheral: FLEXSPI, signal: SRAM_DATA2, pin_signal: GPIO_40}
  - {pin_num: B1, peripheral: FLEXSPI, signal: SRAM_DATA3, pin_signal: GPIO_41}
  - {peripheral: DMA0, signal: 'TRIG, 28', pin_signal: FLEXSPI_RX}
  - {peripheral: DMA0, signal: 'TRIG, 29', pin_signal: FLEXSPI_TX}
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS ***********
 */
/* clang-format on */

/* FUNCTION ************************************************************************************************************
 *
 * Function Name : BOARD_InitPins
 * Description   : 
 *
 * END ****************************************************************************************************************/
/* Function assigned for the Cortex-M33 */
void BOARD_InitPins(void)
{
    /* pmux clock control: Enable clock */
    CLOCK_EnableClock(kCLOCK_InputMux);
    /* Initialize FC3_USART_DATA functionality on pin GPIO_24 (pin E5) */
    IO_MUX_SetPinMux(IO_MUX_FC3_USART_DATA);
    /* Initialize QUAD_SPI_PSRAM functionality on pin GPIO_35, GPIO_36, GPIO_37, GPIO_38, GPIO_39, GPIO_40, GPIO_41
     * (pin B3_B4_B2_C3_A2_A1_B1) */
    IO_MUX_SetPinMux(IO_MUX_QUAD_SPI_PSRAM);
    /* Set GPIO_37 (pin B3_B4_B2_C3_A2_A1_B1) configuration - Enable pull-down; strongest slew rate */
    IO_MUX_SetPinConfig(37U, IO_MUX_PinConfigPullDown);
    /* DMAC0 input trigger inmux 28 is enabled */
    INPUTMUX_EnableSignal(INPUTMUX, kINPUTMUX_Dmac0InputTriggerFlexspiRxEna, 1U);
    /* DMAC0 input trigger inmux 29 is enabled */
    INPUTMUX_EnableSignal(INPUTMUX, kINPUTMUX_Dmac0InputTriggerFlexspiTxEna, 1U);
    /* FLEXSPI Rx signal is selected as trigger input for DMA channel 28 */
    INPUTMUX_AttachSignal(INPUTMUX, 28U, kINPUTMUX_FlexspiRxToDma0);
    /* FLEXSPI Tx signal is selected as trigger input for DMA channel 29 */
    INPUTMUX_AttachSignal(INPUTMUX, 29U, kINPUTMUX_FlexspiTxToDma0);
}
/***********************************************************************************************************************
 * EOF
 **********************************************************************************************************************/
