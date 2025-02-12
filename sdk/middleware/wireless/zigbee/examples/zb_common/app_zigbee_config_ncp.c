/*
* Copyright 2024 NXP
*
* SPDX-License-Identifier: BSD-3-Clause
*/

/****************************************************************************/
/***        Include files                                                 ***/
/****************************************************************************/
#include "zigbee_config.h"
#include "ZQueue.h"
#include "bdb_api.h"
#include "ZTimer.h"
#include "zps_apl_af.h"
#include "pdum_gen.h"
#include "PDM.h"
#include "app_zcl_task.h"
#include "app_common_ncp.h"
#include "serial_link_ctrl.h"
#include "serial_link_cmds_ctrl.h"
#include "app_coordinator.h"
#include "dbg.h"

#include <unistd.h>
#include <signal.h>

uint8_t u8TimerZCL;

tszQueue APP_msgBdbEvents;
tszQueue appQueueHandle;
tszQueue zclQueueHandle;
bool_t bZCLQueueFull = FALSE;

uint8_t rxDmaTimerHandle;
PUBLIC void APP_vRxDmaTimerCallbackFnct(void *p_arg);

PUBLIC tsDevicePersist sDevice;

extern teNodeState eNodeState;

PUBLIC void APP_vGenCallback(uint8 u8Endpoint, ZPS_tsAfEvent *psStackEvent);

/****************************************************************************
*
* NAME: APP_vStopZigbeeTimers
*
* DESCRIPTION:
*
*
* RETURNS:
* Never
*
****************************************************************************/
void APP_vStopZigbeeTimers(void)
{
    ZTIMER_eStop(u8TimerZCL);
}


/****************************************************************************
 *
 * NAME: APP_vRunZigbee
 *
 * DESCRIPTION:
 * Main  execution loop
 *
 * RETURNS:
 * Never
 *
 ****************************************************************************/
void APP_vRunZigbee(void)
{
	zps_taskZPS();
	bdb_taskBDB();
}

/****************************************************************************
 *
 * NAME: APP_vInitZigbeeResources
 *
 * DESCRIPTION:
 * Main  execution loop
 *
 * RETURNS:
 * Never
 *
 ****************************************************************************/
void APP_vInitZigbeeResources(void)
{
    ZTIMER_eOpen(&u8TimerZCL,           APP_cbTimerZclTick ,    NULL, ZTIMER_FLAG_PREVENT_SLEEP);
    ZQ_vQueueCreate(&APP_msgBdbEvents,	BDB_QUEUE_SIZE,          sizeof(BDB_tsZpsAfEvent),    NULL);
    ZTIMER_eOpen(&rxDmaTimerHandle, APP_vRxDmaTimerCallbackFnct, NULL, ZTIMER_FLAG_PREVENT_SLEEP);

    PDUM_vInit();
}

/****************************************************************************
 *
 * NAME: APP_eZbModuleInitialise
 *
 * DESCRIPTION:
 * Initialises the ZB module
 *
 * RETURNS:
 * void
 *
 ****************************************************************************/
