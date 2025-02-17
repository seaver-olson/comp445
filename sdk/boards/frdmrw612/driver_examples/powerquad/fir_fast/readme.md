Overview
========
The PowerQuad fetches data from system RAM and private RAM through different
path, for the calculations which need data from two parts of memory, such as
FIR, convolve, correlate, and some matrix operations, place the input data B
in private RAM improves the performance.
PowerQuad private RAM starts from address 0xe0000000, the first 4KByte is used
by PowerQuad driver, the RAM starts from 0xe0001000 could be used by user
for optimization. In this example, the FIR taps, convolve input data B, and correlate
input data B are not changed, so they are converted to float format and saved
to private RAM at the beginning.
If the example runs successfully, the performance using optimized method is better
than the normal method.

SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- MCUXpresso  11.10.0
- Keil MDK  5.39.0
- IAR embedded Workbench  9.60.1
- GCC ARM Embedded  13.2.1

Hardware requirements
=====================
- USB-C cable
- FRDM-RW612 board
- Personal Computer

Board settings
==============


Prepare the Demo
================
1.  Connect a USB-C cable between the PC host and the MCU-Link USB port (J10) on the board.
2.  Open a serial terminal with the following settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Download the program to the target board.
4.  Launch the debugger in your IDE to begin running the example.

Running the demo
================
The message about error or success will be output to the terminal.
