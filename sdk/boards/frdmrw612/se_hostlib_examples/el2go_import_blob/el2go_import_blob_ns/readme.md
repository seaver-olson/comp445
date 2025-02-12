
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

EdgeLock 2GO Import Blob

This demo demonstrates how to import the encrypted EdgeLock 2GO secure object blobs from Flash to the
ITS storage. The imported objects are used for executing crypto operations.

The workspace structure (when building this order must be respected):
- el2go_import_blob_s: project running in Secure processing environment (SPE)
- el2go_import_blob_ns: project running in Non-secure processing environment (NSPE)

The application requires to have encrypted EdgeLock 2GO secure object blobs loaded in Flash. This can be achieved
using offline provisioning via the el2go-tp-app and el2go-provos

Prerequisites
- Active EdgeLock 2GO account (https://www.nxp.com/products/security-and-authentication/secure-service-2go-platform/edgelock-2go:EDGELOCK-2GO)
- Any Serial communicator

Prepare the Demo
================
1.  By default the validation of blobs is disabled; it can be enabled by setting to one the macro

    in file middleware/se_hostlib/nxp_iot_agent/ex/src/apps/psa_examples/el2go_import_blob/el2go_import_blob.h
    #define VALIDATE_PSA_IMPORT_OPERATION 0

2.  To correctly run the example, the secure boot mode on the device needs to be enabled. The bootheader needs to be removed
    from the SPE image, it has to be merged with the NSPE image and the resulting image must be signed with the OEM key.
    Additionaly, if the example is supposed to run in the OEM CLOSED life cycle, the image needs to be encrypted with
    the OEM FW encryption key and loaded as an SB3.1 container.
    Details on how to execute these steps can be found in the Application note AN13813 "Secure boot on RW61x", downloadable from
    https://www.nxp.com/products/wireless-connectivity/wi-fi-plus-bluetooth-plus-802-15-4/wireless-mcu-with-integrated-tri-radio-1x1-wi-fi-6-plus-bluetooth-low-energy-5-3-802-15-4:RW612
    in the "Secure Files" section.

3.  [Optional] In order to maximize the TF-M ITS performance, the maximum supported blob size is set to 2908 bytes. In case
    the user wants to support bigger blobs (8K is the maximum size supported by PSA), he needs to change the following two variables:

    in file middleware/tfm/tf-m/platform/ext/target/nxp/$board$/config_tfm_target.h
    #define ITS_MAX_ASSET_SIZE                     3 * 0xC00

    in file middleware/tfm/tf-m/platform/ext/target/nxp/$board$/partition/flash_layout.h
    #define TFM_HAL_ITS_SECTORS_PER_BLOCK   (3)

4.  Compile the projects using the dedicated toolchain in the following order:
    - el2go_import_blob_s
    - el2go_import_blob_ns

5.  Connect a USB-C cable between the PC host and the MCU-Link USB port (J10) on the board.
6.  Open a serial terminal with the following settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
7. Download the program to the target board. In case the image is signed the base address for downloading
    needs to be adjusted to 0x08001000.
8. Launch the debugger in your IDE to begin running the example.

Running the demo
================
The log below shows the output of the demo in the terminal window:

Booting in SPE project, TF-M initialization:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[WRN] This device was provisioned with dummy keys. This device is NOT SECURE
[Sec Thread] Secure image initializing!
TF-M Float ABI: Hard
Lazy stacking enabled
Booting TF-M 1.7.0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Jump to NSPE project, import of blobs from Flash to PSA ITS storage:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2 blob(s) imported from flash successfully
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Validation of the blobs, encryption for AES Master key, sign operation for ECC key pair:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Validate imported blobs

 Cipher encrypt passed!

 ECC sign passed!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