PUBLIC ZPS_teStatus APP_eZbModuleInitialise(void)
{
    teSL_ZigBeeDeviceType eDeviceType = E_SL_DEVICE_INVALID;
    teSL_DeviceMacType eMacType = E_SL_MAC_UNDEFINED;
    ZPS_teStatus 	eStatus = 0U;
    uint32	u32ZbVersion = 0U;
    uint16	u16OptionMask = 0U;
    uint32	u32SDKVersion = 0U;

    DBG_vPrintf((bool_t)TRACE_APP_INIT, "Zigbee Module initialization\r\n");

    DBG_vPrintf((bool_t)TRACE_APP_INIT, "Reading Zigbee Module Version Number\r\n");
    uint32 u32Count = 0U;
    while(u32Count < MAX_HOST_TO_COPROCESSOR_COMMS_ATTEMPS)
    {
        eStatus = u8GetVersionAndDeviceType(&u32ZbVersion, &eDeviceType, &eMacType, &u16OptionMask, &u32SDKVersion);
        if((eStatus == (ZPS_teStatus)E_SL_MSG_STATUS_BUSY) ||
           (eStatus == (ZPS_teStatus)E_SL_MSG_STATUS_TIME_OUT))
        {
            DBG_vPrintf((bool_t)TRACE_APP_INIT, "Zigbee module busy %d\n", u32Count++);
            vSleep(1000UL);
        }
        else
        {
            break;
        }
    }

    if(eStatus == (ZPS_teStatus)E_ZCL_SUCCESS)
    {
        DBG_vPrintf ((bool_t)TRACE_APP_INIT, "Success: ");
        DBG_vPrintf((bool_t)TRACE_APP_INIT,
                "Version number of Zigbee Module FW 0x%08x Mac type %d Options Mask 0x%04x SDK Version = %d\n",
				u32ZbVersion, eMacType, u16OptionMask, u32SDKVersion);
    }
    else if(eStatus == (ZPS_teStatus)E_SL_MSG_STATUS_HARDWARE_FAILURE)
    {
        DBG_vPrintf((bool_t)TRACE_APP_INIT, "Coprocessor module hardware failure\n");
        APP_vVerifyFatal((bool_t)FALSE, "Fatal error, hardware failure on Coprocessor module", ERR_FATAL_NON_RECOVERABLE);
    }
    else
    {
        DBG_vPrintf((bool_t)TRUE,
                "Error: Status code from attempt to get version number of Zigbee Module %d\r\n",
                eStatus);
        APP_vVerifyFatal((bool_t)FALSE, "Fatal error, cannot continue", ERR_FATAL_NON_RECOVERABLE);
    }

    if (eNodeState == E_STARTUP)
    {
        DBG_vPrintf((bool_t)TRACE_APP_INIT, "Erasing Persistent Data on Zigbee Module\n");
        eStatus = u8ErasePersistentData();
        if(eStatus == (ZPS_teStatus)E_ZCL_SUCCESS)
        {
            DBG_vPrintf((bool_t)TRACE_APP_INIT,
                    "Success: Erasing Persistent Data on Zigbee Module\n");
        }
        else
        {
            DBG_vPrintf((bool_t)TRUE,
                    "Error: Erasing Persistent Data on Zigbee Module 0x%x\r\n", eStatus);
            return eStatus;
        }
        /* wait for Zigbee module to stabilize after PDM erase */
        vSetJNState(JN_NOT_READY);
        vWaitForJNReady(JN_READY_TIME_MS);

        APP_vNcpHostResetZigBeeModule();
        /* wait for Zigbee module to stabilize after Reset */
        vWaitForJNReady(JN_READY_TIME_MS);
    } 
    else 
    {
        bool bCoproFactoryNew = ZPS_bIsCoprocessorNewModule();
        /* Handle mismatch between host and coprocessor state */
        if (eNodeState == E_RUNNING && bCoproFactoryNew == TRUE)
        {
            DBG_vPrintf((bool_t)TRACE_APP_INIT, "Host state is %d, coprocessor module is new.\r\n", eNodeState);
            DBG_vPrintf((bool_t)TRACE_APP_INIT, "Erasing Persistent Data on Host.\r\n");
            PDM_vDeleteAllDataRecords();
            DBG_vPrintf((bool_t)TRACE_APP_INIT, "Resetting Host.\r\n");
            APP_vNcpHostReset();
        }
    }
    return eStatus;
}

/********************************************************************************
  *
  * @fn PUBLIC void APP_vProcessZCLMessage
  *
  */
 /**
  *
  * @param u32Msg uint32
  *
  * @brief process ZCL messages
  *
  * @return void
  *
  * @note
  *
  * imported description
 ********************************************************************************/
