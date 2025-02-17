Overview
========
The cjson_construct example demonstrates how to construct and parse JSON using cJSON.
This example constructs a JSON stucture using cJSON and then print it to string,
then parses the string as JSON and checks whether the data is correct

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
When the demo runs successfully, the log would be seen on the Terminal like:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This is cJSON example.
This example constructs a JSON stucture using cJSON, print it to string and then parses the string as JSON and checks the info.
JSON created successfully:
{
	"sdk version":	2,
	"cJSON version":	"x.y.z",
	"example info":	{
		"category":	"demo_apps",
		"name":	"cjson"
	},
	"demo strings":	["This", "is", "cJSON", "demo"]
}
JSON parsed successfully.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
