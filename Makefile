# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

# cross-platform directory manipulation
ifeq ($(shell echo $$OS),$$OS)
    MAKEDIR = if not exist "$(1)" mkdir "$(1)"
    RM = rmdir /S /Q "$(1)"
else
    MAKEDIR = $(SHELL) -c "mkdir -p \"$(1)\""
    RM = $(SHELL) -c "rm -rf \"$(1)\""
endif

ifeq (,$(filter .build,$(notdir $(CURDIR))))
.SUFFIXES:
OBJDIR := .build
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKETARGET = $(MAKE) --no-print-directory -C $(OBJDIR) -f $(mkfile_path) \
		SRCDIR=$(CURDIR) $(MAKECMDGOALS)
.PHONY: $(OBJDIR) clean
all:
	+@$(call MAKEDIR,$(OBJDIR))
	+@$(MAKETARGET)
$(OBJDIR): all
Makefile : ;
% :: $(OBJDIR) ; :
clean :
	$(call RM,$(OBJDIR))

else

VPATH = .. 

GCC_BIN = 
PROJECT = I2C_TSL2561
OBJECTS = PrintFloat.o TSL2561.o main.o 
SYS_OBJECTS = mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_flash_ramfunc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/PeripheralPins.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/analogin_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/analogout_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/can_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/cmsis_nvic.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/gpio_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/gpio_irq_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/hal_tick_16b.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/hal_tick_32b.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/i2c_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/lp_ticker.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/mbed_board.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/mbed_overrides.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/pinmap.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/port_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/pwmout_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/retarget.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/rtc_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/serial_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/sleep.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/spi_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/startup_stm32l476xx.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_adc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_adc_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_can.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_comp.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_cortex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_crc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_crc_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_cryp.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_cryp_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_dac.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_dac_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_dfsdm.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_dma.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_firewall.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_flash.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_flash_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_msp_template.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_gpio.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_hcd.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_i2c.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_i2c_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_irda.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_iwdg.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_lcd.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_lptim.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_smartcard.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_nand.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_nor.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_opamp.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_opamp_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_pcd.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_pcd_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_pwr.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_pwr_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_qspi.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_rcc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_rcc_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_rng.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_rtc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_rtc_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_sai.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_sd.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_smartcard_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_smbus.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_spi.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_spi_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_sram.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_swpmi.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_tim.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_tim_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_tsc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_uart.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_uart_ex.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_usart.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_hal_wwdg.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_adc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_comp.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_crc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_crs.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_dac.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_dma.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_exti.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_fmc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_gpio.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_i2c.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_lptim.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_lpuart.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_opamp.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_pwr.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_rcc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_rng.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_rtc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_sdmmc.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_spi.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_swpmi.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_tim.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_usart.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_usb.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm32l4xx_ll_utils.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/stm_spi_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/system_stm32l4xx.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/trng_api.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/us_ticker_16b.o mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/us_ticker_32b.o 
INCLUDE_PATHS = -I../. -I../mbed/. -I../mbed/TARGET_DISCO_L476VG -I../mbed/TARGET_DISCO_L476VG/TARGET_STM -I../mbed/TARGET_DISCO_L476VG/TARGET_STM/TARGET_STM32L4 -I../mbed/TARGET_DISCO_L476VG/TARGET_STM/TARGET_STM32L4/TARGET_DISCO_L476VG -I../mbed/TARGET_DISCO_L476VG/TARGET_STM/TARGET_STM32L4/TARGET_DISCO_L476VG/device -I../mbed/TARGET_DISCO_L476VG/TARGET_STM/TARGET_STM32L4/device -I../mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM -I../mbed/drivers -I../mbed/hal -I../mbed/platform 
LIBRARY_PATHS = -L../mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM 
LIBRARIES = -lmbed 
LINKER_SCRIPT = ../mbed/TARGET_DISCO_L476VG/TOOLCHAIN_GCC_ARM/STM32L476XX.ld

############################################################################### 
AS      = $(GCC_BIN)arm-none-eabi-as
CC      = $(GCC_BIN)arm-none-eabi-gcc
CPP     = $(GCC_BIN)arm-none-eabi-g++
LD      = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY = $(GCC_BIN)arm-none-eabi-objcopy
OBJDUMP = $(GCC_BIN)arm-none-eabi-objdump
SIZE    = $(GCC_BIN)arm-none-eabi-size 

ifeq ($(HARDFP),1)
	FLOAT_ABI = hard
else
	FLOAT_ABI = softfp
endif