PUBLIC void APP_vProcessZCLMessage(uint32 u32Msg)
{
    tsZCL_CallBackEvent  sCallBackEvent;
    ZPS_tsAfEvent sStackEvent;
#ifdef APP_ENABLE_PRINT_BUFFERS
    static uint16 u16appPrintBufferTimeInSecCount = 0U;
#endif

    if(*((uint8*)u32Msg) == (uint32)APP_MSG_TYPE_ZCL_TIMER)
    {

        sCallBackEvent.eEventType = E_ZCL_CBET_TIMER;
        vLockZCLMutex();
        //vZCL_SetUTCTimeWoSyncSet(APP_u32GetTime() - 1U);
        vZCL_EventHandler(&sCallBackEvent);
        vUnlockZCLMutex();
        //vApp_HandleZclTimerEvent();
#ifdef APP_ENABLE_PRINT_BUFFERS
        if(u16appPrintBufferTimeInSec>0){
            u16appPrintBufferTimeInSecCount++;
            if(u16appPrintBufferTimeInSecCount == u16appPrintBufferTimeInSec)
            {
                u16appPrintBufferTimeInSecCount = 0U;
                vSL_PrintRxBufferPool(TRUE);
                PDUM_vPrintAllocatedBuffers(TRUE);
            }
        }
#endif
    }
    else if(*((uint8*)u32Msg) == SL_MSG_TYPE_APDU)
    {
        PDUM_thAPduInstance myPDUM_thAPduInstance = PDUM_INVALID_HANDLE;
        uint8 u8EndPoint;

        /* clear StackEvent */
        (void)ZBmemset(&sStackEvent, 0x00, sizeof(ZPS_tsAfEvent));
        sCallBackEvent.eEventType = E_ZCL_CBET_ZIGBEE_EVENT;
        sCallBackEvent.pZPSevent = &sStackEvent;

        /* Process the serial buffer */
        vSL_HandleApduEvent((uint8*)u32Msg,&myPDUM_thAPduInstance, &sStackEvent);


        /* Before pushing the event to ZCL, construct the serial
         * payload as per stack event structure */
        if((sStackEvent.eType == (ZPS_teAfEventType)ZPS_EVENT_APS_DATA_INDICATION) ||
           (sStackEvent.eType == (ZPS_teAfEventType)ZPS_EVENT_APS_DATA_ACK))
        {
            bool bValidEp = (bool)TRUE;
            if (sStackEvent.eType == (ZPS_teAfEventType)ZPS_EVENT_APS_DATA_INDICATION)
            {
                u8EndPoint = sStackEvent.uEvent.sApsDataIndEvent.u8DstEndpoint;
                (void)ZPS_eAplAfGetEndpointState(sStackEvent.uEvent.sApsDataIndEvent.u8DstEndpoint, &bValidEp);
            }
            else /* sStackEvent.eType ==(ZPS_teAfEventType)ZPS_EVENT_APS_DATA_ACK */
            {
                u8EndPoint = sStackEvent.uEvent.sApsDataAckEvent.u8DstEndpoint;
                (void)ZPS_eAplAfGetEndpointState(sStackEvent.uEvent.sApsDataAckEvent.u8DstEndpoint, &bValidEp);
            }

            if (bValidEp)
            {
                if (u8EndPoint == COORDINATOR_ZDO_ENDPOINT) {
                    vAppHandleZdoEvents(&sStackEvent);
                } else {
                    vLockZCLMutex();
                    /* post to the ZCL as Event */
                    vZCL_EventHandler(&sCallBackEvent);
                    vUnlockZCLMutex();
                }
            }
            else
            {
                if (sStackEvent.eType ==(ZPS_teAfEventType)ZPS_EVENT_APS_DATA_INDICATION)
                {
                    DBG_vPrintf((bool_t)TRUE, "Data Indication for unsupported end point %d\n",
                          sStackEvent.uEvent.sApsDataIndEvent.u8DstEndpoint);
                }
                else
                {
                    DBG_vPrintf((bool_t)TRUE, "Data Ack for unspported end point %d\n",
                          sStackEvent.uEvent.sApsDataAckEvent.u8DstEndpoint);
                }
            }
         }
        if (myPDUM_thAPduInstance != PDUM_INVALID_HANDLE)
        {
            (void)PDUM_eAPduFreeAPduInstance(myPDUM_thAPduInstance);
        }
    }
    else if(*((uint8*)u32Msg) == SL_MSG_TYPE_INTERPAN)
    {
        PDUM_thAPduInstance myPDUM_thAPduInstance = PDUM_INVALID_HANDLE;
        /* clear StackEvent */
        (void)ZBmemset(&sStackEvent, 0x00, sizeof(ZPS_tsAfEvent));
        sCallBackEvent.eEventType = E_ZCL_CBET_ZIGBEE_EVENT;
        sCallBackEvent.pZPSevent = &sStackEvent;

        /* Process the serial buffer */
        vSL_HandleInterpanEvent((uint8*)u32Msg, &myPDUM_thAPduInstance, &sStackEvent);

        /* Before pushing the event to ZCL, construct the serial payload as per
         * stack event structure */
        if((sStackEvent.eType == (ZPS_teAfEventType)ZPS_EVENT_APS_INTERPAN_DATA_INDICATION)||
                (sStackEvent.eType == (ZPS_teAfEventType)ZPS_EVENT_APS_INTERPAN_DATA_CONFIRM))
        {
            /* Hook to handle raw GB spec inter pan messages and drop InterPan CBKE unless in correct state */
            //if ((bool_t)TRUE == bPassInterPanToZcl(&sStackEvent))
            {
                /* post to the ZCL as Event */
                vZCL_EventHandler(&sCallBackEvent);
            }
        }
        if (myPDUM_thAPduInstance != PDUM_INVALID_HANDLE)
        {
            (void)PDUM_eAPduFreeAPduInstance(myPDUM_thAPduInstance);
        }
    }
    else
    {
        /*nodefault action required */
    }

    //APP_vDirtyTimerHandler(u32Msg);
}

