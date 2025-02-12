/*
 * Copyright 2022-2024 NXP
 *
 * SPDX-License-Identifier: BSD-3-Clause
 * The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html
 */

#ifndef MBEDTLS_CONFIG_CLIENT_H
#define MBEDTLS_CONFIG_CLIENT_H

/* FreeRTOS is always supported for RW612 platform so enable threading */
#define MBEDTLS_MCUX_FREERTOS_THREADING_ALT
/* The following macros are predefined in /cmake/platform/rw612/rw612.cmake */
// #define MBEDTLS_THREADING_C
// #define MBEDTLS_THREADING_ALT

/* SDK mbetdls config include */
#include "els_pkc_mbedtls_config.h"

#ifdef CONFIG_WPA_SUPP_MBEDTLS
/* wpa_supplicant mbedtls extend config */
/* Undef defines that would be re-defined in the wpa_supplicant mbedtls config file */
#undef MBEDTLS_THREADING_C
#undef MBEDTLS_THREADING_ALT
#include "wpa_supp_els_pkc_mbedtls_config.h"
#endif

#if CONFIG_OT_CLI
/* Undef defines that would be re-defined in the Openthread mbedtls config file */
#undef MBEDTLS_PLATFORM_STD_CALLOC
#undef MBEDTLS_PLATFORM_STD_FREE
#undef MBEDTLS_SSL_MAX_CONTENT_LEN

/* els_pkc_mbedtls_config.h uses the same include guard than OT mbedtls-config.h
 * so we can undef the include guard as a workaround */
#undef MBEDTLS_CONFIG_H

/* OpenThread mbedtls config defines MBEDTLS_ECP_MAX_BITS to 256 so we need to disable
 * els_pkc features that require a higher value */
#undef MBEDTLS_ECP_DP_SECP384R1_ENABLED
#undef MBEDTLS_ECP_DP_SECP521R1_ENABLED
#undef MBEDTLS_ECP_DP_BP384R1_ENABLED
#undef MBEDTLS_ECP_DP_BP512R1_ENABLED

/* Openthread mbetdls config include */
#include "openthread-core-rw612-config.h"
#include "mbedtls-config.h"

/* Undef this flag to make sure to use hardware entropy */
#undef MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES

#endif /* CONFIG_OT_CLI */
#endif /* MBEDTLS_CONFIG_CLIENT_H */