CPU = -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=$(FLOAT_ABI) 
CC_FLAGS = -c -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections -fdata-sections -funsigned-char -MMD -fno-delete-null-pointer-checks -fomit-frame-pointer -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Os -std=gnu99 -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_RTC=1 -DTOOLCHAIN_object -D__CMSIS_RTOS -DTOOLCHAIN_GCC -DDEVICE_STDIO_MESSAGES=1 -DDEVICE_CAN=1 -DTARGET_CORTEX_M -DTARGET_LIKE_CORTEX_M4 -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED -DTARGET_STM32L4 -DDEVICE_SERIAL=1 -DTARGET_STM32L476VG -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M4 -DTARGET_DISCO_L476VG -D__FPU_PRESENT=1 -DDEVICE_PORTIN=1 -DTARGET_RELEASE -DTARGET_STM -DDEVICE_SERIAL_FC=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DMBED_BUILD_TIMESTAMP=1484929120.81 -DDEVICE_SPI=1 -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DARM_MATH_CM4 -include mbed_config.h -MMD -MP
CPPC_FLAGS = -c -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections -fdata-sections -funsigned-char -MMD -fno-delete-null-pointer-checks -fomit-frame-pointer -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Os -std=gnu++98 -fno-rtti -Wvla -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_RTC=1 -DTOOLCHAIN_object -D__CMSIS_RTOS -DTOOLCHAIN_GCC -DDEVICE_STDIO_MESSAGES=1 -DDEVICE_CAN=1 -DTARGET_CORTEX_M -DTARGET_LIKE_CORTEX_M4 -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED -DTARGET_STM32L4 -DDEVICE_SERIAL=1 -DTARGET_STM32L476VG -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M4 -DTARGET_DISCO_L476VG -D__FPU_PRESENT=1 -DDEVICE_PORTIN=1 -DTARGET_RELEASE -DTARGET_STM -DDEVICE_SERIAL_FC=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DMBED_BUILD_TIMESTAMP=1484929120.81 -DDEVICE_SPI=1 -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DARM_MATH_CM4 -include mbed_config.h -MMD -MP
ASM_FLAGS = -x assembler-with-cpp -D__CMSIS_RTOS -D__FPU_PRESENT=1 -DARM_MATH_CM4 -D__CORTEX_M4 -D__MBED_CMSIS_RTOS_CM -c -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections -fdata-sections -funsigned-char -MMD -fno-delete-null-pointer-checks -fomit-frame-pointer -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Os
CC_SYMBOLS = -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_RTC=1 -DTOOLCHAIN_object -D__CMSIS_RTOS -DTOOLCHAIN_GCC -DDEVICE_STDIO_MESSAGES=1 -DDEVICE_CAN=1 -DTARGET_CORTEX_M -DTARGET_LIKE_CORTEX_M4 -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED -DTARGET_STM32L4 -DDEVICE_SERIAL=1 -DTARGET_STM32L476VG -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M4 -DTARGET_DISCO_L476VG -D__FPU_PRESENT=1 -DDEVICE_PORTIN=1 -DTARGET_RELEASE -DTARGET_STM -DDEVICE_SERIAL_FC=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DMBED_BUILD_TIMESTAMP=1484929120.81 -DDEVICE_SPI=1 -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DARM_MATH_CM4 

LD_FLAGS =-Wl,--gc-sections -Wl,--wrap,main -Wl,--wrap,_malloc_r -Wl,--wrap,_free_r -Wl,--wrap,_realloc_r -Wl,--wrap,_calloc_r -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp 
LD_SYS_LIBS = -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys


ifeq ($(DEBUG), 1)
  CC_FLAGS += -DDEBUG -O0
else
  CC_FLAGS += -DNDEBUG -Os
endif


.PHONY: all lst size

all: $(PROJECT).bin $(PROJECT).hex size



.asm.o:
	+@$(call MAKEDIR,$(dir $@))
	$(CC) $(CPU) -c $(ASM_FLAGS) $(CC_SYMBOLS) $(INCLUDE_PATHS) -o $@ $<
.s.o:
	+@$(call MAKEDIR,$(dir $@))
	$(CC) $(CPU) -c $(ASM_FLAGS) $(CC_SYMBOLS) $(INCLUDE_PATHS) -o $@ $<
.S.o:
	+@$(call MAKEDIR,$(dir $@))
	$(CC) $(CPU) -c $(ASM_FLAGS) $(CC_SYMBOLS) $(INCLUDE_PATHS) -o $@ $<

.c.o:
	+@$(call MAKEDIR,$(dir $@))
	$(CC)  $(CC_FLAGS) $(CC_SYMBOLS) $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	+@$(call MAKEDIR,$(dir $@))
	$(CPP) $(CPPC_FLAGS) $(CC_SYMBOLS) $(INCLUDE_PATHS) -o $@ $<



$(PROJECT).elf: $(OBJECTS) $(SYS_OBJECTS) $(LINKER_SCRIPT)
	$(LD) $(LD_FLAGS) -T$(filter %.ld, $^) $(LIBRARY_PATHS) -o $@ $(filter %.o, $^) -Wl,--start-group $(LIBRARIES) $(LD_SYS_LIBS) -Wl,--end-group


$(PROJECT).bin: $(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

$(PROJECT).hex: $(PROJECT).elf
	@$(OBJCOPY) -O ihex $< $@

$(PROJECT).lst: $(PROJECT).elf
	@$(OBJDUMP) -Sdh $< > $@

lst: $(PROJECT).lst

size: $(PROJECT).elf
	$(SIZE) $(PROJECT).elf

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)


endif
