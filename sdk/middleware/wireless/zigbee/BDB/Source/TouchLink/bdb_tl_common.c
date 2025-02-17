/****************************************************************************
 *
 * Copyright 2020, 2023-2024 NXP
 *
 * NXP Confidential. 
 * 
 * This software is owned or controlled by NXP and may only be used strictly 
 * in accordance with the applicable license terms.  
 * By expressly accepting such terms or by downloading, installing, activating 
 * and/or otherwise using the software, you are agreeing that you have read, 
 * and that you agree to comply with and are bound by, such license terms.  
 * If you do not agree to be bound by the applicable license terms, 
 * then you may not retain, install, activate or otherwise use the software. 
 * 
 *
 ****************************************************************************/


/*###############################################################################
#
# MODULE:      BDB
#
# COMPONENT:   bdb_tl_common.c
#
# DESCRIPTION: BDB Touchlink Common functionality
#              
#
###############################################################################*/

/****************************************************************************/
/***        Include files                                                 ***/
/****************************************************************************/
#include <jendefs.h>
#include "bdb_api.h"
#include "bdb_tl.h"
#include "zll_commission.h"
#include "dbg.h"
#include "zb_platform.h"
#include <string.h>
#include <stdlib.h>

#include "portmacro.h"
/****************************************************************************/
/***        Macro Definitions                                             ***/
/****************************************************************************/
#define ADJUST_POWER        TRUE

#ifndef DEBUG_JOIN
#define TRACE_JOIN            FALSE
#else
#define TRACE_JOIN            TRUE
#endif

#ifndef DEBUG_COMMISSION
#define TRACE_COMMISSION      FALSE
#else
#define TRACE_COMMISSION      TRUE
#endif

#ifndef DEBUG_TL_NEGATIVE
#define TRACE_TL_NEGATIVE       FALSE
#else
#define TRACE_TL_NEGATIVE       TRUE
#endif

#define BLOCK_TO_REG        TRUE
#define REG_TO_BLOCK	    FALSE

/****************************************************************************/
/***        Type Definitions                                              ***/
/****************************************************************************/



/****************************************************************************/
/***        Local Function Prototypes                                     ***/
/****************************************************************************/



/****************************************************************************/
/***        Exported Variables                                            ***/
/****************************************************************************/


/****************************************************************************/
/***        Local Variables                                               ***/
/****************************************************************************/
#if (defined JENNIC_CHIP_FAMILY_JN516x) || (defined JENNIC_CHIP_FAMILY_JN517x)
extern PUBLIC CRYPTO_tsReg128 sTLMasterKey;
extern PUBLIC CRYPTO_tsReg128 sTLCertKey;
extern PUBLIC uint8 *au8TLMasterKey;
extern PUBLIC uint8 *au8TLCertKey;
#else
extern PUBLIC uint8 au8TLMasterKey[16];
extern PUBLIC uint8 au8TLCertKey[16];
#endif

/****************************************************************************/
/***        Exported Functions                                            ***/
/****************************************************************************/

/****************************************************************************
 *
 * NAME:
 *
 * DESCRIPTION:
 *
 * RETURNS:
 * void
 *
 ****************************************************************************/
PUBLIC uint8 BDB_u8TlGetRandomPrimary(void)
{
#ifndef FIXED_CHANNEL
    uint32 u32NoOfBits = 0;
        uint32 u32ChannelMask = BDBC_TL_PRIMARY_CHANNEL_SET;
        uint32 u32RandomBitNo, u32Channel;
        int i;

        for (i=0; i<27; i++)
        {
            if (u32ChannelMask & 0x01)
            {
                u32NoOfBits++;
            }
            u32ChannelMask >>= 1;
        }
        if (u32NoOfBits > 1)
        {
            u32RandomBitNo = zbPlatCryptoRandomGet( 0, u32NoOfBits);
            u32RandomBitNo++;
        }
        else
        {
            u32RandomBitNo = 1;
        }

        u32NoOfBits = 0;
        u32Channel = 0;
        u32ChannelMask = BDBC_TL_PRIMARY_CHANNEL_SET;
        for (i=0; i<27 && u32NoOfBits != u32RandomBitNo; i++)
        {
            if (u32ChannelMask & 0x01)
            {
                u32NoOfBits++;
                u32Channel = i;
            }

            u32ChannelMask >>= 1;
        }
        DBG_vPrintf(TRACE_JOIN, "PickChannel %d\n", u32Channel);
        return (uint8)u32Channel;


#else
    return FIXED_CHANNEL;
#endif
}

