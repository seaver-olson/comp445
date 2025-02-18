//Homework 4 Seaver Olson
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
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();
    // 60 x 24
    for (int i = 0; i < 5760; i++) {
        double temp = ((double)DEMO_MeasureTemperature());
        PRINTF("%d: %.3f\n", i, temp);
        for (int j = 0; j < 30; j++){
		SDK_DelayAtLeastUs(1000000, CLOCK_GetCoreSysClkFreq());
	}
}
    return 0;
}
