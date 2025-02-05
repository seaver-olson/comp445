# Add set(CONFIG_USE_middleware_tfm_profile_medium_s_configs true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

      target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
          ${CMAKE_CURRENT_LIST_DIR}/lib/ext/mbedcrypto/mbedcrypto_config
          ${CMAKE_CURRENT_LIST_DIR}/platform/ext/target/nxp/common
          ${CMAKE_CURRENT_LIST_DIR}/config/profile
        )

    if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

      target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
                  -DTFM_LVL=2
                        -DPROJECT_CONFIG_HEADER_FILE="config_profile_medium.h"
                        -DMBEDTLS_CONFIG_FILE="tfm_mbedcrypto_config_profile_medium.h"
                        -DMBEDTLS_PSA_CRYPTO_CONFIG_FILE="crypto_config_profile_medium.h"
                        -DPS_CRYPTO_AEAD_ALG=PSA_ALG_CCM
              )
  
  
  endif()

