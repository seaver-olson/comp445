/*
 *
 * Copyright 2019-2020 NXP
 * SPDX-License-Identifier: Apache-2.0
 */

/** @file
 *
 * ex_sss_boot_connectstring.c:  *The purpose and scope of this file*
 *
 * Project:  SecureIoTMW-Debug@appboot-top-eclipse_x86
 *
 * $Date: Mar 10, 2019 $
 * $Author: ing05193 $
 * $Revision$
 */

/* *****************************************************************************************************************
 * Includes
 * ***************************************************************************************************************** */
#include <ex_sss_boot.h>
#include <nxLog_App.h>
#include <sm_types.h>
#include <stdlib.h>
#include <string.h>

#if defined(_MSC_VER)
#include <Crtdbg.h>
#endif

/* *****************************************************************************************************************
 * Internal Definitions
 * ***************************************************************************************************************** */

/* *****************************************************************************************************************
 * Type Definitions
 * ***************************************************************************************************************** */

/* *****************************************************************************************************************
 * Global and Static Variables
 * Total Size: NNNbytes
 * ***************************************************************************************************************** */

const char gszCOMPortDefault[]    = EX_SSS_BOOT_SSS_COMPORT_DEFAULT;
const char gszSocketPortDefault[] = EX_SSS_BOOT_SSS_SOCKETPORT_DEFAULT;
const char gszReaderDefault[]     = EX_SSS_BOOT_SSS_PCSC_READER_DEFAULT;

/* *****************************************************************************************************************
 * Private Functions Prototypes
 * ***************************************************************************************************************** */

/* *****************************************************************************************************************
 * Public Functions
 * ***************************************************************************************************************** */

sss_status_t ex_sss_boot_connectstring(int argc, const char *argv[], char **pPortName)
{
    const char *portName = NULL;
    sss_status_t status  = kStatus_SSS_Success;
#if defined(_WIN32) && defined(WIN32) && defined(DEBUG)
    _CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
    _CrtSetReportMode(_CRT_ERROR, _CRTDBG_MODE_DEBUG);
#endif

#if !AX_EMBEDDED
    bool last_is_help = FALSE;
    if (argv != NULL) {
        LOG_I("Running %s", argv[0]);
    }
    if (argc > 1                  /* Alteast 1 cli argument */
        && argv != NULL           /* argv not null */
        && argv[argc - 1] != NULL /* Last parameter exists */
    ) {
        if (0 == strncmp("--help", argv[argc - 1], sizeof("--help"))) {
            last_is_help = TRUE;
        }
    }
    if (TRUE == last_is_help) {
        *pPortName = (char *)argv[argc - 1]; /* --help */
        return kStatus_SSS_Success;
    }
    if (argc > 1                    /* Alteast 1 cli argument */
        && argv != NULL             /* argv not null */
        && argv[argc - 1] != NULL   /* Last parameter exists */
        && argv[argc - 1][0] != '-' /* Not something like -h / --help */
    ) {
        portName = argv[argc - 1]; /* last entry, deemed as port name */
        LOG_I("Using PortName='%s' (CLI)", portName);
    }
    else
#endif
    {
#if defined(_MSC_VER)
        char *portName_env = NULL;
        size_t sz          = 0;
        _dupenv_s(&portName_env, &sz, EX_SSS_BOOT_SSS_PORT);
#else
        const char *portName_env = getenv(EX_SSS_BOOT_SSS_PORT);
#endif
        if (portName_env != NULL) {
            portName = portName_env;
            LOG_I("Using PortName='%s' (ENV: %s=%s)", portName, EX_SSS_BOOT_SSS_PORT, portName);
        }
    }

    if (portName == NULL) {
#if defined(RJCT_VCOM) && (RJCT_VCOM == 1)
        portName = gszCOMPortDefault;
        LOG_I("Using PortName='%s' (gszCOMPortDefault)", portName);
#elif (defined(SMCOM_JRCP_V1) && (SMCOM_JRCP_V1 == 1)) || (defined(SMCOM_JRCP_V2) && (SMCOM_JRCP_V2 == 1))
        portName = gszSocketPortDefault;
        LOG_I("Using PortName='%s' (gszSocketPortDefault)", portName);
#elif defined(SMCOM_PCSC) && (SMCOM_PCSC == 1)
        portName = gszReaderDefault;
#else
        status = kStatus_SSS_Success;
#endif

#if AX_EMBEDDED
        /* FINE. To be moved to boot direct */
#else
        LOG_I(
            "If you want to over-ride the selection, use ENV=%s or pass in "
            "command line arguments.",
            EX_SSS_BOOT_SSS_PORT);
#endif
    }

    if (status == kStatus_SSS_Success && pPortName != NULL) {
        *pPortName = (char *)portName;
    }
    return status;
}

bool ex_sss_boot_isSerialPortName(const char *portName)
{
    bool is_vcom = FALSE;
    AX_UNUSED_ARG(portName);
#if defined(RJCT_VCOM) && (RJCT_VCOM == 1)
    if (portName == NULL) {
        is_vcom = FALSE;
    }
    else if (0 == strncmp("COM", portName, sizeof("COM") - 1)) {
        is_vcom = TRUE;
    }
    else if (0 == strncmp("\\\\.\\COM", portName, sizeof("\\\\.\\COM") - 1)) {
        is_vcom = TRUE;
    }
    else if (0 == strncmp("/tty/", portName, sizeof("/tty/") - 1)) {
        is_vcom = TRUE;
    }
    else if (0 == strncmp("/dev/tty", portName, sizeof("/dev/tty") - 1)) {
        is_vcom = TRUE;
    }
#endif
    return is_vcom;
}

bool ex_sss_boot_isSocketPortName(const char *portName)
{
#ifdef ACCESS_MGR_UNIX_SOCKETS
    AX_UNUSED_ARG(portName);
    return TRUE;
#else
    bool is_socket = FALSE;
#if (defined(SMCOM_JRCP_V1) && (SMCOM_JRCP_V1 == 1)) || (defined(SMCOM_JRCP_V2) && (SMCOM_JRCP_V2 == 1))
    if (portName == NULL) {
        is_socket = FALSE;
    }
    else if (NULL != strchr(portName, ':')) {
        is_socket = TRUE;
    }
#endif
    AX_UNUSED_ARG(portName);
    return is_socket;
#endif
}

bool ex_sss_boot_isHelp(const char *argname)
{
    bool last_is_help = FALSE;

    if (NULL != argname && (0 == strncmp("--help", argname, sizeof("--help")))) {
        last_is_help = TRUE;
    }
    return last_is_help;
}

/* *****************************************************************************************************************
 * Private Functions
 * ***************************************************************************************************************** */
