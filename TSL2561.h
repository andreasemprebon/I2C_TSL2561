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

		enum Gain {
			TSL2561_GAIN_LOW,
			TSL2561_GAIN_HIGH
		};

        TSL2561();
        virtual ~TSL2561();

        /*
         * Initialization
         * @return true if OK, false otherwise
         */
        bool init();
        bool init_with_address(char _addr);

        /**
         * Turn on the sensor
         * @return true if OK, false otherwise
         */
        bool powerUp();

        /**
         * Turn off the sensor
         * @return true if OK, false otherwise
         */
        bool powerOff();

        /**
         * Save into the var ID the sensor ID
         * @parmas char ID[]: pointer to 1 byte array of char
         * @return true if OK, false otherwise
         */
        bool getID(char ID[]);

        /**
         * Save into timing the current timing and gain
         * configuration of the sensor
         * @params char timing_gain[]: pointer to 1 byte array of char
         * @return true if OK, false otherwise
         */
        bool getTimingAndGain(char timing_gain[]);

        /**
         * Set the integration timing (only timing, NOT gain)
         * @params Timing time: elem of Timing struct
         * @return true if OK, false otherwise
         */
        bool setTimingAndGain(Timing time, Gain gain);

        /**
         * Read data from register DATA0 (visible light) and DATA1 (IR light).
         * @params  char data0[]:	2 byte char array for visible light, first byte
         * 							is the LOW value, second byte is the HIGH value
         * 			char data1[]: 	2 byte char array for IR light, first byte is
         * 							the LOW value, second byte is the HIGH value
         * @return true if OK, false otherwise
         */
        bool readData0(char data0[]);
        bool readData1(char data1[]);

        bool getLux(char data0[], char data1[], Gain gain, Timing timing, double &lux);

        /*
         * Write I2C
         * In general this function should NOT be used, unless you are sure
         * of what you are doing
         */
        bool writeCommand(unsigned char address, unsigned char value);


        /**
         * Read I2C
         * In general this function should NOT be used, unless you are sure
         * of what you are doing
         */
        bool readByte(unsigned char address, char data_read[], int length);

        /*
         * Vars
         */

        // I2C sensor main address
        unsigned int _i2c_addr;
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
#define TSL2561_CMD_HIGH_GAIN	0x10
#define TSL2561_CMD_LOW_GAIN	0x00

#else
#error "This class must be used with DISCO_L476VG board only."
#endif // TARGET_DISCO_L476VG

#endif /* TSL2561_H_ */