/********************************************************************************
 *
 * @fn PUBLIC void APP_vPostToAppQueue
 *
 */
/**
 *
 * @param pvMsg uint8 *
 *
 * @brief post message to app queue
 *
 * @return None
 *
 * @note
 *
 * imported description
********************************************************************************/
PUBLIC void APP_vPostToAppQueue (uint8 *pvMsg)
{
	if (FALSE == ZQ_bQueueSend(&appQueueHandle, pvMsg) )
	{
		vSL_FreeRxBuffer(pvMsg);
		APP_vVerifyFatal( (bool_t)FALSE, "Post to App queue failed", ERR_FATAL_ZIGBEE_RESTART);
	}
}

/********************************************************************************
  *
  * @fn PUBLIC void APP_vPostToAppQueueWord
  *
  */
 /**
  *
  * @param u8MsgType uint8
  *
  * @brief void
  *
  * @return PUBLIC void
  *
  * @note
  *
 ********************************************************************************/
PUBLIC void APP_vPostToAppQueueWord (uint8 u8MsgType )
{
    uint32 u32Msg = QUEUE_MSG_BY_VALUE | (uint32)u8MsgType;
	if (FALSE == ZQ_bQueueSend(&appQueueHandle, (void *)&u32Msg) )
	{
		vSL_FreeRxBuffer( (uint8*)&u32Msg);
		APP_vVerifyFatal( (bool_t)FALSE, "Post to App queue failed", ERR_FATAL_ZIGBEE_RESTART);
	}
}

/********************************************************************************
  *
  * @fn PUBLIC void APP_vPostToZclQueue
  *
  */
 /**
  *
  * @param pvMessage uint8 *
  *
  * @brief post message to zcl queue
  *
  * @return None
  *
  * @note
  *
  * imported description
 ********************************************************************************/
