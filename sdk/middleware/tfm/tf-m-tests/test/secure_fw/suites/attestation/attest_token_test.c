/*
 * attest_token_test.c
 *
 * Copyright (c) 2018-2019, Laurence Lundblade.
 * Copyright (c) 2020-2022, Arm Limited.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * See BSD-3-Clause license in README.md
 */

#include "attest_token_test.h"
#include "q_useful_buf.h"
#include "psa/initial_attestation.h"
#include "attest_token_decode.h"
#include "attest_token_test_values.h"
#include "psa/tfm/crypto.h"              //NXP to avoid file name conflicts between MbedTLS and TFM.
#include "test_log.h"


/**
 * \file attest_token_test.c
 *
 * \brief Implementation for attestation token tests.
 *
 * This uses \c attest_token_decode for the main full
 * test case. That in turn uses t_cose_sign1_verify.
 * These implementations of token decoding and COSE
 * sig verification are still considered test
 * code even though they are getting close to
 * real implementations that could be used for
 * other than test.
 *
 * Most of the code here is for comparing the
 * values in the token to expected good
 * values.
 */

#ifdef DUMP_TOKEN
static void dump_token(struct q_useful_buf_c *token)
{
    int i;
    unsigned char num;

    TEST_LOG("\r\n");
    TEST_LOG("########### token(len: %d): ###########\r\n", token->len);
    for (i = 0; i < token->len; ++i) {
        num = ((unsigned char *)token->ptr)[i];
        TEST_LOG(" 0x%X%X", (num & 0xF0) >> 4, num & 0x0F);
        if (((i + 1) % 8) == 0) {
            TEST_LOG("\r\n");
        }
    }
    TEST_LOG("\r\n############## token end  ##############\r\n");
}
#endif

/**
 * \brief An alternate token_main() that packs the option flags into the nonce.
 *
 * \param[in] option_flags      Flag bits to pack into nonce.
 * \param[in] nonce             Pointer and length of the nonce.
 * \param[in] buffer            Pointer and length of buffer to
 *                              output the token into.
 * \param[out] completed_token  Place to put pointer and length
 *                              of completed token.
 *
 * \return various errors. See \ref psa_status_t.
 *
 */
int token_main_alt(uint32_t option_flags,
                   struct q_useful_buf_c nonce,
                   struct q_useful_buf buffer,
                   struct q_useful_buf_c *completed_token)
{
    psa_status_t                 return_value;
    size_t                       token_buf_size;
    size_t                       completed_token_size;
    struct q_useful_buf_c        actual_nonce;
    Q_USEFUL_BUF_MAKE_STACK_UB(  actual_nonce_storage, 64);

    if(nonce.len == 64 && (q_useful_buf_is_value(nonce, 0) == SIZE_MAX)) {
        /* Go into special option-packed nonce mode */
        actual_nonce = q_useful_buf_copy(actual_nonce_storage, nonce);
        /* Use memcpy as it always works and avoids type punning */
        memcpy((uint8_t *)actual_nonce_storage.ptr,
               &option_flags,
               sizeof(uint32_t));
    } else {
        actual_nonce = nonce;
    }

    token_buf_size = buffer.len;
    return_value = psa_initial_attest_get_token(actual_nonce.ptr,
                                                actual_nonce.len,
                                                buffer.ptr,
                                                token_buf_size,
                                                &completed_token_size);
    *completed_token =
        (struct q_useful_buf_c){buffer.ptr, completed_token_size};
    if (return_value != PSA_SUCCESS) {
        return (int)return_value;
    }

#ifdef DUMP_TOKEN
    dump_token(completed_token);
#endif

    return 0;
}

#ifdef INCLUDE_TEST_CODE
static const uint8_t expected_minimal_token_bytes[] = {MINIMAL_TOKEN};
/*
 * Public function. See token_test.h
 */
