Overview
========
The DMA interleave example is a simple demonstration program that uses the SDK software.
It executes linked(address interleave) transfer from the source buffer to destination buffer using the SDK DMA drivers.
The destination buffer is 8 words length:
Descriptor A will define a transfer for member 0, 2, 4, 6
Descriptor B will define a transfer  for member 1, 3, 5, 7.
Descriptor A is linked to descriptor B.
The purpose of this example is to show how to use the DMA and to provide a simple example for
debugging and further development.

SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- IAR embedded Workbench  9.60.1
- Keil MDK  5.39.0
- GCC ARM Embedded  13.2.1
- MCUXpresso  11.10.0

Hardware requirements
=====================
- USB-C cable
- FRDM-RW612 board
- Personal Computer

Board settings
==============


Prepare the Demo
================
1.  Connect a USB-C cable between the PC host and the MCU-Link USB port (J10) on the board
2.  Open a serial terminal with the following settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Download the program to the target board.
4.  Launch the debugger in your IDE to begin running the demo.

Running the demo
================
When the example runs successfully, the following message is displayed in the terminal:
~~~~~~~~~~~~~~~~~~~~~
DMA interleave transfer example begin.

Destination Buffer:

0   0   0   0   0   0   0   0

DMA interleave transfer example finish.

Destination Buffer:

1   11  2   22  3   33  4   44
~~~~~~~~~~~~~~~~~~~~~
