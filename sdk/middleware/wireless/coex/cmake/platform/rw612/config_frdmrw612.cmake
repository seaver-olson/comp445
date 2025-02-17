# Copyright 2022-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

# config to select component, the format is CONFIG_USE_${component}
# Please refer to cmake files below to get available components:
#  ${SdkRootDirPath}/devices/RW612/all_lib_device.cmake


if(${COEX_NXP_BASE} STREQUAL "edgefast")
    set(CONFIG_COMPILER gcc)
    set(CONFIG_TOOLCHAIN armgcc)
    set(CONFIG_USE_COMPONENT_CONFIGURATION false)
    set(CONFIG_USE_middleware_edgefast_bluetooth_ble_ethermind_cm33nodsp true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_shell_ble true)
    set(CONFIG_USE_component_osa true)
    set(CONFIG_USE_driver_clock true)
    set(CONFIG_USE_middleware_freertos-kernel_heap_4 true)
    set(CONFIG_USE_middleware_freertos-kernel true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_common_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_config_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_extension_common_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_pal_db_gen_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting_work_queue true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting_toolchain true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting_net true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting_list true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_porting_atomic true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_profile_bas true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_profile_hrs true)
    set(CONFIG_USE_driver_common true)
    set(CONFIG_USE_device_RW612_CMSIS true)
    set(CONFIG_USE_utility_debug_console true)
    set(CONFIG_USE_utility_assert true)
    set(CONFIG_USE_component_usart_adapter true)
    set(CONFIG_USE_driver_power true)
    set(CONFIG_USE_driver_flash_config_frdmrw612 true)
    set(CONFIG_USE_driver_flexspi true)
    set(CONFIG_USE_driver_cache_cache64 true)
    set(CONFIG_USE_component_serial_manager_uart true)
    set(CONFIG_USE_component_serial_manager true)
    set(CONFIG_USE_driver_flexcomm_usart true)
    set(CONFIG_USE_component_lists true)
    set(CONFIG_USE_device_RW612_startup true)
    set(CONFIG_USE_driver_flexcomm true)
    set(CONFIG_USE_driver_lpc_gpio true)
    set(CONFIG_USE_driver_reset true)
    set(CONFIG_USE_component_mflash_frdmrw612 true)
    set(CONFIG_USE_component_mflash_file true)
    set(CONFIG_USE_middleware_freertos-kernel_cm33_non_trustzone true)
    set(CONFIG_USE_driver_flexcomm_i2c true)
    set(CONFIG_USE_driver_trng true)
    set(CONFIG_USE_driver_cns_io_mux true)
    set(CONFIG_USE_middleware_littlefs true)
    set(CONFIG_USE_component_osa_free_rtos true)
    set(CONFIG_USE_component_wireless_imu_adapter true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_common_ethermind_hci_platform true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_common_ethermind_hci true)
    set(CONFIG_USE_driver_conn_fwloader true)
    set(CONFIG_USE_middleware_usb_host_ehci true)
    set(CONFIG_USE_middleware_usb_host_stack true)
    set(CONFIG_USE_middleware_fatfs_usb true)
    set(CONFIG_USE_middleware_fatfs true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_pal_platform_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_pal_host_msd_fatfs_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_rw610_controller true)
    set(CONFIG_USE_middleware_wireless_framework_platform_ble_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_common_rw61x true)
    set(CONFIG_USE_middleware_mbedtls true)
    set(CONFIG_USE_middleware_mbedtls_port_els_pkc true)
    set(CONFIG_USE_component_mem_manager true)
    set(CONFIG_USE_component_messaging true)
    set(CONFIG_USE_component_software_rng_adapter true)
    set(CONFIG_USE_component_ostimer_time_stamp_adapter true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x true)
    set(CONFIG_USE_driver_ocotp true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_standalone_clib_gdet_sensor true)
    set(CONFIG_USE_utilities_misc_utilities true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_pal true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_template true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_ble_ethermind_lib_cm33nodsp true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_pal_crypto_ethermind true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_config_template true)
    set(CONFIG_USE_middleware_edgefast_bluetooth_mcux_linker_template_frdmrw612 true)
    set(CONFIG_USE_component_common_task true)
    set(CONFIG_USE_middleware_freertos-kernel_template true)
    set(CONFIG_USE_middleware_freertos-kernel_extension true)
    set(CONFIG_USE_middleware_lwip_sys_arch_dynamic true)
    set(CONFIG_USE_component_log true)
    # set(CONFIG_USE_component_log_backend_debugconsole true)
    set(CONFIG_USE_utility_str true)
    set(CONFIG_USE_CMSIS_Include_core_cm true)
    set(CONFIG_USE_device_RW612_system true)
    set(CONFIG_USE_component_mflash_common true)
    set(CONFIG_USE_component_osa_interface true)
    set(CONFIG_USE_driver_gdma true)
    set(CONFIG_USE_driver_imu true)
    set(CONFIG_USE_driver_memory true)
    set(CONFIG_USE_middleware_usb_host_ehci_config_header true)
    set(CONFIG_USE_middleware_usb_host_common_header true)
    # set(CONFIG_USE_middleware_usb_phy true)
    set(CONFIG_USE_middleware_usb_common_header true)
    set(CONFIG_USE_middleware_fatfs_template_usb true)
    set(CONFIG_USE_middleware_usb_host_msd true)
    set(CONFIG_USE_middleware_wireless_framework_platform_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_coex_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_fwk_debug true)
    set(CONFIG_USE_component_timer_manager true)
    set(CONFIG_USE_component_mrt_adapter true)
    set(CONFIG_USE_middleware_wireless_framework_swo_dbg true)
    set(CONFIG_USE_driver_mrt true)
    set(CONFIG_USE_middleware_mbedtls_port_els true)
    set(CONFIG_USE_component_els_pkc true)
    set(CONFIG_USE_middleware_mbedtls_els_pkc_config true)
    set(CONFIG_USE_component_els_pkc_els true)
    set(CONFIG_USE_component_els_pkc_els_header_only true)
    set(CONFIG_USE_component_els_pkc_els_common true)
    set(CONFIG_USE_component_els_pkc_standalone_keyManagement true)
    set(CONFIG_USE_component_els_pkc_hash true)
    set(CONFIG_USE_component_els_pkc_core true)
    set(CONFIG_USE_component_els_pkc_session true)
    set(CONFIG_USE_component_els_pkc_key true)
    set(CONFIG_USE_component_els_pkc_mac_modes true)
    set(CONFIG_USE_component_els_pkc_aead_modes true)
    set(CONFIG_USE_component_els_pkc_data_integrity true)
    set(CONFIG_USE_component_els_pkc_cipher_modes true)
    set(CONFIG_USE_component_els_pkc_memory true)
    set(CONFIG_USE_component_els_pkc_param_integrity true)
    set(CONFIG_USE_component_els_pkc_flow_protection true)
    set(CONFIG_USE_component_els_pkc_secure_counter true)
    set(CONFIG_USE_component_els_pkc_pre_processor true)
    set(CONFIG_USE_component_els_pkc_toolchain true)
    set(CONFIG_USE_component_els_pkc_hashmodes true)
    set(CONFIG_USE_component_els_pkc_buffer true)
    set(CONFIG_USE_component_els_pkc_random true)
    set(CONFIG_USE_component_els_pkc_random_modes true)
    set(CONFIG_USE_component_els_pkc_prng true)
    set(CONFIG_USE_component_els_pkc_aes true)
    set(CONFIG_USE_component_els_pkc_trng true)
    set(CONFIG_USE_component_els_pkc_ecc true)
    set(CONFIG_USE_component_els_pkc_math true)
    set(CONFIG_USE_component_els_pkc_rsa true)
    set(CONFIG_USE_component_els_pkc_pkc true)
    set(CONFIG_USE_component_els_pkc_mac true)
    set(CONFIG_USE_component_els_pkc_padding true)
    set(CONFIG_USE_component_els_pkc_hmac true)
    set(CONFIG_USE_component_els_pkc_aead true)
    set(CONFIG_USE_component_els_pkc_cipher true)
    set(CONFIG_USE_component_els_pkc_doc_rw61x true)
    set(CONFIG_USE_component_els_pkc_static_lib_rw61x true)
    set(CONFIG_USE_component_mem_manager_light true)
    set(CONFIG_USE_driver_ostimer true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_interface_files true)
    set(CONFIG_USE_component_els_pkc_trng_type_rng4 true)
    set(CONFIG_USE_component_els_pkc_standalone_gdet true)
    set(CONFIG_USE_component_els_pkc_random_modes_ctr true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_inf_header_only true)
    set(CONFIG_CORE cm33)
    set(CONFIG_DEVICE RW612)
    set(CONFIG_BOARD frdmrw612)
    set(CONFIG_KIT frdmrw612)
    set(CONFIG_DEVICE_ID RW612)
    set(CONFIG_FPU SP_FPU)
    set(CONFIG_DSP NO_DSP)
    set(CONFIG_CORE_ID cm33)

    set(CONFIG_USE_middleware_wifi_imu true)
    set(CONFIG_USE_middleware_wifi_wifidriver true)
    set(CONFIG_USE_component_wireless_imu_adapter true)
    set(CONFIG_USE_driver_flexcomm_usart_freertos true)
    set(CONFIG_USE_driver_conn_fwloader true)
    set(CONFIG_USE_driver_lpc_rtc true)
    set(CONFIG_USE_component_power_manager_rdrw610 true)
    set(CONFIG_USE_middleware_freertos-kernel true)
    set(CONFIG_USE_middleware_freertos-kernel_heap_4 true)
    set(CONFIG_USE_middleware_wifi_osa_free_rtos true)
    set(CONFIG_USE_middleware_wifi true)
    set(CONFIG_USE_middleware_lwip true)
    set(CONFIG_USE_middleware_lwip_apps_lwiperf true)
    # set(CONFIG_USE_middleware_lwip_contrib_ping true)
    set(CONFIG_USE_middleware_wifi_cli true)
    set(CONFIG_USE_middleware_wifi_wls true)
    set(CONFIG_USE_middleware_freertos-kernel_cm33_non_trustzone true)
    set(CONFIG_USE_device_RW612_CMSIS true)
    set(CONFIG_USE_driver_flexspi true)
    set(CONFIG_USE_driver_cache_cache64 true)
    set(CONFIG_USE_driver_cns_io_mux true)
    set(CONFIG_USE_driver_lpc_gpio true)
    set(CONFIG_USE_driver_power true)
    set(CONFIG_USE_driver_clock true)
    set(CONFIG_USE_middleware_wifi_common_files true)
    set(CONFIG_USE_driver_imu true)
    set(CONFIG_USE_middleware_wifi_osa true)
    set(CONFIG_USE_driver_common true)
    set(CONFIG_USE_middleware_wifi_template true)
    set(CONFIG_USE_middleware_wifi_net true)
    set(CONFIG_USE_component_wifi_bt_module_tx_pwr_limits true)
    set(CONFIG_USE_middleware_wifi_net_free_rtos true)
    set(CONFIG_USE_component_lists true)
    set(CONFIG_USE_driver_flexcomm true)
    set(CONFIG_USE_driver_flexcomm_usart true)
    set(CONFIG_USE_component_power_manager_core true)
    set(CONFIG_USE_component_serial_manager true)
    set(CONFIG_USE_utility_str true)
    set(CONFIG_USE_component_serial_manager_uart true)
    set(CONFIG_USE_component_usart_adapter true)
    set(CONFIG_USE_middleware_freertos-kernel_template true)
    set(CONFIG_USE_middleware_freertos-kernel_extension true)
    set(CONFIG_USE_middleware_lwip_template true)
    set(CONFIG_USE_CMSIS_Include_core_cm true)
    set(CONFIG_USE_device_RW612_system true)
    if(COEX_ENABLE_WIFI AND COEX_APP_SUPP)
        set(CONFIG_USE_middleware_wireless_wpa_supplicant_rtos true)
    endif()

    if(COEX_ENABLE_OT)
        # framework
        set(CONFIG_USE_middleware_wireless_framework_lfs_config_rw61x true)
        set(CONFIG_USE_middleware_wireless_framework_Common true)
        set(CONFIG_USE_middleware_wireless_framework_function_lib true)
        set(CONFIG_USE_middleware_wireless_framework_platform_rw61x true)
        set(CONFIG_USE_middleware_wireless_framework_platform_coex_rw61x true)
        set(CONFIG_USE_middleware_wireless_framework_platform_lowpower_rw61x true)
        set(CONFIG_USE_middleware_wireless_framework_LPM_systicks_RW610 true)
        set(CONFIG_USE_middleware_wireless_framework_LPM_cli_RW610 true)
        set(CONFIG_USE_middleware_wireless_framework_fwk_debug true)
        set(CONFIG_USE_middleware_wireless_framework_board_lp_frdmrw612 true)
        set(CONFIG_USE_middleware_wireless_framework_fsabstraction_littlefs true)
        set(CONFIG_USE_middleware_wireless_framework_platform_lowpower_timer_rw61x true)
        set(CONFIG_USE_middleware_wireless_framework_fsabstraction true)
        set(CONFIG_USE_middleware_wireless_framework_LPM_RW610 true)
    endif()