/****************************************************************************
 *
 * NAME: BDB_u8TlNewUpdateID
 *
 * DESCRIPTION: determines which of 2 network update ids is
 * the freshest
 *
 *
 * RETURNS: the frestest nwk update id
 *
 ****************************************************************************/
PUBLIC uint8 BDB_u8TlNewUpdateID(uint8 u8ID1, uint8 u8ID2 )
{
    if ( (abs(u8ID1-u8ID2)) > 200) {
        return MIN(u8ID1, u8ID2);
    }
    return MAX(u8ID1, u8ID2);
}

/****************************************************************************
 *
 * NAME: BDB_u8TlEncryptKey
 *
 * DESCRIPTION: encrypt the nwk key before transmitting it
 *
 * RETURNS:
 *
 ****************************************************************************/
PUBLIC uint8 BDB_u8TlEncryptKey( uint8* au8InData,
                                  uint8* au8OutData,
                                  uint32 u32TransId,
                                  uint32 u32ResponseId,
                                  uint8 u8KeyIndex)
{
    CRYPTO_tsReg128 sExpanded;
    CRYPTO_tsReg128 sTransportKey;
#if (JENNIC_CHIP_FAMILY == JN517x) && (defined LITTLE_ENDIAN_PROCESSOR)
    CRYPTO_tsAesBlock sAesBlock;
#endif

    CRYPTO_tsReg128 sDataIn,sDataOut;
#if (defined JENNIC_CHIP_FAMILY_JN516x) || (defined JENNIC_CHIP_FAMILY_JN517x)
    sExpanded.u32register0 = u32TransId;
    sExpanded.u32register1 = u32TransId;
    sExpanded.u32register2 = u32ResponseId;
    sExpanded.u32register3 = u32ResponseId;
#else
    sExpanded.u32register0 = u32Reverse(u32TransId);
    sExpanded.u32register1 = u32Reverse(u32TransId);
    sExpanded.u32register2 = u32Reverse(u32ResponseId);
    sExpanded.u32register3 = u32Reverse(u32ResponseId);
#endif

    switch (u8KeyIndex)
    {
        case TL_TEST_KEY_INDEX:
            sTransportKey.u32register0 = 0x50684c69;
            sTransportKey.u32register1 = u32TransId;
            sTransportKey.u32register2 = 0x434c534e;
            sTransportKey.u32register3 = u32ResponseId;
            break;
        case TL_MASTER_KEY_INDEX:
            zbPlatCryptoAes128EcbEncrypt((uint8*)&sExpanded, CRYPTO_AES_BLK_SIZE,
                    au8TLMasterKey, (uint8*)&sTransportKey);
            break;
        case TL_CERTIFICATION_KEY_INDEX:
            zbPlatCryptoAes128EcbEncrypt((uint8*)&sExpanded, CRYPTO_AES_BLK_SIZE,
                    au8TLCertKey, (uint8*)&sTransportKey);
            break;

        default:
            return 3;
            break;
    }
#if (JENNIC_CHIP_FAMILY == JN517x) && (defined LITTLE_ENDIAN_PROCESSOR)
    memcpy( &sAesBlock.au8, au8InData, CRYPTO_AES_BLK_SIZE);
    vSwipeEndian( &sAesBlock, &sDataIn, BLOCK_TO_REG);
#else
    memcpy(&sDataIn,au8InData,0x10);
#endif
 

    memcpy(&sDataOut,au8OutData,0x10);

    zbPlatCryptoAes128EcbEncrypt((uint8*)&sDataIn, CRYPTO_AES_BLK_SIZE,
            (uint8*)&sTransportKey, (uint8*)&sDataOut);

#if ( JENNIC_CHIP_FAMILY == JN517x) && (defined LITTLE_ENDIAN_PROCESSOR)
    vSwipeEndian( &sAesBlock, &sDataOut, REG_TO_BLOCK);
    memcpy( au8OutData, &sAesBlock.au8, CRYPTO_AES_BLK_SIZE);
#else
    memcpy(au8OutData,&sDataOut,0x10);

    
#endif


    return 0;

}

