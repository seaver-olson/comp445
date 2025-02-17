Overview
========
The mbedTLS  PSA Dev API test application provides verification that
crypto API behaviours are implemented correctly and prints results to the
terminal.


SDK version
===========
- Version: 2.16.100

Toolchain supported
===================
- GCC ARM Embedded  13.2.1
- IAR embedded Workbench  9.60.1
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
1.  Connect a USB cable between the host PC and the MCU-Link USB port on the target board. 
2.  Open a serial terminal with the following settings:
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Download the program to the target board.
4.  Either press the reset button on your board or launch the debugger in your IDE to begin running the demo.

Running the demo
================
When the demo runs successfully, the terminal will display similar information like the following:

***** PSA Architecture Test Suite - Version 1.4 *****

Running.. Crypto Suite
******************************************

TEST: 201 | DESCRIPTION: Testing crypto key management APIs | UT:  psa_crypto_init
[Info] Executing tests from non-secure
[Check 1] Test calling crypto functions before psa_crypto_init
[Check 2] Test psa_crypto_init
[Check 3] Test multiple psa_crypto_init 

TEST RESULT: PASSED

******************************************

TEST: 202 | DESCRIPTION: Testing crypto key management APIs | UT: psa_import_key
[Info] Executing tests from non-secure
[Check 1] Test psa_import_key 16 bytes AES
[Check 2] Test psa_import_key 24 bytes AES
[Check 3] Test psa_import_key 32 bytes AES
[Check 4] Test psa_import_key 2048 RSA public key
[Check 5] Test psa_import_key with RSA 2048 keypair
[Check 6] Test psa_import_key with EC Public key
[Check 7] Test psa_import_key with EC keypair
[Check 8] Test psa_import_key 16 bytes AES with invalid bits
[Check 9] Test psa_import_key with key data greater than the algorithm size
[Check 10] Test psa_import_key with incorrect key data size
[Check 11] Test psa_import_key with invalid key type value

TEST RESULT: PASSED

******************************************

TEST: 203 | DESCRIPTION: Testing crypto key management APIs | UT: psa_export_key
[Info] Executing tests from non-secure
[Check 1] Test psa_export_key 16 Byte AES
[Check 2] Test psa_export_key 24 Byte AES
[Check 3] Test psa_export_key 32 Byte AES
[Check 4] Test psa_export_key 2048 RSA public key
[Check 5] Test psa_export_key with RSA 2048 keypair
[Check 6] Test psa_export_key with EC Public key
[Check 7] Test psa_export_key with EC keypair
[Check 8] Test psa_export_key with key policy verify
[Check 9] Test psa_export_key with less buffer size

TEST RESULT: PASSED

******************************************

TEST: 204 | DESCRIPTION: Testing crypto key management APIs | UT: psa_export_public_key
[Info] Executing tests from non-secure
[Check 1] Test psa_export_public_key 16 Byte AES
[Check 2] Test psa_export_public_key 24 Byte AES
[Check 3] Test psa_export_public_key 32 Byte AES
[Check 4] Test psa_export_public_key 2048 RSA public key
[Check 5] Test psa_export_public_key with RSA 2048 keypair
[Check 6] Test psa_export_public_key with EC Public key
[Check 7] Test psa_export_public_key with EC keypair
[Check 8] Test psa_export_public_key with less buffer size

TEST RESULT: PASSED

******************************************

TEST: 205 | DESCRIPTION: Testing crypto key management APIs | UT: psa_destroy_key
[Info] Executing tests from non-secure
[Check 1] Test psa_destroy_key 16 Byte AES
[Check 2] Test psa_destroy_key 24 Byte AES
[Check 3] Test psa_destroy_key 32 Byte AES
[Check 4] Test psa_destroy_key 2048 RSA public key
[Check 5] Test psa_destroy_key with RSA 2048 keypair
[Check 6] Test psa_destroy_key with EC Public key
[Check 7] Test psa_destroy_key with EC keypair

TEST RESULT: PASSED

******************************************

TEST: 206 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_compute
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_compute with SHA256 algorithm
[Check 2] Test psa_hash_compute with SHA384 algorithm
[Check 3] Test psa_hash_compute with SHA512 algorithm
[Check 4] Test psa_hash_compute with small buffer size
[Check 5] Test psa_hash_compute with invalid algorithm

TEST RESULT: PASSED

******************************************

TEST: 207 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_compare
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_compare with SHA256 algorithm
[Check 2] Test psa_hash_compare with SHA384 algorithm
[Check 3] Test psa_hash_compare with SHA512 algorithm
[Check 4] Test psa_hash_compare with incorrect hash
[Check 5] Test psa_hash_compare with incorrect hash length
[Check 6] Test psa_hash_compare with invalid algorithm

TEST RESULT: PASSED

******************************************

TEST: 208 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_setup - ECDH + HKDF-SHA-256
[Check 2] Test psa_key_derivation_setup - ECDH, unknown KDF
[Check 3] Test psa_key_derivation_setup - bad key derivation algorithm
[Check 4] Test psa_key_derivation_setup - Invalid Algorithm

TEST RESULT: PASSED

******************************************

TEST: 209 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_input_bytes
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_input_bytes - Step as Info
[Check 2] Test psa_key_derivation_input_bytes - Step as secret
[Check 3] Test psa_key_derivation_input_bytes - Step as salt
[Check 4] Test psa_key_derivation_input_bytes - Step as label
[Check 5] Test psa_key_derivation_input_bytes - Step as seed
[Check 6] Test psa_key_derivation_input_bytes - Invalid step

