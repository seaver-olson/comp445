Hardware requirements
=====================
- Micro USB cable
- FRDM-RW612 board
- Personal Computer

Board settings
============


Prepare the Demo
===============
1.  Connect a micro USB cable between the PC host and the MCU-Link USB port (J10) on the board
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
