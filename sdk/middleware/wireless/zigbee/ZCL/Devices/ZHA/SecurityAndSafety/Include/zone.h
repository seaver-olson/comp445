/****************************************************************************
 *
 * Copyright 2020 NXP
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


/*****************************************************************************
 *
 * MODULE:             IAS ZONE DEVICE
 *
 * COMPONENT:          zone.h
 *
 * DESCRIPTION:        Header for ZigBee IAS Zone profile functions
 *
 *****************************************************************************/

#ifndef ZONE_H
#define ZONE_H

#if defined __cplusplus
extern "C" {
#endif

#include <jendefs.h>
#include "zcl.h"
#include "zcl_options.h"

/*Mandatory General Clusters*/
#include "Basic.h"
#include "Identify.h"

/*Optional Servers */
#ifdef CLD_POWER_CONFIGURATION
    #include "PowerConfiguration.h"
#endif

#ifdef CLD_DEVICE_TEMPERATURE_CONFIGURATION
    #include "DeviceTemperatureConfiguration.h"
#endif

#ifdef CLD_ALARMS
    #include "Alarms.h"
#endif

#ifdef CLD_POLL_CONTROL
    #include "PollControl.h"
#endif

/*Optional Clients */
#ifdef CLD_OTA
    #include "OTA.h"
#endif

#ifdef CLD_TIME
    #include "ZclTime.h"
#endif

#ifdef CLD_DIAGNOSTICS
    #include "Diagnostics.h"
#endif

#ifdef CLD_TEMPERATURE_MEASUREMENT
#include "TemperatureMeasurement.h"
#endif
/*EZ Mode Commisioning supported Clusters */
#include "Groups.h"
#include "Scenes.h"

/*IAS Zone cluster*/
#include "IASZone.h"
#ifdef CLD_ELECTRICAL_MEASUREMENT
	#include "ElectricalMeasurement.h"
#endif

#ifdef CLD_WWAH
    #include "WWAH.h"
#endif
/****************************************************************************/
/***        Macro Definitions                                             ***/
/****************************************************************************/
#define SECURITY_AND_SAFETY_IAS_ZONE_DEVICE_ID                          0x0402
/****************************************************************************/
/***        Type Definitions                                              ***/
/****************************************************************************/

/* Holds cluster instances */
typedef struct 
{
    /* All HA devices have 2 mandatory clusters - Basic(server) and Identify(server) */
#if (defined CLD_BASIC) && (defined BASIC_SERVER)
    tsZCL_ClusterInstance sBasicServer;
#endif

#if (defined CLD_IDENTIFY) && (defined IDENTIFY_SERVER)
    tsZCL_ClusterInstance sIdentifyServer;
#endif

#if (defined CLD_IASZONE) && (defined IASZONE_SERVER)
    tsZCL_ClusterInstance sIASZoneServer;
#endif

    /* Optional Clusters Common to All HA Server Devices */
#if (defined CLD_POWER_CONFIGURATION) && (defined POWER_CONFIGURATION_SERVER)
    tsZCL_ClusterInstance sPowerConfigurationServer;
#endif

#if (defined CLD_DEVICE_TEMPERATURE_CONFIGURATION) && (defined DEVICE_TEMPERATURE_CONFIGURATION_SERVER)
    tsZCL_ClusterInstance sDeviceTemperatureConfigurationServer;
#endif

#if (defined CLD_ALARMS) && (defined ALARMS_SERVER)
    tsZCL_ClusterInstance sAlarmsServer;
#endif

#if (defined CLD_POLL_CONTROL) && (defined POLL_CONTROL_SERVER)
    tsZCL_ClusterInstance sPollControlServer;
#endif

#if (defined CLD_SCENES) && (defined SCENES_SERVER)
    tsZCL_ClusterInstance sScenesServer;
#endif

#if (defined CLD_GROUPS) && (defined GROUPS_SERVER)
    tsZCL_ClusterInstance sGroupsServer;
#endif

#if (defined CLD_DIAGNOSTICS) && (defined DIAGNOSTICS_SERVER)
    tsZCL_ClusterInstance sDiagnosticsServer;
#endif

    /* Optional Clusters Common to All HA Client Devices */
#if (defined CLD_SCENES) && (defined SCENES_CLIENT)
    tsZCL_ClusterInstance sScenesClient;
#endif

#if (defined CLD_GROUPS) && (defined GROUPS_CLIENT)
    tsZCL_ClusterInstance sGroupsClient;
#endif
    
    /* Optional Clusters supported by Server Device */

    /* Optional Clusters supported by Client Device */
#ifdef CLD_OTA
    #ifdef OTA_CLIENT
    /* Add  cluster instance for the OTA cluster */
    tsZCL_ClusterInstance sOTAClient;
    #endif
    
    #ifdef OTA_SERVER
    /* Add  server instance for the OTA cluster */
    tsZCL_ClusterInstance sOTAServer;    
    #endif
#endif

#if (defined CLD_TEMPERATURE_MEASUREMENT && defined TEMPERATURE_MEASUREMENT_SERVER)
    tsZCL_ClusterInstance sTempMeasurementServer;
#endif

#if (defined CLD_WWAH) && (defined WWAH_SERVER)
    tsZCL_ClusterInstance sWWAHServer;
#endif

#if (defined CLD_TIME) && (defined TIME_CLIENT)
    tsZCL_ClusterInstance sTimeClient;
#endif

    /* Optional client clusters */
  
#if (defined CLD_IDENTIFY) && (defined IDENTIFY_CLIENT)
    tsZCL_ClusterInstance sIdentifyClient;
#endif

#if (defined CLD_POLL_CONTROL) && (defined POLL_CONTROL_CLIENT)
    tsZCL_ClusterInstance sPollControlClient;
#endif


#if (defined CLD_ELECTRICAL_MEASUREMENT && defined ELECTRICAL_MEASUREMENT_SERVER)
    tsZCL_ClusterInstance sElectricalMeasurementServer;
#endif
} tsHA_IASZoneDeviceClusterInstances __attribute__ ((aligned(4)));


/* Holds everything required to create an instance of a IAS Zone device */
typedef struct
{
    tsZCL_EndPointDefinition sEndPoint;

    /* Cluster instances */
    tsHA_IASZoneDeviceClusterInstances sClusterInstance;

    /* All HA devices have 2 mandatory clusters - Basic(server) and Identify(server) */
#if (defined CLD_BASIC) && (defined BASIC_SERVER)
    /* Basic Cluster - Server */
    tsCLD_Basic sBasicServerCluster;
#endif

#if (defined CLD_IDENTIFY) && (defined IDENTIFY_SERVER)
    /* Identify Cluster - Server */
    tsCLD_Identify sIdentifyServerCluster;
    tsCLD_IdentifyCustomDataStructure sIdentifyServerCustomDataStructure;
#endif
    /* Mandatory Clusters supported by Thermostat Server Device */  
#if (defined CLD_IASZONE) && (defined IASZONE_SERVER)
    /* IAS Zone Cluster - Server */
    tsCLD_IASZone sIASZoneServerCluster;
    tsCLD_IASZone_CustomDataStructure sIASZoneServerCustomDataStructure;
#endif

    /* Optional Clusters Common to All HA Server Devices */
#if (defined CLD_POWER_CONFIGURATION) && (defined POWER_CONFIGURATION_SERVER)
    /* Power Configuration Cluster - Server */
    tsCLD_PowerConfiguration sPowerConfigServerCluster;
#endif

#if (defined CLD_DEVICE_TEMPERATURE_CONFIGURATION) && (defined DEVICE_TEMPERATURE_CONFIGURATION_SERVER)
    /* Device Temperature Configuration Cluster - Server */
    tsCLD_DeviceTemperatureConfiguration sDeviceTemperatureConfigurationServerCluster;
#endif

#if (defined CLD_ALARMS) && (defined ALARMS_SERVER)
    /* Alarms Cluster - Server */
    tsCLD_Alarms sAlarmsServerCluster;
    tsCLD_AlarmsCustomDataStructure sAlarmsServerCustomDataStructure;
#endif

#if (defined CLD_POLL_CONTROL) && (defined POLL_CONTROL_SERVER)
    tsCLD_PollControl sPollControlServerCluster;
    tsCLD_PollControlCustomDataStructure sPollControlServerCustomDataStructure;
#endif

#if (defined CLD_SCENES) && (defined SCENES_SERVER)
    /* Scenes Cluster - Server */
    tsCLD_Scenes sScenesServerCluster;
    tsCLD_ScenesCustomDataStructure sScenesServerCustomDataStructure;
#endif

#if (defined CLD_GROUPS) && (defined GROUPS_SERVER)
    /* Groups Cluster - Server */
    tsCLD_Groups sGroupsServerCluster;
    tsCLD_GroupsCustomDataStructure sGroupsServerCustomDataStructure;
#endif

#if (defined CLD_DIAGNOSTICS) && (defined DIAGNOSTICS_SERVER)
    tsCLD_Diagnostics sDiagnosticsServerCluster;
#endif

    /* Optional Clusters Common to All HA Client Devices */
#if (defined CLD_SCENES) && (defined SCENES_CLIENT)
    /* Scenes Cluster - Client */
    tsCLD_Scenes sScenesClientCluster;
    tsCLD_ScenesCustomDataStructure sScenesClientCustomDataStructure;
#endif

#if (defined CLD_GROUPS) && (defined GROUPS_CLIENT)
    /* Groups Cluster - Client */
    tsCLD_Groups sGroupsClientCluster;
    tsCLD_GroupsCustomDataStructure sGroupsClientCustomDataStructure;
#endif

    /* Optional Clusters supported by Thermostat Server Device */
#if (defined CLD_TEMPERATURE_MEASUREMENT && defined TEMPERATURE_MEASUREMENT_SERVER)
    tsCLD_TemperatureMeasurement sCLD_TempMeasurementServerCluster;
#endif
    /* Optional Clusters supported by Thermostat Client Device */

#ifdef CLD_OTA
    /* OTA cluster */
    #ifdef OTA_CLIENT
        tsCLD_AS_Ota sCLD_OTA;
        tsOTA_Common sCLD_OTA_CustomDataStruct;
    #endif
    
    #ifdef OTA_SERVER
        tsCLD_AS_Ota sCLD_ServerOTA;     
        tsOTA_Common sCLD_OTA_ServerCustomDataStruct;
    #endif
#endif

    /* Optional client clusters */

#if (defined CLD_IDENTIFY) && (defined IDENTIFY_CLIENT)
    /* Identify Cluster - Client */
    tsCLD_Identify sIdentifyClientCluster;
    tsCLD_IdentifyCustomDataStructure sIdentifyClientCustomDataStructure;
#endif

#if (defined CLD_POLL_CONTROL) && (defined POLL_CONTROL_CLIENT)
    tsCLD_PollControl sPollControlClientCluster;
    tsCLD_PollControlCustomDataStructure sPollControlClientCustomDataStructure;
#endif

#if (defined CLD_ELECTRICAL_MEASUREMENT && defined ELECTRICAL_MEASUREMENT_SERVER)
        tsCLD_ElectricalMeasurement sCLD_ElectricalMeasurement;
#endif

#if (defined CLD_TIME) && (defined TIME_CLIENT)
    tsCLD_Time sTimeClientCluster;
#endif

#if (defined CLD_WWAH) && (defined WWAH_SERVER)
    tsCLD_WWAH sWWAHServerCluster;
    tsCLD_WWAH_CustomDataStructure sWWAHServerCustomDataStructure;
#endif
} tsHA_IASZoneDevice;


/****************************************************************************/
/***        Exported Functions                                            ***/
/****************************************************************************/

PUBLIC teZCL_Status eHA_RegisterIASZoneEndPoint(uint8 u8EndPointIdentifier,
                                                   tfpZCL_ZCLCallBackFunction cbCallBack,
                                                   tsHA_IASZoneDevice *psDeviceInfo);

/****************************************************************************/
/***        External Variables                                            ***/
/****************************************************************************/

#if defined __cplusplus
}
#endif

/****************************************************************************/
/***        END OF FILE                                                   ***/
/****************************************************************************/

#endif /* ZONE_H */
