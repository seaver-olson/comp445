Overview
========
This application is executing tests using els_pkc crypto library on RW61x board w.r.t. the NIST 
Cryptographic Algorithm Validation Program (CAVP). The user is able to specfiy, which algorithms 
should get tested - by default all algorithms are tested. The test vectors are specified as 
global variables in the respective files.

SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- IAR embedded Workbench  9.60.1
- MCUXpresso  11.10.0
- Keil MDK  5.39.0
- GCC ARM Embedded  13.2.1

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
The log below shows the output of a successful run 
of the ELS-PKC FIPS Self Test demo in the terminal window:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
START OF ELS PKC FIPS SELF-TEST...
HW ACCELERATION ALGORITHM INFORMATION:
    ECB DRBG: ELS
    CTR DRBG: ELS
    CKDF SP800-108: ELS
    HKDF RFC5869: ELS
    ECDSA NISTP 256: ELS
    ECDSA NISTP 384: PKC
    ECDSA NISTP 521: PKC
    EDDSA ED25519: PKC
    ECDH NISTP 256: ELS
    ECDH NISTP 384: PKC
    ECDH NISTP 521: PKC
    ECC KEYGEN NISTP 256: ELS
    ECC KEYGEN NISTP 384: PKC
    ECC KEYGEN NISTP 521: PKC
    RSA-PKCS15-2048: PKC
    RSA-PKCS15-3072: PKC
    RSA-PKCS15-4096: PKC
    RSA-PSS-2048: PKC
    RSA-PSS-3072: PKC
    RSA-PSS-4096: PKC
    AES-CCM-128: ELS
    AES-CCM-256: ELS
    AES-GCM-128: ELS
    AES-GCM-192: ELS
    AES-GCM-256: ELS
    AES-CTR-128: ELS
    AES-CTR-192: ELS
    AES-CTR-256: ELS
    AES-ECB-128: ELS
    AES-ECB-192: ELS
    AES-ECB-256: ELS
    AES-CBC-128: ELS
    AES-CBC-192: ELS
    AES-CBC-256: ELS
    AES-CMAC-128: ELS
    AES-CMAC-256: ELS
    HMAC-SHA224: SOFTWARE IMPLEMENTATION
    HMAC-SHA256: ELS
    HMAC-SHA384: SOFTWARE IMPLEMENTATION
    HMAC-SHA512: SOFTWARE IMPLEMENTATION
    SHA224: ELS
    SHA256: ELS
    SHA384: ELS
    SHA512: ELS

END OF ELS PKC FIPS SELF-TEST
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
