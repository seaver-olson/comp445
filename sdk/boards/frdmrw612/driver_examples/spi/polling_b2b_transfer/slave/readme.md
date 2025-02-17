Overview
========
The spi_polling_board2board_slave example shows how to use spi driver as slave to do board to board transfer with
polling:

Notice: The SPI slave of this example uses interrupt mode, as there is no polling mode for SPI slave.

In this example, one spi instance as slave and another spi instance on other board as master. Master sends a piece of
data to slave, and receive a piece of data from slave. This example checks if the data received from master is correct.

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
Connect SPI master on board to SPI slave on other board.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Master_board(SPI1)           Slave_board(SPI1)
Pin Name   Board Location     Pin Name   Board Location
MISO       J1 pin 4           MISO       J1 pin 4
MOSI       J1 pin 2           MOSI       J1 pin 2
SCK        J2 pin 12          SCK        J2 pin 12
PCS0       J2 pin 6           PCS0       J2 pin 6
GND        J3 pin 14          GND        J3 pin 14
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
When the demo runs successfully, the log would be seen on the terminal like:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Slave is working....

Succeed!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
