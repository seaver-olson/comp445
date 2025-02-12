# Add set(CONFIG_USE_component_els_pkc_ecc_deterministic true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if(CONFIG_USE_component_els_pkc_ecc_deterministic)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClEcc/src/mcuxClEcc_DeterministicECDSA.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClEcc/src/mcuxClEcc_DeterministicECDSA_Internal_BlindedSecretKeyGen.c
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClEcc/src/mcuxClEcc_DeterministicECDSA_Internal_BlindedSecretKeyGen_FUP.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/.
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClEcc/inc
  ${CMAKE_CURRENT_LIST_DIR}/src/comps/mcuxClEcc/inc/internal
)

else()

message(SEND_ERROR "component_els_pkc_ecc_deterministic dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
