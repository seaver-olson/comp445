
SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- IAR embedded Workbench  9.60.1
- GCC ARM Embedded  13.2.1
- Keil MDK  5.39.0
- MCUXpresso  11.10.0

Hardware requirements
=====================
- USB-C cable
- FRDM-RW612 board
- Personal Computer

Board settings
==============
No special settings are required.

EdgeLock 2GO Agent

This demo demonstrates how to use the EdgeLock 2GO service for provisioning keys and certificates into the MCU device.
Those keys and certificates can then be used to establish mutual-authenticated TLS connections to cloud services such as AWS or Azure.

The workspace structure (when building this order must be respected):
- el2go_agent_demo_wifi_s: project running in Secure processing environment (SPE)
- el2go_agent_demo_wifi_ns: project running in Non-secure processing environment (NSPE)

Details on building and running the application are included in the el2go_agent_demo_wifi_ns readme under
boards\frdmrw612\se_hostlib_examples\el2go_agent_demo_wifi\el2go_agent_demo_wifi_ns\readme.md