int_fast16_t minimal_test()
{
    int_fast16_t return_value = 0;
    Q_USEFUL_BUF_MAKE_STACK_UB(token_storage,
                               sizeof(expected_minimal_token_bytes));
    struct q_useful_buf_c completed_token;
    struct q_useful_buf_c expected_token;

    return_value =
        token_main_alt(TOKEN_OPT_SHORT_CIRCUIT_SIGN |
                           TOKEN_OPT_OMIT_CLAIMS,
                       TOKEN_TEST_VALUE_NONCE,
                       token_storage,
                       &completed_token);
    if(return_value) {
        goto Done;
    }

    expected_token =
        Q_USEFUL_BUF_FROM_BYTE_ARRAY_LITERAL(expected_minimal_token_bytes);

    if(q_useful_buf_compare(completed_token, expected_token)) {
       return_value = -3;
    }

Done:
    return return_value;
}


/*
 * Public function. See token_test.h
 */
int_fast16_t minimal_get_size_test()
{
    int_fast16_t          return_value = 0;
    size_t                length;
    struct q_useful_buf_c expected_token;
    struct q_useful_buf_c nonce;

    nonce = TOKEN_TEST_VALUE_NONCE;
    expected_token =
        Q_USEFUL_BUF_FROM_BYTE_ARRAY_LITERAL(expected_minimal_token_bytes);


    return_value = psa_initial_attest_get_token_size(nonce.len,
                                                     &length);

    /*
     * It is not possible to predict the size of the token returned
     * here because options like TOKEN_OPT_OMIT_CLAIMS and
     * TOKEN_OPT_SHORT_CIRCUIT_SIGN cannot be passed to limit what it
     * does. Instead check to see if the size is in a reasonable
     * range. The minimal_test() will actually check the size for
     * exactitude because it can pass those options,
     */
    if(length < expected_token.len || length > 10000) {
        return_value = -1;
    }

    return return_value;
}


/*
 * Public function. See token_test.h
 */
int_fast16_t buffer_too_small_test()
{
    int_fast16_t return_value = 0;
    /*
     * Construct a buffer with enough capacity in case buffer size check fails
     * and the token is generated. If a smaller buffer is allocated, the
     * incorrectly generated token may overwrite and corrupt the data following
     * this buffer.
     */
    Q_USEFUL_BUF_MAKE_STACK_UB(token_storage,
                               sizeof(expected_minimal_token_bytes));
    struct q_useful_buf_c completed_token;
    struct q_useful_buf_c nonce;


    nonce = TOKEN_TEST_VALUE_NONCE;
    /* Fake the size and cheat the token generation process. */
    token_storage.len = sizeof(expected_minimal_token_bytes) - 1;

    return_value = token_main_alt(TOKEN_OPT_SHORT_CIRCUIT_SIGN |
                                      TOKEN_OPT_OMIT_CLAIMS,
                                  nonce,
                                  token_storage,
                                  &completed_token);

    if(return_value != PSA_ERROR_BUFFER_TOO_SMALL) {
        return_value = -1;
    } else {
        return_value = 0;
    }

    return return_value;
}
#endif /* INCLUDE_TEST_CODE */


/**
 * \brief Check the simple IAT claims against compiled-in known values
 *
 * \param[in] simple_claims Pointer to claims structure to check
 *
 * \return 0 means success. Any other value indicates failure. Since
 *           this is just test code there is no formal definition or
 *           documentation of the detailed values on the assumption
 *           that source code for the test is available.
 *
 * The compiled values come from token_test_values.h. They can be
 * #defined as \c NULL, \c NULL_Q_USEFUL_BUF_C or \c MAX_INT32 to disabled
 * checking for the presence and value of the claim.
 *
 * See \ref attest_token_iat_simple_t for the claims that are checked. All
 * claims in that structure are checked.
 */
