Overview
========
The mbedTLS PSA Crypto example program performs PSA API testing and prints results to the
terminal.


SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- Keil MDK  5.39.0
- IAR embedded Workbench  9.60.1
- GCC ARM Embedded  13.2.1
- MCUXpresso  11.10.0

Hardware requirements
=====================
- USB-C cable
- FRDM-RW612 board
- Personal Computer

Board settings
==============
No special settings are required.

Prepare the Demo
================
1.  Connect a USB cable between the host PC and the MCU-Link USB port on the target board. 
2.  Open a serial terminal with the following settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Download the program to the target board.
4.  Either press the reset button on your board or launch the debugger in your IDE to begin running the demo.

Running the demo
================
When the demo runs successfully, the terminal will display similar information like the following:

cipher encrypt/decrypt AES CBC no padding:
	success!
cipher encrypt/decrypt AES CBC PKCS7 multipart:
	success!
cipher encrypt/decrypt AES CTR multipart:
	success!