elseif(${COEX_NXP_BASE} STREQUAL "bt_ble")
    set(CONFIG_COMPILER gcc)
    set(CONFIG_TOOLCHAIN armgcc)
    set(CONFIG_USE_COMPONENT_CONFIGURATION false)
    set(CONFIG_USE_component_osa true)
    set(CONFIG_USE_driver_clock true)
    set(CONFIG_USE_middleware_freertos-kernel_heap_4 true)
    set(CONFIG_USE_middleware_freertos-kernel true)
    set(CONFIG_USE_driver_reset true)
    set(CONFIG_USE_driver_common true)
    set(CONFIG_USE_driver_power true)
    set(CONFIG_USE_driver_flexspi true)
    set(CONFIG_USE_driver_cache_cache64 true)
    set(CONFIG_USE_driver_flexcomm_usart true)
    set(CONFIG_USE_driver_flexcomm true)
    set(CONFIG_USE_driver_flash_config_frdmrw612 true)
    set(CONFIG_USE_driver_lpc_gpio true)
    set(CONFIG_USE_driver_trng true)
    set(CONFIG_USE_driver_lpc_rtc true)
    set(CONFIG_USE_driver_conn_fwloader true)
    set(CONFIG_USE_driver_cns_io_mux true)
    set(CONFIG_USE_driver_phy-device-ksz8081 true)
    set(CONFIG_USE_driver_ocotp true)
    set(CONFIG_USE_driver_enet true)
    set(CONFIG_USE_driver_flexcomm_usart_freertos true)
    set(CONFIG_USE_device_RW612_CMSIS true)
    set(CONFIG_USE_device_RW612_startup true)
    set(CONFIG_USE_utility_assert true)
    set(CONFIG_USE_utility_debug_console true)
    set(CONFIG_USE_component_usart_adapter true)
    set(CONFIG_USE_component_serial_manager true)
    set(CONFIG_USE_component_serial_manager_uart true)
    set(CONFIG_USE_component_lists true)
    set(CONFIG_USE_component_osa_free_rtos true)
    set(CONFIG_USE_component_mflash_frdmrw612 true)
    set(CONFIG_USE_component_mflash_file true)
    set(CONFIG_USE_component_power_manager_rdrw610 true)
    set(CONFIG_USE_component_log true)
    set(CONFIG_USE_component_log_backend_debugconsole true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x true)
    set(CONFIG_USE_component_els_pkc_doc_rw61x true)
    set(CONFIG_USE_component_els_pkc_mac_modes true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_interface_files true)
    set(CONFIG_USE_component_common_task true)
    set(CONFIG_USE_component_wireless_imu_adapter true)
    set(CONFIG_USE_component_trng_adapter true)
    set(CONFIG_USE_component_mem_manager_light true)
    set(CONFIG_USE_middleware_freertos-kernel_cm33_non_trustzone true)
    set(CONFIG_USE_middleware_wireless_framework_lfs_config_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_Common true)
    set(CONFIG_USE_middleware_wireless_framework_function_lib true)
    set(CONFIG_USE_middleware_wireless_framework_platform_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_ble_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_coex_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_common_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_platform_lowpower_rw61x true)
    set(CONFIG_USE_middleware_wireless_framework_LPM_systicks_RW610 true)
    set(CONFIG_USE_middleware_wireless_framework_LPM_cli_RW610 true)
    set(CONFIG_USE_middleware_wireless_framework_fwk_debug true)
    set(CONFIG_USE_middleware_wireless_framework_board_lp_frdmrw612 true)
    set(CONFIG_USE_middleware_wireless_framework_sbtsnoop true)
    set(CONFIG_USE_middleware_wireless_framework_sbtsnoop_ethermind_port true)
    set(CONFIG_USE_middleware_wireless_framework_fsabstraction_littlefs true)
    set(CONFIG_USE_middleware_wireless_framework_platform_lowpower_timer_rw61x true)
    set(CONFIG_USE_middleware_mbedtls true)
    set(CONFIG_USE_middleware_mbedtls_port_els_pkc true)
    set(CONFIG_USE_middleware_mbedtls_els_pkc_config true)
    set(CONFIG_USE_middleware_littlefs true)
    set(CONFIG_USE_middleware_fatfs_usb true)
    set(CONFIG_USE_middleware_fatfs true)
    set(CONFIG_USE_middleware_usb_host_ehci true)
    set(CONFIG_USE_middleware_usb_host_stack true)
    # set(CONFIG_USE_middleware_usb_phy true)
    set(CONFIG_USE_middleware_lwip_kinetis_ethernetif true)
    set(CONFIG_USE_middleware_lwip true)
    set(CONFIG_USE_middleware_lwip_apps_lwiperf true)
    set(CONFIG_USE_middleware_lwip_contrib_ping true)
    set(CONFIG_USE_middleware_wifi true)
    set(CONFIG_USE_middleware_wifi_cli true)
    set(CONFIG_USE_middleware_wifi_wifidriver true)
    set(CONFIG_USE_middleware_wifi_imu true)
    set(CONFIG_USE_component_wifi_bt_module_tx_pwr_limits true)
    set(CONFIG_USE_component_ostimer_time_stamp_adapter true)
    set(CONFIG_USE_middleware_wireless_framework_fsabstraction true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_standalone_clib_gdet_sensor true)
    set(CONFIG_USE_utilities_misc_utilities true)
    set(CONFIG_USE_middleware_freertos-kernel_template true)
    set(CONFIG_USE_middleware_freertos-kernel_extension true)
    set(CONFIG_USE_middleware_lwip_sys_arch_dynamic true)
    set(CONFIG_USE_driver_phy-common true)
    set(CONFIG_USE_driver_memory true)
    set(CONFIG_USE_CMSIS_Include_core_cm true)
    set(CONFIG_USE_device_RW612_system true)
    set(CONFIG_USE_utility_str true)
    set(CONFIG_USE_component_osa_interface true)
    set(CONFIG_USE_component_mflash_common true)
    set(CONFIG_USE_component_power_manager_core true)
    set(CONFIG_USE_component_els_pkc true)
    set(CONFIG_USE_component_els_pkc_trng_type_rng4 true)
    set(CONFIG_USE_component_els_pkc_standalone_gdet true)
    set(CONFIG_USE_component_els_pkc_random_modes_ctr true)
    set(CONFIG_USE_component_els_pkc_els true)
    set(CONFIG_USE_component_els_pkc_pkc true)
    set(CONFIG_USE_component_els_pkc_trng true)
    set(CONFIG_USE_component_els_pkc_static_lib_rw61x true)
    set(CONFIG_USE_component_els_pkc_els_header_only true)
    set(CONFIG_USE_component_els_pkc_els_common true)
    set(CONFIG_USE_component_els_pkc_standalone_keyManagement true)
    set(CONFIG_USE_component_els_pkc_hash true)
    set(CONFIG_USE_component_els_pkc_core true)
    set(CONFIG_USE_component_els_pkc_session true)
    set(CONFIG_USE_component_els_pkc_key true)
    set(CONFIG_USE_component_els_pkc_aead_modes true)
    set(CONFIG_USE_component_els_pkc_data_integrity true)
    set(CONFIG_USE_component_els_pkc_cipher_modes true)
    set(CONFIG_USE_component_els_pkc_memory true)
    set(CONFIG_USE_component_els_pkc_param_integrity true)
    set(CONFIG_USE_component_els_pkc_flow_protection true)
    set(CONFIG_USE_component_els_pkc_secure_counter true)
    set(CONFIG_USE_component_els_pkc_pre_processor true)
    set(CONFIG_USE_component_els_pkc_toolchain true)
    set(CONFIG_USE_component_els_pkc_hashmodes true)
    set(CONFIG_USE_component_els_pkc_buffer true)
    set(CONFIG_USE_component_els_pkc_random true)
    set(CONFIG_USE_component_els_pkc_random_modes true)
    set(CONFIG_USE_component_els_pkc_prng true)
    set(CONFIG_USE_component_els_pkc_aes true)
    set(CONFIG_USE_component_els_pkc_ecc true)
    set(CONFIG_USE_component_els_pkc_math true)
    set(CONFIG_USE_component_els_pkc_rsa true)
    set(CONFIG_USE_component_els_pkc_aead true)
    set(CONFIG_USE_component_els_pkc_cipher true)
    set(CONFIG_USE_component_els_pkc_mac true)
    set(CONFIG_USE_component_els_pkc_padding true)
    set(CONFIG_USE_component_els_pkc_hmac true)
    set(CONFIG_USE_driver_gdma true)
    set(CONFIG_USE_driver_imu true)
    set(CONFIG_USE_component_timer_manager true)
    set(CONFIG_USE_component_mrt_adapter true)
    set(CONFIG_USE_driver_mrt true)
    set(CONFIG_USE_middleware_wireless_framework_LPM_RW610 true)
    set(CONFIG_USE_middleware_wireless_framework_swo_dbg true)
    set(CONFIG_USE_middleware_mbedtls_port_els true)
    set(CONFIG_USE_middleware_fatfs_template_usb true)
    set(CONFIG_USE_middleware_usb_host_msd true)
    set(CONFIG_USE_middleware_usb_host_common_header true)
    set(CONFIG_USE_middleware_usb_common_header true)
    set(CONFIG_USE_middleware_usb_host_ehci_config_header true)
    set(CONFIG_USE_middleware_lwip_template true)
    set(CONFIG_USE_component_lpc_gpio_adapter true)
    set(CONFIG_USE_driver_inputmux true)
    set(CONFIG_USE_driver_pint true)
    set(CONFIG_USE_driver_inputmux_connections true)
    set(CONFIG_USE_middleware_wifi_template true)
    set(CONFIG_USE_middleware_wifi_osa true)
    set(CONFIG_USE_middleware_wifi_net true)
    set(CONFIG_USE_middleware_wifi_common_files true)
    set(CONFIG_USE_middleware_wifi_osa_free_rtos true)
    set(CONFIG_USE_middleware_wifi_net_free_rtos true)
    set(CONFIG_USE_driver_ostimer true)
    set(CONFIG_USE_component_els_pkc_platform_rw61x_inf_header_only true)
    set(CONFIG_CORE cm33)
    set(CONFIG_DEVICE RW612)
    set(CONFIG_BOARD frdmrw612)
    set(CONFIG_KIT frdmrw612)
    set(CONFIG_DEVICE_ID RW612)
    set(CONFIG_FPU SP_FPU)
    set(CONFIG_DSP NO_DSP)
    set(CONFIG_CORE_ID cm33)
    if(COEX_ENABLE_WIFI AND COEX_APP_SUPP)
        set(CONFIG_USE_middleware_wireless_wpa_supplicant_rtos true)
    endif()
endif()