TEST RESULT: PASSED

******************************************

TEST: 210 | DESCRIPTION: Testing crypto key attributes APIs | UT: psa_key_attributes_set_get
[Info] Executing tests from non-secure
[Check 1] Test psa_key_attributes_set_get key attributes

TEST RESULT: PASSED

******************************************

TEST: 211 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_setup with SHA256 algorithm
[Check 2] Test psa_hash_setup with SHA384 algorithm
[Check 3] Test psa_hash_setup with SHA512 algorithm
[Check 4] Test psa_hash_setup with Invalid hash algorithm
[Check 5] Test psa_hash_setup with Invalid algorithm
[Check 6] Test psa_hash_setup with CTR algorithm

TEST RESULT: PASSED

******************************************

TEST: 212 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_update
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_update with SHA256 algorithm
[Check 2] Test psa_hash_update with SHA384 algorithm
[Check 3] Test psa_hash_update with SHA512 algorithm
[Check 4] Test psa_hash_update without hash setup
[Check 5] Test psa_hash_update with completed opertaion handle 

TEST RESULT: PASSED

******************************************

TEST: 213 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_verify
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_verify with SHA256 algorithm
[Check 2] Test psa_hash_verify with SHA384 algorithm
[Check 3] Test psa_hash_verify with SHA512 algorithm
[Check 4] Test psa_hash_verify with incorrect expected hash
[Check 5] Test psa_hash_verify with incorrect hash length
[Check 6] test psa_hash_verify with inactive & invalid operation handle

TEST RESULT: PASSED

******************************************

TEST: 214 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_finish
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_finish with SHA256 algorithm
[Check 2] Test psa_hash_finish with SHA384 algorithm
[Check 3] Test psa_hash_finish with SHA512 algorithm
[Check 4] Test psa_hash_finish with invalid hash buffer size
[Check 5] test psa_hash_finish with inactive operation handle

TEST RESULT: PASSED

******************************************

TEST: 215 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_abort
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_abort with SHA256 algorithm
[Check 2] Test psa_hash_abort with SHA384 algorithm
[Check 3] Test psa_hash_abort with SHA512 algorithm
[Check 4] Test psa_hash_finish after calling psa_hash_abort

TEST RESULT: PASSED

******************************************

TEST: 216 | DESCRIPTION: Testing crypto generator functions APIs | UT: psa_generate_key
[Info] Executing tests from non-secure
[Check 1] Test psa_generate_key 16 Byte AES
[Check 2] Test psa_generate_key 24 Byte AES
[Check 3] Test psa_generate_key 32 Byte AES
[Check 4] Test psa_generate_key with RSA 2048 Keypair
[Check 5] Test psa_generate_key with ECC KeyPair
[Check 6] Test psa_generate_key with RSA 2048 Public key
[Check 7] Test psa_generate_key with invalid key type
[Check 8] Test psa_generate_key with invalid usage flags

TEST RESULT: PASSED

******************************************

TEST: 217 | DESCRIPTION: Testing crypto generation APIs | UT: psa_generate_random
[Info] Executing tests from non-secure
[Check 1] Test psa_generate_random to get 0 Byte data
[Check 2] Test psa_generate_random to get 16 Byte data
[Check 3] Test psa_generate_random to get 24 Byte data
[Check 4] Test psa_generate_random to get 32 Byte data
[Check 5] Test psa_generate_random to get 64 Byte data
[Check 6] Test psa_generate_random to get 128 Byte data
[Check 7] Test psa_generate_random to get 256 Byte data
[Check 8] Test psa_generate_random to get 512 Byte data
[Check 9] Test psa_generate_random to get 1000 Byte data

TEST RESULT: PASSED

******************************************

TEST: 218 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_input_key
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_input_key 16 Byte Key
[Check 2] Test psa_key_derivation_input_key with invalid usage
[Check 3] Test psa_key_derivation_input_key with step as label
[Check 4] Test psa_key_derivation_input_key with step as info
[Check 5] Test psa_key_derivation_input_key with step as seed
[Check 6] Test psa_key_derivation_input_key with step as salt
[Check 7] Test psa_key_derivation_input_key with key type as AES(not derive)
[Check 8] Test psa_key_derivation_input_key incorrect key algorithm
[Check 9] Test psa_key_derivation_input_key with key type as 2048 RSA public key
[Check 10] Test psa_key_derivation_input_key with key type as RSA 2048 keypair
[Check 11] Test psa_key_derivation_input_key with zero as step
[Check 12] Test psa_cipher_decrypt_setup - Invalid key handle
[Check 13] Test psa_cipher_decrypt_setup - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 219 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_key_agreement
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_key_agreement - ECDH SECP256R1
[Check 2] Test psa_key_derivation_key_agreement - Invalid step
[Check 3] Test psa_key_derivation_key_agreement - ECDH SECP384R1
[Check 4] Test psa_key_derivation_key_agreement - Invalid usage
[Check 5] Test psa_key_derivation_key_agreement - KDF not a key agreement alg
[Check 6] Test psa_key_derivation_key_agreement - Public key of different curve
[Check 7] Test psa_key_derivation_key_agreement - Pub key instead of Prv key
[Check 8] Test psa_key_derivation_key_agreement - Invalid handle
[Check 9] Test psa_key_derivation_key_agreement - Zero as handle

