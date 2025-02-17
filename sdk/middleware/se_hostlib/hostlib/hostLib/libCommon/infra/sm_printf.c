/*
 *
 * Copyright 2016 NXP
 * SPDX-License-Identifier: Apache-2.0
 */

#include <stdio.h>
#include <stdarg.h>

#include "sm_printf.h"



#define MAX_SER_BUF_SIZE    (1024)

void sm_printf(uint8_t dev, const char * format, ...)
{
    uint8_t  buffer[MAX_SER_BUF_SIZE + 1];
    va_list   vArgs;
    AX_UNUSED_ARG(dev);
    //dev = dev; // avoids warning; dev can be used to determine output channel

    va_start(vArgs, format);
#if defined(_WIN32) && defined(_MSC_VER)
    if ((vsnprintf_s((char *)buffer, MAX_SER_BUF_SIZE, MAX_SER_BUF_SIZE, (char const *)format, vArgs)) < 0) {
        PRINTF("vsnprintf_s Error");
        return;
    }
#else
    if ((vsnprintf((char *)buffer, MAX_SER_BUF_SIZE, (char const *)format, vArgs)) < 0) {
        PRINTF("vsnprintf Error");
        return;
    }
#endif
    va_end(vArgs);

    PRINTF("%s", buffer);
}
