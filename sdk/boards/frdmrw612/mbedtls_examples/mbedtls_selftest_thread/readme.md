Overview
========
Purpose of this demo is to test valid multithread support for mbedTLS Hardware implementation. For that, two tasks performs in parallel cryptographic 
algorithm testing.


SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- IAR embedded Workbench  9.60.1
- GCC ARM Embedded  13.2.1
- MCUXpresso  11.10.0
- Keil MDK  5.39.0

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
Purpose of this demo is to test valid multithread support for mbedTLS Hardware implementation. For that, two tasks performs in parallel cryptographic 
algorithm testing. When the demo runs successfully, the terminal will display similar information 
like the following:


mbedTLS version 2.28.5
fsys=260000000
Using following implementations:
  SHA: ELS PKC HW accelerated
  AES: ELS PKC HW accelerated
  AES GCM: ELS PKC HW accelerated
  DES: Software implementation
  Asymmetric cryptography: ELS PKC HW accelerated
Create thread successfully
Create thread successfully
  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 2 is running

  Task 1 is running

  Task 1 is running

  Task 2 is running
  
  Task 1 is running  