TEST RESULT: PASSED

******************************************

TEST: 220 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_output_bytes
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_output_bytes - HKDF
[Check 2] Test psa_key_derivation_output_bytes - optional salt
[Check 3] Test psa_key_derivation_output_bytes - capacity < output_length
[Check 4] Test psa_key_derivation_output_bytes - missing info
[Check 5] Test psa_key_derivation_output_bytes - missing salt/secret/info
[Check 6] Test psa_key_derivation_output_bytes - TLS12_PRF
[Check 7] Test psa_key_derivation_output_bytes - capacity < output_length
[Check 8] Test psa_key_derivation_output_bytes - missing seed/secret/label

TEST RESULT: PASSED

******************************************

TEST: 221 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_output_key
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_output_key - Key
[Check 2] Test psa_key_derivation_output_key - Info
[Check 3] Test psa_key_derivation_output_key - Salt
[Check 4] Test psa_key_derivation_output_key - Greater Capacity than available
[Check 5] Test psa_key_derivation_output_key - ECC Public key
[Check 6] Test psa_key_derivation_output_key -  ECC keypair (wrong key length)
[Check 7] Test psa_key_derivation_output_key -  RSA Public Key[Check 8] Test psa_key_derivation_output_key -  RSA keypair
[Check 9] Test psa_key_derivation_output_key - Invalid key size

TEST RESULT: PASSED

******************************************

TEST: 222 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_abort
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_abort

TEST RESULT: PASSED

******************************************

TEST: 223 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_key_derivation_set_get_capacity
[Info] Executing tests from non-secure
[Check 1] Test psa_key_derivation_set_get_capacity - < operation's capacity
[Check 2] Test psa_key_derivation_set_get_capacity - = operation's capacity
[Check 3] Test psa_key_derivation_set_get_capacity - > operation's capacity
[Check 4] Test psa_key_derivation_set_get_capacity - unchanged capacity

TEST RESULT: PASSED

******************************************

TEST: 224 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_encrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_encrypt - CCM - AES - 13B nonce & 8B add data
[Check 2] Test psa_aead_encrypt - CCM - AES - 13B nonce & 32B add data
[Check 3] Test psa_aead_encrypt - CCM - AES - 24 bytes Tag length = 4
[Check 4] Test psa_aead_encrypt - CCM - AES - Zero additional data
[Check 5] Test psa_aead_encrypt - CCM - AES - Zero plaintext
[Check 6] Test psa_aead_encrypt - GCM - AES - 12B nonce & 12B add data
[Check 7] Test psa_aead_encrypt - Unsupported algorithm
[Check 8] Test psa_aead_encrypt - Invalid usage flag
[Check 9] Test psa_aead_encrypt - Invalid ciphertext_size
[Check 10] Test psa_aead_encrypt - Invalid nonce
[Check 11] Test psa_aead_encrypt - Invalid tag length 0

TEST RESULT: PASSED

******************************************

TEST: 225 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_decrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_decrypt - CCM - AES - 13B nonce & 8B add data
[Check 2] Test psa_aead_decrypt - CCM - AES - 13B nonce & 32B add data
[Check 3] Test psa_aead_decrypt - CCM - AES - 24 bytes Tag length = 4
[Check 4] Test psa_aead_decrypt - CCM - AES - Zero additional data
[Check 5] Test psa_aead_decrypt - CCM - AES - Zero plaintext
[Check 6] Test psa_aead_decrypt - GCM - AES - 12B nonce & 12B add data
[Check 7] Test psa_aead_decrypt - Unsupported algorithm
[Check 8] Test psa_aead_decrypt - Invalid usage flag
[Check 9] Test psa_aead_decrypt - Invalid plaintext_size
[Check 10] Test psa_aead_decrypt - Invalid nonce
[Check 11] Test psa_aead_decrypt - Invalid cihpertext
[Check 12] Test psa_aead_decrypt - Invalid cihpertext_size
[Check 13] Test psa_aead_decrypt - Invalid tag length 0

TEST RESULT: PASSED

******************************************

TEST: 226 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_sign_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_sign_setup - HMAC - SHA256
[Check 2] Test psa_mac_sign_setup - CMAC - AES
[Check 3] Test psa_mac_sign_setup - Incompatible HMAC for CMAC
[Check 4] Test psa_mac_sign_setup - Invalid usage flag
[Check 5] Test psa_mac_sign_setup - Invalid key type
[Check 6] Test psa_mac_sign_setup - Truncated MAC too large
[Check 7] Test psa_mac_sign_setup - Truncated MAC too small
[Check 8] Test psa_mac_sign_setup - Unknown MAC algorithm
[Check 9] Test psa_mac_sign_setup - Bad algorithm (not a MAC algorithm)
[Check 10] Test psa_mac_sign_setup invalid key handle
[Check 11] Test psa_mac_sign_setup zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 227 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_update
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_update - HMAC - SHA256 - 64 Byte
[Check 2] Test psa_mac_update - CMAC - AES - 16 Byte
[Check 3] Test psa_mac_update - HMAC - SHA512 - 32 Byte
[Check 4] Test psa_mac_update - HMAC - SHA512 - Invalid operation state

TEST RESULT: PASSED

******************************************