PUBLIC void APP_vPostToZclQueue(uint8 *pvMessage)
{
	if (FALSE == ZQ_bQueueSend(&zclQueueHandle, &pvMessage))
	{
		vSL_FreeRxBuffer(pvMessage);
		bZCLQueueFull = (bool_t)TRUE;
		APP_vVerifyFatal( (bool_t)FALSE, "Queue Send to ZCL failed", ERR_FATAL_ZIGBEE_RESTART);
	}
}

/********************************************************************************
  *
  * @fn PUBLIC void vFlushZclQueue
  *
  */
 /**
  *
  *
  * @brief void
  *
  * @return PUBLIC void
  *
  * @note
  *
 ********************************************************************************/
PUBLIC void vFlushZclQueue(void)
{
	(void)ZQ_bQueueFlush(&zclQueueHandle);
}

/********************************************************************************
  *
  * @fn PUBLIC void vFlushAppQueue
  *
  */
 /**
  *
  *
  * @brief void
  *
  * @return PUBLIC void
  *
  * @note
  *
 ********************************************************************************/
PUBLIC void vFlushAppQueue(void)
{
	(void)ZQ_bQueueFlush(&appQueueHandle);
}

/********************************************************************************
  *
  * @fn PUBLIC void APP_vHandleNwkStackEvents
  *
  */
 /**
  *
  * @param psStackEvent ZPS_tsAfEvent *
  *
  * @brief
  *
  * @return void
  *
  * @note
  *
  * imported description
 ********************************************************************************/
PUBLIC void APP_vHandleNwkStackEvents(ZPS_tsAfEvent *psStackEvent)
{
    /* check ZPS Event Type */
    if(psStackEvent->eType == (ZPS_teAfEventType)(ZPS_EVENT_NWK_NEW_NODE_HAS_JOINED))
    {
    }
    else if(psStackEvent->eType == ZPS_EVENT_NWK_STARTED)
    {
        sDevice.eState = E_NETWORK_RUN;
        //App_PDM_vSaveRecord(&sDevicePDDesc,PDM_DEVICE_INFO);
    }
    else if(psStackEvent->eType == (ZPS_teAfEventType)(ZPS_EVENT_NWK_LEAVE_INDICATION))
    {
            DBG_vPrintf((bool_t)1, "LEAVE_INDICATION Addr %016llx Rejoin %02x\n",
                    psStackEvent->uEvent.sNwkLeaveIndicationEvent.u64ExtAddr,
                    psStackEvent->uEvent.sNwkLeaveIndicationEvent.u8Rejoin);
            if (psStackEvent->uEvent.sNwkLeaveIndicationEvent.u64ExtAddr == 0U)
            {
                /* this device was asked to leave */
                if ((psStackEvent->uEvent.sNwkLeaveIndicationEvent.u8Rejoin != 0U))
                {
                    DBG_vPrintf((bool_t)1, "We were told to leave with rejoin\n");
                }
                else
                {
                    DBG_vPrintf((bool_t)1, "We were told to leave WITHOUT rejoin Clear Data\n");
                }
            }
            else
            {
                /* some other device has left */
                if ((psStackEvent->uEvent.sNwkLeaveIndicationEvent.u8Rejoin != 0U))
                {
                    DBG_vPrintf((bool_t)1, "%016llx Leaving with rejoin\n", psStackEvent->uEvent.sNwkLeaveIndicationEvent.u64ExtAddr);
                    /* do nothing there are coming back */
                }
                else
                {
                    DBG_vPrintf((bool_t)1, "%016llx are Leaving WITHOUT rejoin\n",
                            psStackEvent->uEvent.sNwkLeaveIndicationEvent.u64ExtAddr);

                    DBG_vPrintf((bool_t)1, "Call APP_eCleanUpZclState\n");
                    //(void)APP_eCleanUpZclState(psStackEvent->uEvent.sNwkLeaveIndicationEvent.u64ExtAddr);
                }
            }
    }
    else if(psStackEvent->eType == (ZPS_teAfEventType)(ZPS_EVENT_NWK_LEAVE_CONFIRM))
    {
        DBG_vPrintf((bool_t)TRUE, "Nwk Evt: LEAVE_CONFIRM status %02x Addr %016llx Rejoin %d\r\n",
                psStackEvent->uEvent.sNwkLeaveConfirmEvent.eStatus,
                psStackEvent->uEvent.sNwkLeaveConfirmEvent.u64ExtAddr,
                psStackEvent->uEvent.sNwkLeaveConfirmEvent.bRejoin );
        if (psStackEvent->uEvent.sNwkLeaveConfirmEvent.u64ExtAddr == 0U)
        {
            /* leave confirm for this device */
            if (psStackEvent->uEvent.sNwkLeaveConfirmEvent.bRejoin == (bool_t)TRUE)
            {
                DBG_vPrintf((bool_t)1, "Self Leave with Rejoin\n");
            }
            else
            {
                DBG_vPrintf((bool_t)1, "Self Leave WITHOUT Rejoin - Clear Data\n");
            }
        }
        else
        {
            /* leave comfirm for some other device */
            if (psStackEvent->uEvent.sNwkLeaveConfirmEvent.bRejoin == (bool_t)TRUE)
            {
                DBG_vPrintf((bool_t)1, "We asked %016llx to Leave with Rejoin\n", psStackEvent->uEvent.sNwkLeaveConfirmEvent.u64ExtAddr);
            }
            else
            {
                DBG_vPrintf((bool_t)1, "We asked %016llx to Leave WITHOUT Rejoin\n", psStackEvent->uEvent.sNwkLeaveConfirmEvent.u64ExtAddr);
            }
        }
    }
    else if (psStackEvent->eType == (ZPS_teAfEventType)(ZPS_EVENT_ERROR))
    {
        /* no default action required */
    }
    else
    {
        /* No action required */
    }
    /* Invoke the BDB to handle the event */
    APP_vGenCallback(COORDINATOR_ZDO_ENDPOINT, psStackEvent);
}

