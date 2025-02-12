/*
 * Copyright 2024 NXP
 *
 * SPDX-License-Identifier: BSD-3-Clause
 * The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html
 */

#include <zephyr/types.h>
#include <stddef.h>
#include <string.h>
#include <errno/errno.h>
#include <sys/printk.h>
#include <sys/byteorder.h>
#include <porting.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <bluetooth/conn.h>
#include <bluetooth/uuid.h>
#include <bluetooth/gatt.h>

#include <bluetooth/services/bas.h>

#include "fsl_shell.h"
#include "fsl_debug_console.h"
#include "shell_bt.h"
#include "coex_shell.h"
#if(CONFIG_WIFI_BLE_COEX_APP)
#include "cli.h"
#endif

extern serial_handle_t g_serialHandle;

SDK_ALIGN(static uint8_t shell_handle_buffer[SHELL_HANDLE_SIZE], 4);
static shell_handle_t shell_handle;


#if(CONFIG_WIFI_BLE_COEX_APP && (CONFIG_DISABLE_BLE == 0))
static char s_shellCoexPrompt[32] = "@Coex> ";
#elif(CONFIG_DISABLE_BLE)
static char s_shellCoexPrompt[32] = "@wifi> ";
#else
static char s_shellCoexPrompt[32] = "@ble> ";
#endif

#if(CONFIG_WIFI_BLE_COEX_APP)
#define WIFI_PREFIX "wifi."

static void process_cmd_wifi(int32_t argc, char **argv)
{
    const struct cli_command *command = NULL;
    char *wifi_cmd = NULL;

    wifi_cmd = argv[0] + strlen(WIFI_PREFIX);
    strcpy(argv[0], wifi_cmd);

    command = lookup_command(argv[0], strlen(argv[0]));
    if (command != NULL)
    {
        command->function(argc, argv);
        (void)PRINTF("Command %s\r\n", command->name);
    }
    else
    {
        (void)PRINTF("Unknown comamnd %s\r\n", argv[0]);
    }
}

static shell_status_t cmd_wifi(shell_handle_t shell, int32_t argc, char **argv)
{
    if (!strcmp(argv[0], "wifi.help")) {
        shell_help(shell);
        help_command(argc, argv);
        return kStatus_SHELL_Success;
    }

    process_cmd_wifi(argc, argv);
    return 0;
}

SHELL_CMD_REGISTER(wifi, NULL, "WiFi shell commands", cmd_wifi, 1, SHELL_MAX_ARGS);

static void wifi_CommandInit(shell_handle_t shell)
{
    if ((shell_status_t)kStatus_Success != SHELL_RegisterCommand(shell, &g_shellCommandwifi))
    {
        (void)PRINTF(shell, "Shell register command %s failed!", g_shellCommandwifi.pcCommand);
    }
}
#endif

static void printSeparator(void)
{
    PRINTF("========================================\r\n");
}

int coex_cli_init(void)
{
    shell_handle = (shell_handle_t)&shell_handle_buffer[0];
    if (kStatus_SHELL_Success != SHELL_Init(shell_handle, g_serialHandle, ""))
    {
        (void)PRINTF("Coex shell initialization failed!\r\n");
        return -1;
    }

#if(CONFIG_WIFI_BLE_COEX_APP)
    printSeparator();
    (void)PRINTF("WiFi shell initialization\r\n");
    wifi_CommandInit(shell_handle);
#endif

#if(CONFIG_DISABLE_BLE == 0)
    printSeparator();
    (void)PRINTF("BLE shell initialization\r\n");
    bt_CommandInit(shell_handle);
#endif
    printSeparator();

    SHELL_ChangePrompt(shell_handle, (char *)s_shellCoexPrompt);
    return 0;
}