TEST: 228 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_sign_finish
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_sign_finish  - HMAC - SHA256
[Check 2] Test psa_mac_sign_finish  - HMAC - SHA512
[Check 3] Test psa_mac_sign_finish  - CMAC - AES

TEST RESULT: PASSED

******************************************

TEST: 229 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_verify_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_verify_setup - HMAC - SHA256
[Check 2] Test psa_mac_verify_setup - CMAC - AES
[Check 3] Test psa_mac_verify_setup - Incompatible HMAC for CMAC
[Check 4] Test psa_mac_verify_setup - Invalid usage flag
[Check 5] Test psa_mac_verify_setup - Invalid key type
[Check 6] Test psa_mac_verify_setup - Truncated MAC too large
[Check 7] Test psa_mac_verify_setup - Truncated MAC too small
[Check 8] Test psa_mac_verify_setup - Unknown MAC algorithm
[Check 9] Test psa_mac_verify_setup - Bad algorithm (not a MAC algorithm)
[Check 10] Test psa_mac_verify_setup invalid key handle
[Check 11] Test psa_mac_verify_setup zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 230 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_verify_finish
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_verify_finish - HMAC - SHA256
[Check 2] Test psa_mac_verify_finish - HMAC - SHA512
[Check 3] Test psa_mac_verify_finish - CMAC - AES

TEST RESULT: PASSED

******************************************

TEST: 231 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_abort
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_abort - HMAC - SHA256
[Check 2] Test psa_mac_abort - HMAC - SHA512
[Check 3] Test psa_mac_abort - CMAC - AES
[Check 4] Test psa_mac_sign_finish after calling psa_mac_abort

TEST RESULT: PASSED

******************************************

TEST: 232 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_encrypt_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_encrypt_setup 16 Byte AES
[Check 2] Test psa_cipher_encrypt_setup 24 Byte AES
[Check 3] Test psa_cipher_encrypt_setup 32 Byte AES
[Check 4] Test psa_cipher_encrypt_setup 16 Byte raw data
[Check 5] Test psa_cipher_encrypt_setup - not a cipher algorithm
[Check 6] Test psa_cipher_encrypt_setup - unknown cipher algorithm
[Check 7] Test psa_cipher_encrypt_setup - incorrect usage
[Check 8] Test psa_cipher_encrypt_setup - RSA public key
[Check 9] Test psa_cipher_encrypt_setup - RSA keypair
[Check 10] Test psa_cipher_encrypt_setup - EC Public key
[Check 11] Test psa_cipher_encrypt_setup - EC keypair
[Check 12] Test psa_cipher_encrypt_setup - Invalid key handle
[Check 13] Test psa_cipher_encrypt_setup - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 233 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_decrypt_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_decrypt_setup 16 Byte AES
[Check 2] Test psa_cipher_decrypt_setup 24 Byte AES
[Check 3] Test psa_cipher_decrypt_setup 32 Byte AES
[Check 4] Test psa_cipher_decrypt_setup 16 Byte raw data
[Check 5] Test psa_cipher_decrypt_setup - not a cipher algorithm
[Check 6] Test psa_cipher_decrypt_setup - unknown cipher algorithm
[Check 7] Test psa_cipher_decrypt_setup - incorrect usage
[Check 8] Test psa_cipher_decrypt_setup - RSA public key
[Check 9] Test psa_cipher_decrypt_setup - RSA keypair
[Check 10] Test psa_cipher_decrypt_setup - EC Public key
[Check 11] Test psa_cipher_decrypt_setup - EC keypair
[Check 12] Test psa_cipher_decrypt_setup - Invalid key handle
[Check 13] Test psa_cipher_decrypt_setup - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 234 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_generate_iv
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_generate_iv 16 Byte AES
[Check 2] Test psa_cipher_generate_iv 24 Byte AES
[Check 3] Test psa_cipher_generate_iv 32 Byte AES
[Check 4] Test psa_cipher_generate_iv AES - small iv buffer

TEST RESULT: PASSED

******************************************

TEST: 235 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_set_iv
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_set_iv 16 Byte AES
[Check 2] Test psa_cipher_set_iv 24 Byte AES
[Check 3] Test psa_cipher_set_iv 32 Byte AES
[Check 4] Test psa_cipher_set_iv AES - small iv buffer
[Check 5] Test psa_cipher_set_iv AES - large iv buffer

TEST RESULT: PASSED

******************************************

TEST: 236 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_update
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_update - Encrypt - AES CBC_NO_PADDING
[Check 2] Test psa_cipher_update - Encrypt - AES CBC_NO_PADDING (Short in)
[Check 3] Test psa_cipher_update - Encrypt - AES CBC_PKCS7
[Check 4] Test psa_cipher_update - Encrypt - AES CBC_PKCS7 (Short input)
[Check 5] Test psa_cipher_update - Encrypt - AES CTR
[Check 6] Test psa_cipher_update - Encrypt - small output buffer size
[Check 7] Test psa_cipher_update - Decrypt - AES CBC_NO_PADDING
[Check 8] Test psa_cipher_update - Decrypt - AES CBC_NO_PADDING (Short in)
[Check 9] Test psa_cipher_update - Decrypt - AES CBC_PKCS7
[Check 10] Test psa_cipher_update - Decrypt - AES CBC_PKCS7 (Short input)
[Check 11] Test psa_cipher_update - Decrypt - AES CTR
[Check 12] Test psa_cipher_update - Decrypt - small output buffer size
[Check 13] Test psa_cipher_update without cipher setup

