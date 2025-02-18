//Homework 4 Seaver Olson
#include <stdio.h>
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"
#include "fsl_device_registers.h"
#include "fsl_debug_console.h"



float DEMO_MeasureTemperature(void);

float DEMO_MeasureTemperature(void)
{
    uint16_t tempRawValue = 0U;

    if (0UL == ((SENSOR_CTRL->MISC_CTRL_REG & SENSOR_CTRL_MISC_CTRL_REG_TIMER_1_ENABLE_MASK) >>
                SENSOR_CTRL_MISC_CTRL_REG_TIMER_1_ENABLE_SHIFT))
    {
        SENSOR_CTRL->MISC_CTRL_REG |= SENSOR_CTRL_MISC_CTRL_REG_TIMER_1_ENABLE_MASK;
    }

    tempRawValue = (((SENSOR_CTRL->TSEN_CTRL_1_REG_2) & SENSOR_CTRL_TSEN_CTRL_1_REG_2_TSEN_TEMP_VALUE_MASK) >>
                    SENSOR_CTRL_TSEN_CTRL_1_REG_2_TSEN_TEMP_VALUE_SHIFT);

    return (tempRawValue * 0.480561F - 220.7074F);
}


int main(void)
{   
    FILE *fp;
    char buff[32];
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    fp = fopen("temperatureLog.txt", "w");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }
    //2 x 24 x 60 = 2880
    for (int i = 0; i < 2880; i++) {
        double temp = ((double)DEMO_MeasureTemperature());
        fprintf(fp, "%d: %.3f\n", i, temp);
        printf("%d: %.3f\n", i, temp);
        sleep(60);
    }
    fclose(fp);
    return 0;
}