static int_fast16_t check_simple_claims(
                    const struct attest_token_iat_simple_t *simple_claims)
{
    int_fast16_t return_value;
    /* Use temp variables to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    struct q_useful_buf_c tail;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- check value of the nonce claim -- */
    if(!IS_ITEM_FLAG_SET(NONCE_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_NONCE) {
            /* It should have been present */
            return_value = -50;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_NONCE;
        if(!q_useful_buf_c_is_null(tmp)) {
            /* request to check for the nonce */
            if(q_useful_buf_compare(simple_claims->nonce, tmp)) {
                /* Didn't match in the standard way. See if it is a
                 * special option-packed nonce by checking for length
                 * 64 and all bytes except the first four are 0.
                 * nonce_tail is everything after the first 4 bytes.
                 */
                tail = q_useful_buf_tail(simple_claims->nonce, 4);
                if(simple_claims->nonce.len == 64 &&
                   q_useful_buf_is_value(tail, 0) == SIZE_MAX){
                    /* It is an option-packed nonce.
                     * Don't compare the first four bytes.
                     */
                    if(q_useful_buf_compare(q_useful_buf_tail(tmp, 4), tail)) {
                        /* The option-packed nonce didn't match */
                        return_value = -51;
                        goto Done;
                    }
                } else {
                    /* Just a normal nonce that didn't match */
                    return_value = -51;
                    goto Done;
                }
            }
        }
    }

    /* -- check value of the instance ID claim -- */
    if(!IS_ITEM_FLAG_SET(INSTANCE_ID_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_INSTANCE_ID) {
            /* It should have been present */
            return_value = -52;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_INSTANCE_ID;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(simple_claims->instance_id, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -53;
            goto Done;
        }
    }

    /* -- check value of the boot seed claim -- */
    if(!IS_ITEM_FLAG_SET(BOOT_SEED_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_BOOT_SEED) {
            /* It should have been present */
            return_value = -54;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_BOOT_SEED;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(simple_claims->boot_seed, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -55;
            goto Done;
        }
    }

    /* -- check value of the cert_ref claim -- */
    if(!IS_ITEM_FLAG_SET(CERT_REF_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_CERT_REF) {
            /* It should have been present */
            return_value = -56;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_CERT_REF;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_CERT_REF);
            if(q_useful_buf_compare(simple_claims->cert_ref, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -57;
                goto Done;
            }
        }
    }

    /* -- check value of the implementation ID -- */
    if(!IS_ITEM_FLAG_SET(IMPLEMENTATION_ID_FLAG,simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_IMPLEMENTATION_ID) {
            return_value = -58;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_IMPLEMENTATION_ID;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(simple_claims->implementation_id, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -59;
            goto Done;
        }
    }

    /* -- check value of the security lifecycle claim -- */
    if(!IS_ITEM_FLAG_SET(SECURITY_LIFECYCLE_FLAG,simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SECURITY_LIFECYCLE) {
            /* It should have been present */
            return_value = -60;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        if(TOKEN_TEST_VALUE_SECURITY_LIFECYCLE != INT32_MAX &&
           simple_claims->security_lifecycle !=
           TOKEN_TEST_VALUE_SECURITY_LIFECYCLE) {
            /* Check of its value was requested and failed */
            return_value = -61;
            goto Done;
        }
    }

    /* -- check value of the client_id claim -- */
    if(!IS_ITEM_FLAG_SET(CLIENT_ID_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_CLIENT_ID) {
            return_value = -62;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        if(TOKEN_TEST_VALUE_CLIENT_ID != INT32_MAX &&
           simple_claims->client_id != TOKEN_TEST_VALUE_CLIENT_ID) {
#if DOMAIN_NS == 1U
            /* Non-secure caller client ID has to be negative */
            if(simple_claims->client_id > -1) {
#else
            /* Secure caller client ID has to be positive */
            if(simple_claims->client_id < 1) {
#endif
                return_value = -63;
                goto Done;
            }
        }
    }

    /* -- check value of the profile_definition claim -- */
    if(!IS_ITEM_FLAG_SET(PROFILE_DEFINITION_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_PROFILE_DEFINITION) {
            /* It should have been present */
            return_value = -64;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_PROFILE_DEFINITION;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                                        TOKEN_TEST_VALUE_PROFILE_DEFINITION);
            if(q_useful_buf_compare(simple_claims->profile_definition, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -65;
                goto Done;
            }
        }
    }

    /* -- check value of the verification_service claim -- */
    if(!IS_ITEM_FLAG_SET(VERIFICATION_SERVICE_FLAG, simple_claims->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_VERIFICATION_SERVICE) {
            /* It should have been present */
            return_value = -66;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_VERIFICATION_SERVICE;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_VERIFICATION_SERVICE);
            if(q_useful_buf_compare(simple_claims->verif_serv, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -67;
                goto Done;
            }
        }
    }

Done:
    return return_value;
}


/**
 * \brief Check a SW component claims against compiled-in known values.
 *
 * \param[in] sw_component Pointer to SW component claims structure to check.
 *
 * \return 0 means success. Any other value indicates failure. Since
 *         this is just test code there is no formal definition or
 *         documentation of the detailed values on the assumption
 *         that source code for the test is available.
 *
 * The compiled values come from token_test_values.h. They can be
 * #defined as \c NULL, \c NULL_Q_USEFUL_BUF_C or \c MAX_INT32 to
 * disabled checking for the presence and value of the claim.
 *
 * See \ref attest_token_sw_component_t for the claims that are checked. All
 * claims in that structure are checked.
 *
 * This checks for the "first" SW component. See check_sw_component_2().
 */
static int_fast16_t check_sw_component_1(
                    const struct attest_token_sw_component_t *sw_component)
{
    int_fast16_t return_value;
    /* Use a temp variable to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- Check first type -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASUREMENT_TYPE_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_TYPE) {
            /* It should have been present */
            return_value = -100;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_TYPE;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                                    TOKEN_TEST_VALUE_SWC1_MEASUREMENT_TYPE);
            if(q_useful_buf_compare(sw_component->measurement_type, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -101;
                goto Done;
            }
        }
    }

    /* -- Check first measurement -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASURMENT_VAL_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_VAL) {
            /* It should have been present */
            return_value = -102;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_VAL;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(sw_component->measurement_val, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -103;
            goto Done;
        }
    }

    /* -- Check first version -- */
    if(!IS_ITEM_FLAG_SET(SW_VERSION_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC1_VERSION) {
            /* It should have been present */
            return_value = -106;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_VERSION;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_SWC1_VERSION);
            if(q_useful_buf_compare(sw_component->version, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -107;
                goto Done;
            }
        }
    }

    /* -- Check first signer ID -- */
    if(!IS_ITEM_FLAG_SET(SW_SIGNER_ID_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC1_SIGNER_ID) {
            /* It should have been present */
            return_value = -108;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC1_SIGNER_ID;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(sw_component->signer_id, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -109;
            goto Done;
        }
    }

    /* -- Check first measurement description -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASUREMENT_DESC_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_DESC) {
            /* It should have been present */
            return_value = -110;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_DESC;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                                    TOKEN_TEST_VALUE_SWC1_MEASUREMENT_DESC);
            if(q_useful_buf_compare(sw_component->measurement_desc, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -111;
                goto Done;
            }
        }
    }

 Done:
    return return_value;
}


/**
 * \brief Check a SW component claims against compiled-in known values.
 *
 * \param[in] sw_component Pointer to SW component claims structure to check.
 *
 * \return 0 means success. Any other value indicates failure. Since
 *         this is just test code there is no formal definition or
 *         documentation of the detailed values on the assumption
 *         that source code for the test is available.
 *
 * The compiled values come from token_test_values.h. They can be
 * #defined as \c NULL, \c NULL_Q_USEFUL_BUF_C or \c MAX_INT32 to disabled
 * checking for the presence and value of the claim.
 *
 * See \ref attest_token_sw_component_t for the claims that are checked. All
 * claims in that structure are checked.
 *
 * This checks for the "second" SW component. See check_sw_component_1().
 */
static int_fast16_t check_sw_component_2(
                    const struct attest_token_sw_component_t *sw_component)
{
    int_fast16_t return_value;

    /* Use a temp variable to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- Check second type -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASUREMENT_TYPE_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_TYPE) {
            /* It should have been present */
            return_value = -100;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_TYPE;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                                    TOKEN_TEST_VALUE_SWC2_MEASUREMENT_TYPE);
            if(q_useful_buf_compare(sw_component->measurement_type, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -101;
                goto Done;
            }
        }
    }

    /* -- Check second measurement -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASURMENT_VAL_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_VAL) {
            /* It should have been present */
            return_value = -102;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_VAL;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(sw_component->measurement_val, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -103;
            goto Done;
        }
    }

    /* -- Check second version -- */
    if(!IS_ITEM_FLAG_SET(SW_VERSION_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC2_VERSION) {
            /* It should have been present */
            return_value = -106;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_VERSION;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_SWC2_VERSION);
            if(q_useful_buf_compare(sw_component->version, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -107;
                goto Done;
            }
        }
    }

    /* -- Check second signer ID -- */
    if(!IS_ITEM_FLAG_SET(SW_SIGNER_ID_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC2_SIGNER_ID) {
            /* It should have been present */
            return_value = -108;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC2_SIGNER_ID;
        if(!q_useful_buf_c_is_null(tmp) &&
           q_useful_buf_compare(sw_component->signer_id, tmp)) {
            /* Check of its value was requested and failed */
            return_value = -109;
            goto Done;
        }
    }

    /* -- Check second measurement description -- */
    if(!IS_ITEM_FLAG_SET(SW_MEASUREMENT_DESC_FLAG, sw_component->item_flags)) {
        /* Claim is not present in token */
        if(TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_DESC) {
            /* It should have been present */
            return_value = -110;
            goto Done;
        }
    } else {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_DESC;
        if(tmp_string != NULL) {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                                    TOKEN_TEST_VALUE_SWC2_MEASUREMENT_DESC);
            if(q_useful_buf_compare(sw_component->measurement_desc, tmp)) {
                /* Check of its value was requested and failed */
                return_value = -111;
                goto Done;
            }
        }
    }

Done:
    return return_value;
}