TEST RESULT: PASSED

******************************************

TEST: 237 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_finish
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_finish - Encrypt - AES CBC_NO_PADDING
[Check 2] Test psa_cipher_finish - Encrypt - AES CBC_NO_PADDING (Short in)
[Check 3] Test psa_cipher_finish - Encrypt - AES CBC_PKCS7
[Check 4] Test psa_cipher_finish - Encrypt - AES CBC_PKCS7 (Short input)
[Check 5] Test psa_cipher_finish - Encrypt - AES CTR
[Check 6] Test psa_cipher_finish - Encrypt - AES CTR (short input)
[Check 7] Test psa_cipher_finish - Encrypt - small output buffer size
[Check 8] Test psa_cipher_finish - Decrypt - AES CBC_NO_PADDING
[Check 9] Test psa_cipher_finish - Decrypt - AES CBC_NO_PADDING (Short in)
[Check 10] Test psa_cipher_update - Decrypt - AES CBC_PKCS7
[Check 11] Test psa_cipher_finish - Decrypt - AES CBC_PKCS7 (Short input)
[Check 12] Test psa_cipher_finish - Decrypt - AES CTR
[Check 13] Test psa_cipher_finish - Decrypt - AES CTR (short input)

TEST RESULT: PASSED

******************************************

TEST: 238 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_abort
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_abort - Encrypt - AES CBC_NO_PADDING
[Check 2] Test psa_cipher_abort - Encrypt - AES CBC_PKCS7
[Check 3] Test psa_cipher_abort - Encrypt - AES CTR
[Check 4] Test psa_cipher_abort - Decrypt - AES CBC_NO_PADDING
[Check 5] Test psa_cipher_abort - Decrypt - AES CBC_PKCS7
[Check 6] Test psa_cipher_abort - Decrypt - AES CTR
[Check 7] Test psa_cipher_update after psa_cipher_abort should fail

TEST RESULT: PASSED

******************************************

TEST: 239 | DESCRIPTION: Testing crypto asymmetric APIs | UT: psa_asymmetric_encrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_asymmetric_encrypt - RSA PKCS1V15
[Check 2] Test psa_asymmetric_encrypt - RSA KEY_PAIR PKCS1V15
[Check 3] Test psa_asymmetric_encrypt - RSA OAEP SHA256
[Check 4] Test psa_asymmetric_encrypt - RSA OAEP SHA256 with label
[Check 5] Test psa_asymmetric_encrypt - RSA KEY_PAIR OAEP SHA256
[Check 6] Test psa_asymmetric_encrypt - RSA KEY_PAIR OAEP SHA256 with label
[Check 7] Test psa_asymmetric_encrypt - Small output buffer
[Check 8] Test psa_asymmetric_encrypt - Invalid algorithm
[Check 9] Test psa_asymmetric_encrypt - Invalid key type
[Check 10] Test psa_asymmetric_encrypt - Invalid usage
[Check 11] Test psa_asymmetric_encrypt - RSA PKCS1V15 - Salt
[Check 12] Test psa_asymmetric_encrypt - ECC public key
[Check 13] Test psa_asymmetric_encrypt - Invalid key handle
[Check 14] Test psa_asymmetric_encrypt - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 240 | DESCRIPTION: Testing crypto asymmetric APIs | UT: psa_asymmetric_decrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_asymmetric_decrypt - RSA KEY_PAIR PKCS1V15
[Check 2] Test psa_asymmetric_decrypt - RSA KEY_PAIR OAEP SHA256
[Check 3] Test psa_asymmetric_decrypt - RSA KEY_PAIR OAEP SHA256 with label
[Check 4] Test psa_asymmetric_decrypt - Invalid key type (RSA public key)
[Check 5] Test psa_asymmetric_decrypt - Small output buffer
[Check 6] Test psa_asymmetric_decrypt - Invalid algorithm
[Check 7] Test psa_asymmetric_decrypt - Invalid key type (AES Key)
[Check 8] Test psa_asymmetric_decrypt - Invalid usage
[Check 9] Test psa_asymmetric_decrypt - RSA PKCS1V15 - Salt
[Check 10] Test psa_asymmetric_decrypt - Invalid key handle
[Check 11] Test psa_asymmetric_decrypt - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 241 | DESCRIPTION: Testing crypto asymmetric APIs | UT: psa_sign_hash
[Info] Executing tests from non-secure
[Check 1] Test psa_sign_hash - RSA KEY_PAIR PKCS1V15 RAW
[Check 2] Test psa_sign_hash - RSA KEY_PAIR PKCS1V15 SHA-256
[Check 3] Test psa_sign_hash - ECDSA SECP256R1 SHA-256
[Check 4] Test psa_sign_hash - Invalid key type (RSA public key)
[Check 5] Test psa_sign_hash - Small output buffer
[Check 6] Test psa_sign_hash - Invalid algorithm
[Check 7] Test psa_sign_hash - Invalid key type (AES Key)
[Check 8] Test psa_sign_hash - Invalid usage
[Check 9] Test psa_sign_hash - Wrong hash size
[Check 10] Test psa_sign_hash - Invalid key handle
[Check 11] Test psa_sign_hash - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 242 | DESCRIPTION: Testing crypto asymmetric APIs | UT: psa_verify_hash
[Info] Executing tests from non-secure
[Check 1] Test psa_verify_hash - RSA KEY_PAIR PKCS1V15 RAW
[Check 2] Test psa_verify_hash - RSA KEY_PAIR PKCS1V15 SHA-256
[Check 3] Test psa_verify_hash - ECDSA KEY_PAIR SECP256R1 SHA-256
[Check 4] Test psa_verify_hash - EC public key
[Check 5] Test psa_verify_hash - RSA public key
[Check 6] Test psa_verify_hash - Small output buffer
[Check 7] Test psa_verify_hash - Invalid algorithm
[Check 8] Test psa_verify_hash - Invalid key type (AES Key)
[Check 9] Test psa_verify_hash - Invalid usage
[Check 10] Test psa_verify_hash - Wrong hash size
[Check 11] Test psa_verify_hash - Wrong signature
[Check 12] Test psa_verify_hash - Wrong signature size
[Check 13] Test psa_verify_hash - Invalid key handle
[Check 14] Test psa_verify_hash - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 243 | DESCRIPTION: Testing crypto key derivation APIs | UT: psa_raw_key_agreement
[Info] Executing tests from non-secure
[Check 1] Test psa_raw_key_agreement - ECDH SECP256R1
[Check 2] Test psa_raw_key_agreement - Small buffer size
[Check 3] Test psa_raw_key_agreement - ECDH SECP384R1
[Check 4] Test psa_raw_key_agreement - Invalid usage
[Check 5] Test psa_raw_key_agreement - Unknown KDF
[Check 6] Test psa_raw_key_agreement - Not a key agreement alg
[Check 7] Test psa_raw_key_agreement - Public key on different curve
[Check 8] Test psa_raw_key_agreement - Public key instead of private key
[Check 9] Test psa_raw_key_agreement - Invalid key handle
[Check 10] Test psa_raw_key_agreement - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 244 | DESCRIPTION: Testing crypto key management APIs | UT: psa_copy_key
[Info] Executing tests from non-secure
[Check 1] Test psa_copy_key - 2048 RSA public key
[Check 2] Test psa_copy_key - RSA 2048 keypair
[Check 3] Test psa_copy_key - Incompatible target policy(source and target)
[Check 4] Test psa_copy_key - source key with no export usage
[Check 5] Test psa_copy_key - EC Public key
[Check 6] Test psa_copy_key - EC keypair

