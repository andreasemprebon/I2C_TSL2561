/*
 * TSL2561.h
 *
 *  Created on: Jan 20, 2017
 *      Author: Andrea Semprebon
 */

#ifndef TSL2561_H_
#define TSL2561_H_

#include "mbed.h"

#ifdef TARGET_DISCO_L476VG

class TSL2561 {
    public:
		enum Timing {
			TSL2561_INT_TIMING_13_MS,
			TSL2561_INT_TIMING_101_MS,
			TSL2561_INT_TIMING_402_MS
		};
        TSL2561();
        virtual ~TSL2561();

        /*
         * Initilization
         */
        bool init();
        bool init_with_address(char _addr);

        /**
         * Turn on the sensor
         */
        bool powerUp();
        bool powerOff();

        bool getID(char ID[]);
        bool getTiming(char timing[]);

        bool setTiming(Timing time);

        bool readData0(char data0[]);
        bool readData1(char data1[]);

        /*
         * Write I2C
         */
        bool writeCommand(unsigned char address, unsigned char value);


        /**
         * Read I2C
         */
        bool readByte(unsigned char address, char data_read[], int length);

        /*
         * Vars
         */

        // I2C sensor main address
        unsigned int _i2c_addr;
    private:
        bool isSensorReady();
};

/**
 * PIN I2C
 */
#define PIN_SDA PB_7
#define PIN_SCL PB_6

/**
 * Sensor address
 */
#define TSL2561_ADDR    0x39

/**
 * Registers
 */
#define TSL2561_REG_CMD    			0x80
#define TSL2561_REG_CONTROL 		0x00
#define TSL2561_REG_TIMING      	0x01
#define TSL2561_REG_ID      		0x0A
#define	TSL2561_REG_DATA_0_LOW  	0x0C
#define	TSL2561_REG_DATA_0_HIGH  	0x0D
#define	TSL2561_REG_DATA_1_LOW  	0x0E
#define	TSL2561_REG_DATA_1_HIGH  	0x0F

/**
 * Commands
 */
#define TSL2561_CMD_START_UP    0x03
#define TSL2561_CMD_SHUTDOWN    0x00
#define TSL2561_CMD_TIMING_0    0x00
#define TSL2561_CMD_TIMING_1    0x01
#define TSL2561_CMD_TIMING_2    0x10

#else
#error "This class must be used with DISCO_L476VG board only."
#endif // TARGET_DISCO_L476VG

#endif /* TSL2561_H_ */
