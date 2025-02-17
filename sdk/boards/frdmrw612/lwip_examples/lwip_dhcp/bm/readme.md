Overview
========

The lwip_dhcp demo application demonstrates a DHCP demo on the lwIP TCP/IP stack.
The application acts as a DHCP client and prints the status as it is progressing.
Once the interface is being bound to an IP address obtained from DHCP server, address information is printed.
It does so continuously - it prints the client's state even as the link state changes.
Those link state changes are also printed.


SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- GCC ARM Embedded  13.2.1
- IAR embedded Workbench  9.60.1
- Keil MDK  5.39.0
- MCUXpresso  11.10.0

Hardware requirements
=====================
- USB-C cable
- FRDM-RW612 board
- Personal Computer

Board settings
==============
Load R485, R486, R487, R488, R489, R491, R490, R522, R521, R520, R524, R523, R508, R505
Remove R518, R507, R506


Prepare the Demo
================
1.  Connect a USB cable between the PC host and the OpenSDA(or USB to Serial) USB port on the target board.
2.  Open a serial terminal on PC for OpenSDA serial(or USB to Serial) device with these settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Insert the Ethernet Cable into the target board's RJ45 port and connect it to a router (or other DHCP server capable device).
4.  Download the program to the target board.
5.  Either press the reset button on your board or launch the debugger in your IDE to begin running the demo.

Running the demo
================
When the demo runs, the log would be seen on the terminal like:

Initializing PHY...
[LINK STATE] netif=0, state=up, speed=1000M_full

************************************************
 DHCP example
************************************************
 DHCP state       : SELECTING
 DHCP state       : REQUESTING
 DHCP state       : CHECKING
 DHCP state       : BOUND

 IPv4 Address     : 192.168.0.4
 IPv4 Subnet mask : 255.255.255.0
 IPv4 Gateway     : 192.168.0.1