/********************************************************************************
  *
  * @fn PUBLIC void APP_vVerifyFatalTest
  *
  */
 /**
  *
  * @param bIsOk bool_t
  * @param strErr const char *
  * @param u32ErrorLevel uint32
  * @param s16Line int16
  *
  * @brief Verify the expression is true or execute fatal error recovery
  *
  * @return None
  *
  * @note
  *
  * imported description
 ********************************************************************************/
PUBLIC void APP_vVerifyFatalTest (bool_t bIsOk, const char *strErr, uint32 u32ErrorLevel, int16 s16Line)
{
    if (bIsOk)
    {
        return;
    }
    DBG_vPrintf((bool_t)TRUE, "***** Fatal error     ******\n");
    DBG_vPrintf((bool_t)TRUE, "%s. Error Level %d, Line %d\n", strErr, u32ErrorLevel, s16Line);

    /* Running tests - stop and loop forever*/
    DBG_vPrintf((bool_t)TRUE, "***** Looping forever ******\n");
    APP_vNcpHostReset();
}

PUBLIC void APP_vNcpHostReset()
{
    kill(getpid(), SIGHUP);
}

PUBLIC uint16 u16Read16Nbo(uint8 *pu8Payload)
{
    uint16 val;
    val = *pu8Payload++;
    val |= (*pu8Payload << 8);
    return val;
}

PUBLIC void vLockZCLMutex(void)
{
    DBG_vPrintf(FALSE, "%s\r\n", __func__);
}

PUBLIC void vUnlockZCLMutex(void)
{
    DBG_vPrintf(FALSE, "%s\r\n", __func__);
}
/****************************************************************************/
/***        END OF FILE                                                   ***/
/****************************************************************************/
