Overview
========
The PSA crypto opaque key example illustrates the generation and usage of following keys:
    1. ECC keys
    2. AES keys
    3. RSA keys
    4. MAC Keys

The location of these keys can be chosen in the yml file for the boards
which the example is being included for. By deafult even though the
example name says opaque, the default location in test is LOCAL_STORAGE i.e
keys in plaintext. This is chosen as default as it would work for all platforms.

However the intent is that this example can be built to test in opaque location keys. For this,
the calling yml needs to define the location of TEST KEYS i.e TEST_KEY_LOCATION.
For eg. For RT1180, we choose this location as PSA_CRYPTO_ELE_S4XX_LOCATION

The test also covers generation and test of both volatile and persistent keys.


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
When the demo runs successfully, the terminal will display similar information like the following:

Location is c00401

VOLATILE KEYS

ECC keys
224 bit ECC_KEY_PAIR(SECP_R1) with sign/verify algo ECDSA(SHA224): NOT SUPPORTED
521 bit ECC_KEY_PAIR(SECP_R1) with sign/verify algo ECDSA(SHA512): NOT SUPPORTED
256 bit ECC_KEY_PAIR(SECP_R1) with sign/verify algo ECDSA(SHA256): PASSED
256 ECC_KEY_PAIR(BRAINPOOL_R1) with sign/verify algo ECDSA(SHA256): NOT SUPPORTED
384 bit ECC_KEY_PAIR(BRAINPOOL_R1) with sign/verify algo ECDSA(SHA384): NOT SUPPORTED

AES keys 
128 bit AES key with encrypt/decrypt algo ECB_NO_PADDING: PASSED
192 bit AES key with encrypt/decrypt algo CBC_NO_PADDING: NOT SUPPORTED
256 bit AES key with encrypt/decrypt algo CTR: PASSED
128 bit AES key with encrypt/decrypt algo CCM: NOT SUPPORTED
256 bit AES key with encrypt/decrypt algo GCM: PASSED
192 bit AES key with sign/verify algo CMAC : NOT SUPPORTED

MAC keys 
256 bit PERSISTENT HMAC key with sign/verify algo HMAC(SHA-256): PASSED

RSA keys 
2048 bit RSA key with sign/verify algo RSA_PKCS1V15(SHA256) : NOT SUPPORTED
2048 bit RSA key with sign/verify algo RSA_PSS(SHA512) : NOT SUPPORTED
