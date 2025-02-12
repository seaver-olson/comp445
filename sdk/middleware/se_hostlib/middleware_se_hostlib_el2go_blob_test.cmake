# Add set(CONFIG_USE_middleware_se_hostlib_el2go_blob_test true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

if((CONFIG_USE_middleware_se_hostlib_el2go_blob_test_reader_inline AND CONFIG_USE_middleware_se_hostlib_el2go_blob_test_psa AND (CONFIG_BOARD STREQUAL rdrw612bga OR CONFIG_BOARD STREQUAL frdmrw612 OR CONFIG_BOARD STREQUAL mcxn5xxevk OR CONFIG_BOARD STREQUAL mcxn9xxevk)))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/tst/el2go_blob_test/src/el2go_blob_test_suite_generic.c
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/tst/el2go_blob_test/src/el2go_blob_test.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/nxp_iot_agent/tst/el2go_blob_test/inc
)

else()

message(SEND_ERROR "middleware_se_hostlib_el2go_blob_test dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()