TEST RESULT: PASSED

******************************************

TEST: 245 | DESCRIPTION: Testing crypto hash functions APIs | UT: psa_hash_clone
[Info] Executing tests from non-secure
[Check 1] Test psa_hash_clone - SHA256 algorithm
[Check 2] Test psa_hash_clone - SHA384 algorithm
[Check 3] Test psa_hash_clone - SHA512 algorithm
[Check 4] Test psa_hash_clone - from an inactive source operation
[Check 5] Test psa_hash_clone - on an active target operation

TEST RESULT: PASSED

******************************************

TEST: 246 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_compute
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_compute HMAC SHA 256
[Check 2] Test psa_mac_compute HMAC SHA 512
[Check 3] Test psa_mac_compute CMAC AES 128
[Check 4] Test psa_mac_compute small size buffer
[Check 5] Test psa_mac_compute - Invalid key type

TEST RESULT: PASSED

******************************************

TEST: 247 | DESCRIPTION: Testing crypto MAC APIs | UT: psa_mac_verify
[Info] Executing tests from non-secure
[Check 1] Test psa_mac_verify HMAC SHA 256
[Check 2] Test psa_mac_verify - Incompactible HMAC for CMAC
[Check 3] Test psa_mac_verify - Invalid usage
[Check 4] Test psa_mac_verify - Truncated MAC too large
[Check 5] Test psa_mac_verify - Truncated MAC too small
[Check 6] Test psa_mac_verify - bad algorithm (unknown MAC algorithm)
[Check 7] Test psa_mac_verify HMAC SHA 512
[Check 8] Test psa_mac_verify CMAC AES 128
[Check 9] Test psa_mac_verify - Invalid key type
[Check 10] Test psa_mac_verify small size buffer

TEST RESULT: PASSED

******************************************

TEST: 248 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_encrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_encrypt - Encrypt - AES CBC_NO_PADDING
[Check 2] Test psa_cipher_encrypt - Encrypt - AES CBC_NO_PADDING (Short input)
[Check 3] Test psa_cipher_encrypt - Encrypt - AES CBC_PKCS7
[Check 4] Test psa_cipher_encrypt - Encrypt - AES CBC_PKCS7 (Short input)
[Check 5] Test psa_cipher_encrypt - Encrypt - AES CTR
[Check 6] Test psa_cipher_encrypt - Encrypt - AES CTR (short input)
[Check 7] Test psa_cipher_encrypt - small output buffer size
[Check 8] Test psa_cipher_encrypt - Decrypt - AES CBC_NO_PADDING

TEST RESULT: PASSED

******************************************

