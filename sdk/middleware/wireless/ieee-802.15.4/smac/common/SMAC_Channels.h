/*! *********************************************************************************
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* Copyright 2016-2021 NXP
* All rights reserved.
*
* \file
*
* SPDX-License-Identifier: BSD-3-Clause
********************************************************************************** */

#ifndef _SMAC_CHANNELS_H
#define _SMAC_CHANNELS_H


/************************************************************************************
*************************************************************************************
* Include
*************************************************************************************
************************************************************************************/

/************************************************************************************
*************************************************************************************
* Public macros
*************************************************************************************
************************************************************************************/

/************************************************************************************
*************************************************************************************
* Public prototypes
*************************************************************************************
************************************************************************************/

/************************************************************************************
*************************************************************************************
* Public type definitions
*************************************************************************************
************************************************************************************/

/************************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
************************************************************************************/

/************************************************************************************
*************************************************************************************
* Public functions
*************************************************************************************
************************************************************************************/

/* 802.15.4-2006 maximum channel enumeration */
#if defined (gPHY_802_15_4g_d)
gChannel0_c = 0,
gChannel1_c,
gChannel2_c,
gChannel3_c,
gChannel4_c,
gChannel5_c,
gChannel6_c,
gChannel7_c,
gChannel8_c,
gChannel9_c,
gChannel10_c,
gChannel11_c,
gChannel12_c,
gChannel13_c,
gChannel14_c,
gChannel15_c,
gChannel16_c,
gChannel17_c,
gChannel18_c,
gChannel19_c,
gChannel20_c,
gChannel21_c,
gChannel22_c,
gChannel23_c,
gChannel24_c,
gChannel25_c,
gChannel26_c,
gChannel27_c,
gChannel28_c,
gChannel29_c,
gChannel30_c,
gChannel31_c,
gChannel32_c,
gChannel33_c,
gChannel34_c,
gChannel35_c,
gChannel36_c,
gChannel37_c,
gChannel38_c,
gChannel39_c,
gChannel40_c,
gChannel41_c,
gChannel42_c,
gChannel43_c,
gChannel44_c,
gChannel45_c,
gChannel46_c,
gChannel47_c,
gChannel48_c,
gChannel49_c,
gChannel50_c,
gChannel51_c,
gChannel52_c,
gChannel53_c,
gChannel54_c,
gChannel55_c,
gChannel56_c,
gChannel57_c,
gChannel58_c,
gChannel59_c,
gChannel60_c,
gChannel61_c,
gChannel62_c,
gChannel63_c,
gChannel64_c,
gChannel65_c,
gChannel66_c,
gChannel67_c,
gChannel68_c,
gChannel69_c,
gChannel70_c,
gChannel71_c,
gChannel72_c,
gChannel73_c,
gChannel74_c,
gChannel75_c,
gChannel76_c,
gChannel77_c,
gChannel78_c,
gChannel79_c,
gChannel80_c,
gChannel81_c,
gChannel82_c,
gChannel83_c,
gChannel84_c,
gChannel85_c,
gChannel86_c,
gChannel87_c,
gChannel88_c,
gChannel89_c,
gChannel90_c,
gChannel91_c,
gChannel92_c,
gChannel93_c,
gChannel94_c,
gChannel95_c,
gChannel96_c,
gChannel97_c,
gChannel98_c,
gChannel99_c,
gChannel100_c,
gChannel101_c,
gChannel102_c,
gChannel103_c,
gChannel104_c,
gChannel105_c,
gChannel106_c,
gChannel107_c,
gChannel108_c,
gChannel109_c,
gChannel110_c,
gChannel111_c,
gChannel112_c,
gChannel113_c,
gChannel114_c,
gChannel115_c,
gChannel116_c,
gChannel117_c,
gChannel118_c,
gChannel119_c,
gChannel120_c,
gChannel121_c,
gChannel122_c,
gChannel123_c,
gChannel124_c,
gChannel125_c,
gChannel126_c,
gChannel127_c,
gChannel128_c,
#else

gChannel11_c = 0x0B,
gChannel12_c,
gChannel13_c,
gChannel14_c,
gChannel15_c,
gChannel16_c,
gChannel17_c,
gChannel18_c,
gChannel19_c,
gChannel20_c,
gChannel21_c,
gChannel22_c,
gChannel23_c,
gChannel24_c,
gChannel25_c,
gChannel26_c,
#endif
gChannelInvalid_c
#endif  /* _SMAC_CHANNELS_H */
