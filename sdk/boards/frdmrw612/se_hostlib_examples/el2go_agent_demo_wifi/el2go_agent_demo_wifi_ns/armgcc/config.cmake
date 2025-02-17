# config to select component, the format is CONFIG_USE_${component}
# Please refer to cmake files below to get available components:
#  ${SdkRootDirPath}/devices/RW612/all_lib_device.cmake

set(CONFIG_COMPILER gcc)
set(CONFIG_TOOLCHAIN armgcc)
set(CONFIG_USE_COMPONENT_CONFIGURATION false)
set(CONFIG_USE_component_osa_free_rtos true)
set(CONFIG_USE_component_serial_manager_uart true)
set(CONFIG_USE_component_silicon_id true)
set(CONFIG_USE_component_wireless_imu_adapter true)
set(CONFIG_USE_driver_conn_fwloader_ns true)
set(CONFIG_USE_middleware_edgefast_wifi_nxp true)
set(CONFIG_USE_middleware_freertos_coremqtt true)
set(CONFIG_USE_middleware_freertos_corejson true)
set(CONFIG_USE_middleware_iot_reference_logging true)
set(CONFIG_USE_middleware_lwip true)
set(CONFIG_USE_middleware_mbedtls3x_port_tfm true)
set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent true)
set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_lwip_wifi true)
set(CONFIG_USE_middleware_tfm_ns_frdmrw612 true)
set(CONFIG_USE_middleware_tfm_ns_os_wrapper_rtos true)
set(CONFIG_USE_middleware_wifi true)
set(CONFIG_USE_middleware_wifi_imu true)
set(CONFIG_USE_middleware_wifi_wifidriver true)
set(CONFIG_USE_driver_common true)
set(CONFIG_USE_driver_clock true)
set(CONFIG_USE_utility_debug_console true)
set(CONFIG_USE_utility_assert true)
set(CONFIG_USE_component_serial_manager true)
set(CONFIG_USE_middleware_freertos-kernel_heap_4 true)
set(CONFIG_USE_middleware_freertos-kernel_cm33_non_trustzone true)
set(CONFIG_USE_driver_flash_config_frdmrw612 true)
set(CONFIG_USE_device_RW612_CMSIS true)
set(CONFIG_USE_driver_reset true)
set(CONFIG_USE_driver_flexspi true)
set(CONFIG_USE_driver_cache_cache64 true)
set(CONFIG_USE_driver_cns_io_mux true)
set(CONFIG_USE_driver_lpc_gpio true)
set(CONFIG_USE_driver_power true)
set(CONFIG_USE_driver_ocotp true)
set(CONFIG_USE_component_els_pkc_platform_rw61x_standalone_clib_gdet_sensor true)
set(CONFIG_USE_utilities_misc_utilities true)
set(CONFIG_USE_middleware_freertos-kernel true)
set(CONFIG_USE_component_lists true)
set(CONFIG_USE_component_osa_interface true)
set(CONFIG_USE_middleware_freertos-kernel_template true)
set(CONFIG_USE_middleware_freertos-kernel_extension true)
set(CONFIG_USE_component_usart_adapter true)
set(CONFIG_USE_driver_flexcomm_usart true)
set(CONFIG_USE_driver_flexcomm true)
set(CONFIG_USE_component_silicon_id_rw610 true)
set(CONFIG_USE_driver_gdma true)
set(CONFIG_USE_driver_imu true)
set(CONFIG_USE_middleware_freertos_coremqtt_template true)
set(CONFIG_USE_middleware_lwip_template true)
set(CONFIG_USE_middleware_lwip_sys_arch_dynamic true)
set(CONFIG_USE_middleware_tfm_ns_interface true)
set(CONFIG_USE_middleware_mbedtls3x_port_config true)
set(CONFIG_USE_middleware_mbedtls3x_no_psa true)
set(CONFIG_USE_middleware_tfm_ns_loader_service true)
set(CONFIG_USE_middleware_mbedtls3x_template true)
set(CONFIG_USE_middleware_mbedtls3x_crypto_no_psa true)
set(CONFIG_USE_middleware_mbedtls3x_ssl_no_psa true)
set(CONFIG_USE_middleware_mbedtls3x_x509 true)
set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_psa true)
set(CONFIG_USE_middleware_se_hostlib_nxp_iot_agent_common true)
set(CONFIG_USE_middleware_tfm_ns_os_wrapper_common true)
set(CONFIG_USE_middleware_wifi_template true)
set(CONFIG_USE_component_wifi_bt_module_tx_pwr_limits true)
set(CONFIG_USE_middleware_wifi_common_files true)
set(CONFIG_USE_middleware_wifi_osa true)
set(CONFIG_USE_middleware_wifi_osa_free_rtos true)
set(CONFIG_USE_middleware_wifi_net true)
set(CONFIG_USE_middleware_wifi_net_free_rtos true)
set(CONFIG_USE_middleware_lwip_apps_lwiperf true)
set(CONFIG_USE_utility_str true)
set(CONFIG_USE_CMSIS_Include_core_cm true)
set(CONFIG_USE_component_els_pkc_els_header_only true)
set(CONFIG_USE_component_els_pkc_els_common true)
set(CONFIG_USE_component_els_pkc_memory true)
set(CONFIG_USE_component_els_pkc_standalone_gdet true)
set(CONFIG_USE_component_els_pkc_platform_rw61x_inf_header_only true)
set(CONFIG_USE_component_els_pkc_buffer true)
set(CONFIG_USE_component_els_pkc_core true)
set(CONFIG_USE_component_els_pkc_param_integrity true)
set(CONFIG_USE_component_els_pkc_flow_protection true)
set(CONFIG_USE_component_els_pkc_secure_counter true)
set(CONFIG_USE_component_els_pkc_pre_processor true)
set(CONFIG_USE_component_els_pkc_toolchain true)
set(CONFIG_USE_component_els_pkc_data_integrity true)
set(CONFIG_CORE cm33)
set(CONFIG_DEVICE RW612)
set(CONFIG_BOARD frdmrw612)
set(CONFIG_KIT frdmrw612)
set(CONFIG_DEVICE_ID RW612)
set(CONFIG_FPU SP_FPU)
set(CONFIG_DSP NO_DSP)
set(CONFIG_CORE_ID cm33)
set(CONFIG_TRUSTZONE NO_TZ)