TEST: 249 | DESCRIPTION: Testing crypto symmetric cipher APIs | UT: psa_cipher_decrypt
[Info] Executing tests from non-secure
[Check 1] Test psa_cipher_decrypt - Encrypt - AES CBC_NO_PADDING
[Check 2] Test psa_cipher_decrypt - Decrypt - AES CBC_NO_PADDING
[Check 3] Test psa_cipher_decrypt - Decrypt - AES CBC_NO_PADDING (Short input)
[Check 4] Test psa_cipher_decrypt - Decrypt - AES CBC_NO_PADDING
[Check 5] Test psa_cipher_decrypt - Decrypt - AES CBC_PKCS7
[Check 6] Test psa_cipher_decrypt - Decrypt - AES CBC_PKCS7 (Short input)
[Check 7] Test psa_cipher_decrypt - Decrypt - AES CTR

TEST RESULT: PASSED

******************************************

TEST: 250 | DESCRIPTION: Testing crypto key management APIs | UT: psa_sign_message
[Info] Executing tests from non-secure
[Check 1] Test psa_sign_message - RSA KEY_PAIR PKCS1V15 RAW
[Check 2] Test psa_sign_message - ECDSA SECP256R1 SHA-256
[Check 3] Test psa_sign_message - Invalid key type (RSA public key)
[Check 4] Test psa_sign_message - Small output buffer
[Check 5] Test psa_sign_message - Invalid algorithm
[Check 6] Test psa_sign_message - Invalid key type (AES Key)
[Check 7] Test psa_sign_message - Invalid usage
[Check 8] Test psa_sign_message - Mismatch key type and Algorithm
[Check 9] Test psa_sign_message - Alg mismatch in key and API call
[Check 10] Test psa_sign_message - Invalid key handle
[Check 11] Test psa_sign_message - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 251 | DESCRIPTION: Testing crypto key management APIs | UT: psa_verify_message
[Info] Executing tests from non-secure
[Check 1] Test psa_verify_message - RSA KEY_PAIR PKCS1V15 RAW
[Check 2] Test psa_verify_message - RSA Public Key PKCS1V15 RAW
[Check 3] Test psa_verify_message - RSA KEY_PAIR PKCS1V15 SHA-256
[Check 4] Test psa_verify_message - ECDSA KEY_PAIR SECP256R1 SHA-256
[Check 5] Test psa_verify_message - ECDSA Public Key SECP256R1 SHA-256
[Check 6] Test psa_verify_message - Small output buffer
[Check 7] Test psa_verify_message - Invalid algorithm
[Check 8] Test psa_verify_message - Invalid key type (AES Key)
[Check 9] Test psa_verify_message - Invalid usage
[Check 10] Test psa_verify_message - Wrong message size
[Check 11] Test psa_verify_message - Wrong signature
[Check 12] Test psa_verify_message - Wrong signature size
[Check 13] Test psa_verify_message - Invalid key handle
[Check 14] Test psa_verify_message - Zero as key handle

TEST RESULT: PASSED

******************************************

TEST: 252 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_encrypt_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_encrypt_setup - CCM - AES
[Check 2] Test psa_aead_encrypt_setup - CCM - AES - Tag length = 4
[Check 3] Test psa_aead_encrypt_setup - CCM - AES - Mismatched tag length
[Check 4] Test psa_aead_encrypt_setup - CCM - AES - Default Tag length
[Check 5] Test psa_aead_encrypt_setup - GCM - AES
[Check 6] Test psa_aead_encrypt_setup - Invalid usage flag

TEST RESULT: PASSED

******************************************

TEST: 253 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_decrypt_setup
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_decrypt_setup - CCM - AES
[Check 2] Test psa_aead_decrypt_setup - CCM - AES - Tag length = 4
[Check 3] Test psa_aead_decrypt_setup - CCM - AES - Mismatched tag length
[Check 4] Test psa_aead_decrypt_setup - CCM - AES - Default Tag length
[Check 5] Test psa_aead_decrypt_setup - GCM - AES
[Check 6] Test psa_aead_decrypt_setup - Invalid usage flag

TEST RESULT: PASSED

******************************************

TEST: 254 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_generate_nonce
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_generate_nonce - CCM
[Check 2] Test psa_aead_generate_nonce - CCM - Tag length = 4
[Check 3] Test psa_aead_generate_nonce - CCM - Small buffer size
[Check 4] Test psa_aead_generate_nonce - CCM - Uninitialized operation
[Check 5] Test psa_aead_generate_nonce - CCM - Decrypt operation
[Check 6] Test psa_aead_generate_nonce - GCM
[Check 7] Test psa_aead_generate_nonce - GCM - Decrypt operation

TEST RESULT: PASSED

******************************************

TEST: 255 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_set_nonce
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_set_nonce - Encrypt - CCM
[Check 2] Test psa_aead_set_nonce - Encrypt - CCM - Tag length = 4
[Check 3] Test psa_aead_set_nonce - Encrypt - CCM - Small nonce size
[Check 4] Test psa_aead_set_nonce - Encrypt - CCM - Large nonce size
[Check 5] Test psa_aead_set_nonce - Encrypt - CCM - Invalid operation state
[Check 6] Test psa_aead_set_nonce - Encrypt - GCM
[Check 7] Test psa_aead_set_nonce - Decrypt - CCM
[Check 8] Test psa_aead_set_nonce - Decrypt - CCM - Tag length = 4
[Check 9] Test psa_aead_set_nonce - Decrypt - CCM - Small nonce size
[Check 10] Test psa_aead_set_nonce - Decrypt - CCM - Large nonce size
[Check 11] Test psa_aead_set_nonce - Decrypt - CCM - Invalid operation state
[Check 12] Test psa_aead_set_nonce - Decrypt - GCM