/**
 * Modes for decode_test_internal()
 */
enum decode_test_mode_t {
    /** See documentation for decode_test_short_circuit_sig() */
    SHORT_CIRCUIT_SIGN,
    /** See documentation for decode_test_normal_sig() */
    NORMAL_SIGN,
    /** See documentation for decode_test_symmetric_initial_attest() */
    COSE_MAC0,
    /** See documentation for decode_test_symmetric_iat_short_circuit_tag() */
    COSE_MAC0_SHORT_CIRCUIT_TAG
};

/**
 * \brief Run the main decode test
 *
 * \param[in] mode Selects test modes
 *
 * \return 0 for success, test failure code otherwise.
 *
 * See decode_test_normal_sig() and decode_test_short_circuit_sig().
 */
static int_fast16_t decode_test_internal(enum decode_test_mode_t mode)
{
    int_fast16_t                        return_value;
    Q_USEFUL_BUF_MAKE_STACK_UB(         token_storage, ATTEST_TOKEN_MAX_SIZE);
    struct q_useful_buf_c               completed_token;
    struct attest_token_decode_context  token_decode;
    struct attest_token_iat_simple_t    simple_claims;
    struct attest_token_sw_component_t  sw_component;
    uint32_t                            num_sw_components;
    int32_t                             num_sw_components_signed;
    struct q_useful_buf_c               tmp;
    uint32_t                            token_encode_options;
    uint32_t                            token_decode_options;

    switch(mode) {
        case SHORT_CIRCUIT_SIGN:
            token_encode_options = TOKEN_OPT_SHORT_CIRCUIT_SIGN;
            token_decode_options = TOKEN_OPT_SHORT_CIRCUIT_SIGN;
            break;

        case NORMAL_SIGN:
            token_encode_options = 0;
            token_decode_options = 0;
            break;

        case COSE_MAC0:
            token_encode_options = 0;
            token_decode_options = 0;
            break;

        case COSE_MAC0_SHORT_CIRCUIT_TAG:
            token_encode_options = TOKEN_OPT_SHORT_CIRCUIT_SIGN;
            token_decode_options = TOKEN_OPT_SHORT_CIRCUIT_SIGN;
            break;

        default:
            return_value = -1000;
            goto Done;
    }

    /* -- Make a token with all the claims -- */
    tmp = TOKEN_TEST_VALUE_NONCE;
    return_value = token_main_alt(token_encode_options,
                                  tmp,
                                  token_storage,
                                  &completed_token);
    if(return_value) {
        goto Done;
    }

    /* -- Initialize and validate the signature on the token -- */
    attest_token_decode_init(&token_decode, token_decode_options);
    return_value = attest_token_decode_validate_token(&token_decode,
                                                      completed_token);
    if(return_value != ATTEST_TOKEN_ERR_SUCCESS) {
        goto Done;
    }

    /* -- Get the all simple claims at once and check them -- */
    return_value = attest_token_decode_get_iat_simple(&token_decode,
                                                      &simple_claims);
    if(return_value != ATTEST_TOKEN_ERR_SUCCESS) {
        goto Done;
    }


    return_value = check_simple_claims(&simple_claims);
    if(return_value != ATTEST_TOKEN_ERR_SUCCESS) {
        goto Done;
    }

    /* -- SW components -- */
    if(TOKEN_TEST_REQUIRED_NUM_SWC != INT32_MAX) {
        /* -- Configured to check for SW components, so do that -- */

        /* -- Get num SW components -- */
        return_value = attest_token_get_num_sw_components(&token_decode,
                                                          &num_sw_components);
        if(return_value) {
            goto Done;
        }
        /* This conversion to signed avoids a compiler warning
         * when TOKEN_TEST_REQUIRED_NUM_SWC is defined as 0 */
        num_sw_components_signed = (int32_t)num_sw_components;
        if(num_sw_components_signed < TOKEN_TEST_REQUIRED_NUM_SWC) {
            return_value = -5;
            goto Done;
        }

        if(num_sw_components >= 1) {
            /* -- Get the first SW component and check it -- */
            return_value = attest_token_get_sw_component(&token_decode,
                                                         0,
                                                         &sw_component);
            if(return_value) {
                goto Done;
            }

            return_value = check_sw_component_1(&sw_component);
            if(return_value) {
                goto Done;
            }

            if(num_sw_components >= 2) {
                /* -- Get the second SW component and check it -- */
                return_value = attest_token_get_sw_component(&token_decode,
                                                             1,
                                                             &sw_component);
                if(return_value) {
                    goto Done;
                }

                return_value = check_sw_component_2(&sw_component);
                if(return_value) {
                    goto Done;
                }
            }
        }
    }
    return_value = 0;

Done:
    return return_value;
}

#ifdef SYMMETRIC_INITIAL_ATTESTATION
int_fast16_t decode_test_symmetric_initial_attest(void)
{
    return decode_test_internal(COSE_MAC0);
}

int_fast16_t decode_test_symmetric_iat_short_circuit_tag(void)
{
    return decode_test_internal(COSE_MAC0_SHORT_CIRCUIT_TAG);
}
#else /* SYMMETRIC_INITIAL_ATTESTATION */
/*
 * Public function. See token_test.h
 */
int_fast16_t decode_test_short_circuit_sig(void)
{
    return decode_test_internal(SHORT_CIRCUIT_SIGN);
}


/*
 * Public function. See token_test.h
 */
int_fast16_t decode_test_normal_sig(void)
{
    return decode_test_internal(NORMAL_SIGN);
}
#endif /* SYMMETRIC_INITIAL_ATTESTATION */
