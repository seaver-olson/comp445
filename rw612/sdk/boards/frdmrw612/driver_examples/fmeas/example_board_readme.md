Hardware requirements
=====================
- Micro USB cable
- FRDM-RW612 board
- Personal Computer

Board settings
============
No special settings are required.

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
The log below shows example output of the frequency measure demo in the terminal window:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Capture source: External clock (clk_in) (main system clock reference), reference frequency = 260000000 Hz
Computed frequency value = 39999160 Hz
Expected frequency value = 40000000 Hz

Capture source: SFRO clock (main system clock reference), reference frequency = 260000000 Hz
Computed frequency value = 15999069 Hz
Expected frequency value = 16000000 Hz

Capture source: FFRO clock (main system clock reference), reference frequency = 260000000 Hz
Computed frequency value = 48301200 Hz
Expected frequency value = 48301886 Hz
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