TEST RESULT: PASSED

******************************************

TEST: 256 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_set_lengths
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_set_lengths - Encrypt - CCM
[Check 2] Test psa_aead_set_lengths - Encrypt - CCM - Tag length = 4
[Check 3] Test psa_aead_set_lengths - Encrypt - CCM - Zero ad_length
[Check 4] Test psa_aead_set_lengths - Encrypt - CCM - Zero plaintext_length
[Check 5] Test psa_aead_set_lengths - Encrypt - CCM - Invalid operation state
[Check 6] Test psa_aead_set_lengths - Encrypt - GCM
[Check 7] Test psa_aead_set_lengths - Decrypt - CCM
[Check 8] Test psa_aead_set_lengths - Decrypt - CCM - Tag length = 4
[Check 9] Test psa_aead_set_lengths - Decrypt - CCM - Zero ad_length
[Check 10] Test psa_aead_set_lengths - Decrypt - CCM - Zero plaintext_length
[Check 11] Test psa_aead_set_lengths - Decrypt - CCM - Invalid operation state
[Check 12] Test psa_aead_set_lengths - Decrypt - GCM

TEST RESULT: PASSED

******************************************

TEST: 257 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_update_ad
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_update_ad - Encrypt - CCM
[Check 2] Test psa_aead_update_ad - Encrypt - CCM - Tag length = 4
[Check 3] Test psa_aead_update_ad - Encrypt - CCM - Zero ad_length
[Check 4] Test psa_aead_update_ad - Encrypt - CCM - Zero plaintext_length
[Check 5] Test psa_aead_update_ad - Encrypt - CCM - Invalid operation state
[Check 6] Test psa_aead_update_ad - Encrypt - CCM - Overflow input length
[Check 7] Test psa_aead_update_ad - Decrypt - CCM
[Check 8] Test psa_aead_update_ad - Decrypt - CCM - Tag length = 4
[Check 9] Test psa_aead_update_ad - Decrypt - CCM - Zero ad_length
[Check 10] Test psa_aead_update_ad - Decrypt - CCM - Zero plaintext_length
[Check 11] Test psa_aead_update_ad - Decrypt - CCM - Invalid operation state
[Check 12] Test psa_aead_update_ad - Decrypt - CCM - Overflow input length

TEST RESULT: PASSED

******************************************

TEST: 258 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_update
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_update - Encrypt - CCM
[Check 2] Test psa_aead_update - Encrypt - CCM - Tag length = 4
[Check 3] Test psa_aead_update - Encrypt - CCM - Zero ad_length
[Check 4] Test psa_aead_update - Encrypt - CCM - Zero plaintext_length
[Check 5] Test psa_aead_update - Encrypt - CCM - Small buffer size
[Check 6] Test psa_aead_update - Encrypt - CCM - Less add data than specified
[Check 7] Test psa_aead_update - Encrypt - CCM - Overflow input length
[Check 8] Test psa_aead_update - Encrypt - CCM - Invalid operation state
[Check 9] Test psa_aead_update - Decrypt - CCM
[Check 10] Test psa_aead_update - Decrypt - CCM - Tag length = 4
[Check 11] Test psa_aead_update - Decrypt - CCM - Zero ad_length
[Check 12] Test psa_aead_update - Decrypt - CCM - Zero plaintext_length
[Check 13] Test psa_aead_update - Decrypt - CCM - Small buffer size
[Check 14] Test psa_aead_update - Decrypt - Less add data than specified
[Check 15] Test psa_aead_update - Decrypt - CCM - Overflow input length
[Check 16] Test psa_aead_update - Decrypt - CCM - Invalid operation state

TEST RESULT: PASSED

******************************************

TEST: 259 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_finish
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_finish - AES-CCM
[Check 2] Test psa_aead_finish - AES-CCM 24 bytes Tag length = 4
[Check 3] Test psa_aead_finish - Small buffer size
[Check 4] Test psa_aead_finish - Input length is less than plaintext length
[Check 5] Test psa_aead_finish - GCM - 16B AES - 12B Nonce & 12B additional data

TEST RESULT: PASSED

******************************************

TEST: 260 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_abort
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_abort - Encrypt - CCM - AES
[Check 2] Test psa_aead_abort - Encrypt - GCM - AES
[Check 3] Test psa_aead_abort - Decrypt - CCM - AES
[Check 4] Test psa_aead_abort - Decrypt - GCM - AES
[Check 5] Test psa_aead_abort with all initializations

TEST RESULT: PASSED

******************************************

TEST: 261 | DESCRIPTION: Testing crypto AEAD APIs | UT: psa_aead_verify
[Info] Executing tests from non-secure
[Check 1] Test psa_aead_verify - AES-CCM
[Check 2] Test psa_aead_verify - AES-CCM 24 bytes Tag length = 4
[Check 3] Test psa_aead_verify - Small buffer size
[Check 4] Test psa_aead_verify - Input length is less than plaintext length
[Check 5] Test psa_aead_verify - GCM - 16B AES - 12B Nounce & 12B addi data

TEST RESULT: PASSED

******************************************

************ Crypto Suite Report **********
TOTAL TESTS     : 61
TOTAL PASSED    : 61
TOTAL SIM ERROR : 0
TOTAL FAILED    : 0
TOTAL SKIPPED   : 0
******************************************

Entering standby.. 
