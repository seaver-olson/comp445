# Add set(CONFIG_USE_component_els_pkc_psa_driver_examples true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_DEVICE_ID STREQUAL RW610 OR CONFIG_DEVICE_ID STREQUAL RW612) AND CONFIG_USE_component_els_pkc_flow_protection AND CONFIG_USE_component_els_pkc_session AND CONFIG_USE_component_els_pkc_memory AND CONFIG_USE_component_els_pkc AND CONFIG_USE_component_els_pkc_psa_driver)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_aead_ccm_multipart_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_aead_ccm_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_aead_gcm_multipart_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_aead_gcm_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_aes_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_cipher_decrypt.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_cipher_multipart_CBC.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_cipher_multipart_CTR.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_cipher_multipart_ECB.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_eccsecp224k1_sign_verify_hash_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_ecdsa_keygen_oracleMemory_sign_verify_hash_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_ecdsa_keygen_oracleS50_sign_verify_hash_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_ecdsa_sign_verify_hash_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_ecdsa_sign_verify_message_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_keygen_export_public_key_brainpoolpr1_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_keygen_export_public_key_mont_curve25519_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_keygen_export_public_key_rsa_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_keygen_export_public_key_secpk1_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_keygen_export_public_key_secpr1_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_key_agreement_CURVE_25519_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_key_agreement_SECP_R1_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_mac_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_mac_sign_multipart_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_mac_verify_multipart_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_rsa_PKCS1V15_sign_verify_message_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_rsa_PSS_sign_verify_hash_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha224_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha256_abort_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha256_clone_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha256_multipart_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha256_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha384_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_sha512_oneshot_example.c
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxClPsaDriver/mcuxClPsaDriver_truncated_mac_oneshot_example.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/examples/mcuxCsslFlowProtection/inc
)

else()

message(SEND_ERROR "component_els_pkc_psa_driver_examples dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