/****************************************************************************
 *
 * NAME: BDB_eTlDecryptKey
 *
 * DESCRIPTION: decrypt the received nwk key
 *
 * RETURNS:
 *
 ****************************************************************************/
PUBLIC uint8 BDB_eTlDecryptKey( uint8* au8InData,
                                  uint8* au8OutData,
                                  uint32 u32TransId,
                                  uint32 u32ResponseId,
                                  uint8 u8KeyIndex)
{
    CRYPTO_tsReg128 sTransportKey;
    CRYPTO_tsReg128 sExpanded;

#if (defined JENNIC_CHIP_FAMILY_JN516x) || (defined JENNIC_CHIP_FAMILY_JN517x)
    sExpanded.u32register0 = u32TransId;
    sExpanded.u32register1 = u32TransId;
    sExpanded.u32register2 = u32ResponseId;
    sExpanded.u32register3 = u32ResponseId;
#else
    sExpanded.u32register0 = u32Reverse(u32TransId);
	sExpanded.u32register1 = u32Reverse(u32TransId);
	sExpanded.u32register2 = u32Reverse(u32ResponseId);
	sExpanded.u32register3 = u32Reverse(u32ResponseId);
#endif

    switch (u8KeyIndex)
    {
        case TL_TEST_KEY_INDEX:
            sTransportKey.u32register0 = 0x50684c69;
            sTransportKey.u32register1 = u32TransId;
            sTransportKey.u32register2 = 0x434c534e;
            sTransportKey.u32register3 = u32ResponseId;
            break;
        case TL_MASTER_KEY_INDEX:
            zbPlatCryptoAes128EcbEncrypt((uint8*)&sExpanded, CRYPTO_AES_BLK_SIZE,
                    au8TLMasterKey, (uint8*)&sTransportKey);
            break;
        case TL_CERTIFICATION_KEY_INDEX:
            zbPlatCryptoAes128EcbEncrypt((uint8*)&sExpanded,
                    CRYPTO_AES_BLK_SIZE, au8TLCertKey, (uint8*)&sTransportKey);
            break;

        default:
            DBG_vPrintf(TRACE_COMMISSION, "***Ooops***\n");
            return 3;
            break;
    }

#if ( defined LITTLE_ENDIAN_PROCESSOR) && (defined JENNIC_CHIP_FAMILY_JN517x)
    sTransportKey.u32register0 = u32Reverse(sTransportKey.u32register0);
    sTransportKey.u32register1 = u32Reverse(sTransportKey.u32register1);
    sTransportKey.u32register2 = u32Reverse(sTransportKey.u32register2);
    sTransportKey.u32register3 = u32Reverse(sTransportKey.u32register3);
#endif

    zbPlatCryptoAes128EcbDecrypt((uint8*)au8InData, (uint8*)&sTransportKey, (uint8*)au8OutData);

#ifdef SHOW_KEY
    int i;
    for (i=0; i<16; i++) {
        DBG_vPrintf(TRACE_COMMISSION, "%02x ", au8OutData[i]);
    }
    DBG_vPrintf(TRACE_COMMISSION, "\r\n");
#endif

    return 0;
}

/****************************************************************************
 *
 * NAME: BDB_bTlIsKeySupported
 *
 * DESCRIPTION: tests if the given key index matches a supported key
 *
 * RETURNS: True if Key index is supported
 *
 ****************************************************************************/
PUBLIC bool_t BDB_bTlIsKeySupported(uint8 u8KeyIndex)
{
    uint16 u16KeyMask = (1<<u8KeyIndex);
    return !!(u16KeyMask & TL_SUPPORTED_KEYS);
}

/****************************************************************************/
/***        END OF FILE                                                   ***/
/****************************************************************************/

