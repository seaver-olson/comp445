Overview
========

The example to demonstrate the usage of Bluetooth BT/BLE and WiFi profiles coexistence.

Before building the example application select Wi-Fi module macro in the app_config.h. (see #define WIFI_`<SoC Name>`_BOARD_`<Module Name>`).

This document provides step-by-step procedures to build and test the example,
and also instructions for running the included sample applications.

SDK version
===========

- Version: 2.16.100

Toolchain supported
===================

Coex environment is suited to be run on a Linux-based OS (Ubuntu OS for example), WSL (Ubuntu 20.04 on Windows) or Windows (command line). There are three tools that need to be installed:

- CMake
- ninja
- the arm-non-eabi gcc cross-compiler

Depending on system used installing each tool done differently.

**NOTE:**

1. Make sure that the paths of all these tools are set into the Path system variable.
2. Tri radio coex app currently **only supports arm-gcc** compilation.

Hardware requirements
=====================

- Micro USB cable
- RD-RW61X-BGA/FRDMRW612 board
- Personal Computer

Board settings
==============

| PIN NAME     | RDRW612-BGA              |
| ------------ | ------------------------ |
| FC0_UART_TXD | HD2(pin 3) <---> HD3(TX) |
| FC0_UART_RXD | HD2(pin 2) <---> HD3(RX) |

**NOTE:**

1. For RDRW612-BGA/QFN A1&A2 board, need to confirm the following settings.
   - unload JP19, load JP9, JP23
   - Connect JP47 to GND.

     > _Connecting JP47 to GND only needs to be GND once after power-on, and then it can be removed_. (<font color=blue>**Recommendation:** always connect JP47 to ground.</font>)
     >
     > _Both A1&A2 JP47 and A0 JP30 are grounded to close U51._
     >
     > <font color=red>_The pins corresponding to U51 on different boards may not be JP47 or JP30, please check._</font>
     >
2. WiFi and BLE use `FC3` UART and OT uses `FC0` UART.

Building the examples
=====================

### 1. Downloading repo:

i. Download SDK soruce code from NXP SDK github release and checkout to SDK release tag, or download SDK package from NXP SDK builder website. SDK Path: `<path-to-sdk>`

ii. Download the ot-nxp repo. (`<path-to-sdk>` and `<path-to-ot-nxp>` should use different `.west` workspace)

```bash
$ git clone https://github.com/NXP/ot-nxp.git -b <ot_github_release_tag>
$ cd <path-to-ot-nxp>
$ git submodule update --init
```

iii: Download the NXP MCUXpresso git SDK and associated middleware from GitHub using the west tool:
```bash
$ cd <path-to-ot-nxp>/third_party/github_sdk/
$ west init -l manifest --mf west.yml
$ west update
```

iv: Create a soft link to the ot-nxp repo in the mcu-sdk-2.0 SDK package
```bash
cd <path-to-sdk>/middleware/wireless/coex/third_party/

# NOTE: <path-to-ot-nxp> must be absolute path.
ln -s <path-to-ot-nxp> ot-nxp
```

**Changes:**

In `<path-to-sdk>/middleware/wireless/coex/third_party/CMakeLists.txt` file, add `${NXP_OT_LIB_DIR}/libtcplp-ftd.a` to target_link_libraries line 52.


---

### 2. Build OT CLI library:

```bash
# NOTE: Make sure the paths of arm-gcc tool are set to the Path system variable.
# For example,
# export ARMGCC_DIR='<path-to-armgcc>'

$ cd <path-to-ot-nxp>

# For coex_cli OT lib build:
$ ./script/build_rw612 ot_cli  -DOT_NXP_BUILD_APP_AS_LIB=ON -DBOARD_APP_UART_INSTANCE=0 -DOT_NXP_DISABLE_TCP=ON -DOT_NXP_LWIP_IPERF=ON -DOT_APP_CLI_FREERTOS_IPERF=ON -DOT_APP_BR_FREERTOS=OFF -DOT_NXP_ENABLE_WPA_SUPP_MBEDTLS=OFF -DCMAKE_BUILD_TYPE=Debug
# For coex_wpa_supplicant OT lib build:
# Note: this coex_wpa_supplicant ot lib only used to compile coex_supplicant_cli with -DCOEX_ENABLE_WIFI=ON, if -DCOEX_ENABLE_WIFI=OFF, should use coex_cli ot lib.
$ ./script/build_rw612 ot_cli  -DOT_NXP_BUILD_APP_AS_LIB=ON -DBOARD_APP_UART_INSTANCE=0 -DOT_NXP_DISABLE_TCP=ON -DOT_NXP_LWIP_IPERF=ON -DOT_APP_CLI_FREERTOS_IPERF=ON -DOT_APP_BR_FREERTOS=OFF -DOT_NXP_ENABLE_WPA_SUPP_MBEDTLS=ON -DCMAKE_BUILD_TYPE=Debug
```

### 3. Build coex examples:

Modify these macros to generate different coexistence images,

| coexistence images | COEX_ENABLE_WIFI | COEX_ENABLE_BLE | COEX_ENABLE_OT | Simulation Case          |
| ------------------ | ---------------- | --------------- | -------------- | ------------------------ |
| WiFi + BLE         | ON               | ON              | OFF            | Matter over WiFi         |
| WiFi + OT          | ON               | OFF             | ON             | /                        |
| BLE  + OT          | OFF              | ON              | ON             | Matter over Thread       |
| WiFi + BLE + OT    | ON               | ON              | ON             | Matter over WiFi + OT BR |

> NOTE: If building BLE+OT, the ot libs should set `DOT_NXP_ENABLE_WPA_SUPP_MBEDTLS` to `OFF`.

Modify these options according to your needs,

| Options            | Value                                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------------- |
| COEX_NXP_BASE      | `edgefast` (default) - base on edgefast-shell                                                         |
| COEX_EXAMPLE_BOARD | `rdrw612bga` (default) - RW612-BGA, `frdmrw612` - FRDMRW612                                         |
| CMAKE_BUILD_TYPE   | `flash_debug`(default), `flash_release` (**Use this option if you need to test throughput.**) |

```bash
# NOTE: Make sure the paths of the SDK package and arm-gcc tool are set to the Path system variable.
# For example,
# SDK soruce code from NXP SDK github release
export NXP_RW612_SDK_ROOT='<path-to-sdk>/core'
# Or, SDK package from NXP SDK builder website
#export NXP_RW612_SDK_ROOT='<path-to-sdk>'
# export ARMGCC_DIR='<path-to-armgcc>'

# For coex_cli example,
$ cd <path-to-coex>
$ ./script/build_rw612 coex_cli -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=rdrw612bga -DCMAKE_BUILD_TYPE=flash_debug

# For coex_wpa_supplicant example,
$ ./script/build_rw612 coex_wpa_supplicant -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=rdrw612bga -DCMAKE_BUILD_TYPE=flash_debug
```

After a successful coex_cli build, the `elf` and `binary` files are found in `build_rw612/rw612_coex_cli/bin`:

- coex_cli.elf (the elf image)
- coex_cli.bin (the binary)

After a successful coex_wpa_supplicant build, the `elf` and `binary` files are found in `build_rw612/rw612_coex_wpa_supplicant/bin`:

- coex_wpa_supplicant.elf (the elf image)
- coex_wpa_supplicant.bin (the binary)

Flash Binaries
==============

> Note: Monolithic feature is default enabled, this means it's no need to flash binaries manually.
>
> If want to disable monolithic feature, for CPU1 need set  `CONFIG_MONOLITHIC_WIFI` to `0` ; for CPU2 need set `gPlatformMonolithicApp_d` to `0`

At this point flash the image with the following command,

```bash
# PFW is wrapped into SDK package -> <sdk package>/components/conn_fwloader/fw_bin

# CMD to write CPU1 wifi image to flash in J-link window:
J-Link> loadbin C:\xxx\rw61xw_raw_cpu1_xx.bin,0x08400000
# CMD to write CPU2 ble to flash in J-link window:
J-Link> loadbin C:\xxx\rw61xn_raw_cpu2_ble_xx.bin,0x08540000
# CMD to write CPU2 ble_15d4 combo image to flash in J-link window:
J-Link> loadbin C:\xxx\ rw61xn_combo_raw_cpu2_ble_15_4_combo_xx.bin,0x085e0000
# CMD to write CPU3 coex app image to flash in J-link window:
J-Link> loadbin C:\xxx\coex_wpa_supplicant.bin, 0x08000000
```

Prepare the Demo
================

1. Connect a micro USB cable between the PC host and the MCU-Link USB port (J7) on the board.
2. Open a serial terminal with the following settings:
   - 115200 baud rate
   - 8 data bits
   - No parity
   - One stop bit
   - No flow control
3. Download the program to the target board.
4. Launch the debugger in your IDE to begin running the example.

Running the example
===================

The log below shows the output of the coex examples (based on edgefast-shell) in the terminal window:

```bash
        Coex APP

SHELL build: ========================================
========================================
     Initialize RW612 Module
========================================
May 14 2024
Copyright  2020  NXP
========================================

WiFi shell initialization
========================================
BLE shell initialization
@bt> ========================================

@Coex>
```

1. WiFi Test

> NOTE: All wifi commands require adding `wifi.` prefix.

- Get the Wi-Fi driver and firmware version:

```bash
@Coex> wifi.wlan-version
WLAN Driver Version   : v1.3.r48.p10
@Coex> WLAN Firmware Version : rw610w-V2, IMU, FP99, 18.99.6.p6, PVE_FIX 1
Command wlan-version
```

- Get MAC Address:

```bash
@Coex> wifi.wlan-mac
MAC address
@Coex> STA MAC Address: 00:50:43:02:98:23
uAP MAC Address: 00:50:43:02:99:23
Command wlan-mac
```

- Scan the network:

```bash
@Coex> wifi.wlan-scan
Scan scheduled...
@Coex> Command wlan-scan
2 networks found:
1C:6A:7A:87:FF:BF  "NXP" Infra
        mode: 802.11AC
        channel: 161
        rssi: -74 dBm
        security: WPA2 Enterprise
        WMM: YES
        802.11K: YES
        802.11V: YES
        802.11W: NA
        WPS: NO
1C:6A:7A:87:FF:BE  "NXPOPEN" Infra
        mode: 802.11AC
        channel: 161
        rssi: -75 dBm
        security: WPA2
        WMM: YES
        802.11K: YES
        802.11V: YES
        802.11W: NA
        WPS: NO
```

2. BLE Test

> NOTE: Please use the command "help" to view the specific commands supported by the example.

- BLE scan devices (the BLE host must initialized before):

```bash
@Coex> bt.init
@Coex> Bluetooth initialized
Settings Loaded

@Coex> bt.scan on
Bluetooth active scan enabled
@Coex> [DEVICE]: 44:6D:F5:85:DC:5F (random), AD evt type 0, RSSI -64  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 44:6D:F5:85:DC:5F (random), AD evt type 4, RSSI -63  C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 6D:B3:D3:8E:ED:A2 (random), AD evt type 0, RSSI -77  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 6D:B3:D3:8E:ED:A2 (random), AD evt type 4, RSSI -76  C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 3F:FB:95:F7:F9:14 (random), AD evt type 3, RSSI -75  C:0 S:0 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 49:A3:4E:86:63:0C (random), AD evt type 0, RSSI -76  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 49:A3:4E:86:63:0C (random), AD evt type 4, RSSI -75  C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 5C:28:50:F9:DD:57 (random), AD evt type 0, RSSI -82  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 4A:7D:B4:12:7B:7A (random), AD evt type 0, RSSI -82  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 4A:7D:B4:12:7B:7A (random), AD evt type 4, RSSI -82  C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 5A:54:C8:99:13:4A (random), AD evt type 0, RSSI -76  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 3B:95:00:4D:F3:EB (random), AD evt type 3, RSSI -82  C:0 S:0 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 47:9D:D0:CB:5F:0D (random), AD evt type 0, RSSI -86  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
@Coex> bt.scan off
Scan successfully stopped
@Coex>
```

- BLE advertise (the BLE host must initialized before):

```bash
@Coex> bt.init
@Coex> Bluetooth initialized
@Coex> bt.advertise on
Advertising started
@Coex> bt.advertise off
Advertising stopped
```

- BLE connect (the BLE host must initialized before):

```bash
@Coex> bt.init
@Coex> Bluetooth initialized
@Coex> bt.connect C0:95:63:23:55:87 random
Connection pending
Connected: 7D:FD:FD:4D:FD:90 (random)
```

- BLE pairing and bonding:

```bash
GATT peripheral role side,
1. Initialize the Host, press "bt.init",
2. Advertising, press "bt.advertise on",
3. After the connection is established, perform the pairing sequence,
   it could be started from peripheral side by pressing "bt.security <level>", such as "bt.security 2".
4. If the bondable is unsupported by peripheral role, press "bt.bondable off". Then start step 3.

GATT central role side,
1. Initialize the Host, press "bt.init",
2. Scaning advertising packets, press "bt.scan on",
3. A few seconds later, stop the scanning, press "bt.scan off"
4. Select the target board and create a new connection. If the taregt is not listed, repeat steps 2 and 3.
   Then press "bt.connect <address: XX:XX:XX:XX:XX:XX> <type: (public|random)>"
5. After the connection is established, perform the pairing sequence,
   it could be started from central side by pressing "bt.security <level>", such as "bt.security 2".
6. If the bondable is unsupported by central role, press "bt.bondable off". Then start step 5.
```

- BLE 1M/2M/Coded PHY update:

```bash
GATT peripheral role side,
1. Initialize the Host, press "bt.init",
2. Advertising, press "bt.advertise on",
3. After the connection is established.
4. Send phy update command, press "bt.phy-update <tx_phy> [rx_phy] [s2] [s8]", tx_phy/rx_phy could be 1(1M) or 2(2M) or 4(Coded).
   such as "bt.phy-update 2 2".
5. The message "LE PHY updated: TX PHY LE 2M, RX PHY LE 2M" would be printed if the phy is updated. note, if peer do not support phy update, then this message will not be printed.

GATT central role side,
1. Initialize the Host, press "bt.init",
2. start scan, press "bt.scan on", Bluetooth device around your current bluetooth will be list, for example,
[DEVICE]: 72:78:C1:B5:0F:DA (random), AD evt type 4, RSSI -32 BLE Peripheral C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: C4:0D:02:55:5E:AD (random), AD evt type 0, RSSI -83  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
[DEVICE]: 66:8F:26:27:1F:52 (random), AD evt type 0, RSSI -82  C:1 S:1 D:0 SR:0 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
3. stop scan, press "bt.scan off",
4. connect target device, press "bt.connect <address: XX:XX:XX:XX:XX:XX> <type: (public|random)>", such as bt.connect 72:78:C1:B5:0F:DA random
5. Send phy update command, press "bt.phy-update <tx_phy> [rx_phy] [s2] [s8]", tx_phy/rx_phy could be 1(1M) or 2(2M) or 4(Coded).
   such as "bt.phy-update 2 2".
6. The message "LE PHY updated: TX PHY LE 2M, RX PHY LE 2M" would be printed if the phy is updated. note, if peer do not support phy update, then this message will not be printed.
```

- BLE Data Packet Length Extension update:

```bash
GATT peripheral role side,
1. Initialize the Host, press "bt.init".
2. Advertising, press "bt.advertise on".
3. After the connection is established.
4. Check current LE RX/TX maximum data length and time, press "bt.info", as blow, default RX/TX maximum data length is 27 and default RX/TX maxumum time is 328.
Type: LE, Role: slave, Id: 0
59:8F:3C:20:93:86 (random)
Remote address: 59:8F:3C:20:93:86 (random) (resolvable)
Local address: 80:D2:1D:E8:30:EC (public) (identity)
Remote on-air address: 59:8F:3C:20:93:86 (random) (resolvable)
Local on-air address: 7C:59:48:2E:A4:51 (random) (resolvable)
Interval: 0x0024 (45 ms)
Latency: 0x0000 (0 ms)
Supervision timeout: 0x0190 (4000 ms)
LE PHY: TX PHY LE 1M, RX PHY LE 1M
LE data len: TX (len: 27 time: 328) RX (len: 27 time: 328)
5. When LE data len is updated by the peer device, below information will be printed.
LE data len updated: TX (len: 27 time: 328) RX (len: 50 time: 512)
6. Update maximum tx data length, press "bt.data-len-update <tx_max_len> [tx_max_time]", such as bt.data-len-update 65, below information will be printed.
Calculated tx time: 632
59:8F:3C:20:93:86 (random)
data len update initiated.
LE data len updated: TX (len: 65 time: 632) RX (len: 50 time: 512)

GATT central role side,
1. Initialize the Host, press "bt.init".
2. Start scan, press "bt.scan on", Bluetooth device around your current bluetooth will be list, for example, 
[DEVICE]: 7C:59:48:2E:A4:51 (random), AD evt type 4, RSSI -44 BLE Peripheral C:0 S:1 D:0 SR:1 E:0 Prim: LE 1M, Secn: No packets, Interval: 0x0000 (0 ms), SID: 0xff
3. Stop scan, press "bt.scan off",
4. Connect target device, press "bt.connect <address: XX:XX:XX:XX:XX:XX> <type: (public|random)>", such as bt.connect 7C:59:48:2E:A4:51 random
5. Check current LE RX/TX maximum data length and time, press "bt.info", as blow, default RX/TX maximum data length is 27 and default RX/TX maxumum time is 328.
Type: LE, Role: master, Id: 0
7C:59:48:2E:A4:51 (random)
Remote address: 7C:59:48:2E:A4:51 (random) (resolvable)
Local address: C0:95:DA:00:BC:82 (public) (identity)
Remote on-air address: 7C:59:48:2E:A4:51 (random) (resolvable)
Local on-air address: 59:8F:3C:20:93:86 (random) (resolvable)
Interval: 0x0024 (45 ms)
Latency: 0x0000 (0 ms)
Supervision timeout: 0x0190 (4000 ms)
LE PHY: TX PHY LE 1M, RX PHY LE 1M
LE data len: TX (len: 27 time: 328) RX (len: 27 time: 328)
6. Update maximum tx data length, press "bt.data-len-update <tx_max_len> [tx_max_time]", such as bt.data-len-update 50, below information will be printed.
Calculated tx time: 512
7C:59:48:2E:A4:51 (random)
data len update initiated.
LE data len updated: TX (len: 50 time: 512) RX (len: 27 time: 328)
7. When LE data len is updated by the peer device, below information will be printed.
LE data len updated: TX (len: 50 time: 512) RX (len: 65 time: 632)
```

- BLE GATT data signing:

```bash
GATT peripheral role side,
1. Initialize the Host, press "bt.init",
2. Advertising, press "bt.advertise on",
3. After the connection is established, perform the pairing sequence,
   it could be started from peripheral side by pressing "bt.security <level>", such as "bt.security 2",
4. After the authentication is successfully, disconnect the connection,
   it could be started from peripheral side by pressing "bt.disconnect",
5. Waiting for new connection. After the connection is established (LL enceyption should be disabled),
   add new serivce "gatt.register".

GATT central role side,
1. Initialize the Host, press "bt.init",
2. Scaning advertising packets, press "bt.scan on",
3. A few seconds later, stop the scanning, press "bt.scan off"
4. Select the target board and create a new connection. If the taregt is not listed, repeat steps 2 and 3.
   Then press "bt.connect <address: XX:XX:XX:XX:XX:XX> <type: (public|random)>"
5. After the connection is established, perform the pairing sequence,
   it could be started from central side by pressing "bt.security <level>", such as "bt.security 2",
6. After the authentication is successfully, disconnect the connection,
   it could be started from central side by pressing "bt.disconnect",
7. Repeat the steps 2 and 3. After the connection is established (LL enceyption should be disabled),
   perform the GATT data signing sequence, press "gatt.signed-write <handle> <data> [length] [repeat]",
   such as "gatt.signed-write 22 AA 1"
```

- BLE GATT Service Changed Indication:

```bash
GATT peripheral role side,
1. Initialize the Host, press "bt.init",
2. Advertising, press "bt.advertise on",
3. After the connection is established. and waiting for the service changed indication is subsribed,
4. Add new serivce, press "gatt.register",
5. Remove the added serivce, press "gatt.unregister".

GATT central role side,
1. Initialize the Host, press "bt.init",
2. Scaning advertising packets, press "bt.scan on",
3. A few seconds later, stop the scanning, press "bt.scan off"
4. Select the target board and create a new connection. If the taregt is not listed, repeat steps 2 and 3.
   Then press "bt.connect <address: XX:XX:XX:XX:XX:XX> <type: (public|random)>"
5. After the connection is established, subscribe the GATT service changed indicator. press "bt.subscribe <CCC handle> <value handle> [ind]",
   such as "gatt.subscribe f e ind".
```
