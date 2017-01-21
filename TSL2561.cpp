/*
 * TSL2561.cpp
 *
 *  Created on: Jan 20, 2017
 *      Author: Andrea Semprebon
 */

#include "TSL2561.h"

/**
 * DEBUG
 */
//Serial pc_debug(SERIAL_TX, SERIAL_RX);

/**
 * I2C connection
 */
I2C *i2c;

TSL2561::TSL2561() {
}

bool TSL2561::init() {
    return init_with_address( TSL2561_ADDR );
}

bool TSL2561::init_with_address(char _addr) {
    //1 bit left shit of the address.
    //mbed uses 8 bit address, while our sensor
    //has a 7 bit address
    _i2c_addr = _addr << 1;

    //Init I2C on pin PIN_SDA and PIN_SCL at 400kHz
    i2c = new I2C(PIN_SDA, PIN_SCL);
    i2c->frequency(400000);

    return true;
}

/*
 * Avvio il sensore, inviando il comando 0x03
 * sul registro di controllo
 */
bool TSL2561::powerUp() {
    return ( writeCommand(TSL2561_REG_CONTROL, TSL2561_CMD_START_UP) );
}

/**
 * Get sensor ID
 */
bool TSL2561::getID(char ID[]) {
    bool status = readByte(TSL2561_REG_ID, ID, 1);
    return status;
}

/**
 * Power off the sensor
 */
bool TSL2561::powerOff() {
    return ( writeCommand(TSL2561_REG_CONTROL, TSL2561_CMD_SHUTDOWN) );
}

/**
 * Timing and Gain
 */
bool TSL2561::getTimingAndGain(char timing_gain[]) {
	return ( readByte(TSL2561_REG_TIMING, timing_gain, 1) );
}

bool TSL2561::setTimingAndGain(Timing time, Gain gain) {
	char new_timing;
	char new_gain;
	char new_time_and_gain;

	// Select the new timing
	switch (time) {
		case TSL2561_INT_TIMING_13_MS:
			new_timing = TSL2561_CMD_TIMING_0;
			break;
		case TSL2561_INT_TIMING_101_MS:
			new_timing = TSL2561_CMD_TIMING_1;
			break;
		case TSL2561_INT_TIMING_402_MS:
			new_timing = TSL2561_CMD_TIMING_2;
			break;
		default:
			return false;
	}

	// Select the new gain
	switch (gain) {
		case TSL2561_GAIN_LOW:
			new_gain = TSL2561_CMD_LOW_GAIN;
			break;
		case TSL2561_GAIN_HIGH:
			new_gain = TSL2561_CMD_HIGH_GAIN;
			break;
		default:
			return false;
	}

	//Gain is set with the last of the first 4 byte
	//Timing is in the last 2 bytes.
	new_time_and_gain = (new_gain & 0xF0) | (new_timing & 0x0F);

	return ( writeCommand(TSL2561_REG_TIMING, new_time_and_gain) );
}

bool TSL2561::readData0(char data0[]) {
	bool status = readByte(TSL2561_REG_DATA_0_LOW, data0, 2);
	return status;
}

bool TSL2561::readData1(char data1[]) {
	bool status = readByte(TSL2561_REG_DATA_1_LOW, data1, 2);
	return status;
}

bool TSL2561::readByte(unsigned char address, char data_read[], int length) {
    char prepare_to_read[1];

    prepare_to_read[0] = (address & 0x0F) | TSL2561_REG_CMD;
    int status = i2c->write(_i2c_addr, prepare_to_read, 1, true);

    if ( status != 0 ) {
//    pc_debug.printf("Scrittura prima di lettura: %i\n", status);
    	return false;
    }

    int read_status = i2c->read(_i2c_addr, data_read, length, false);

//    pc_debug.printf("read_status = %i\n", read_status);

    return (read_status == 0);
}

bool TSL2561::writeCommand(unsigned char address, unsigned char value) {
    char data_write[2];

    /*
     * Prepare the data:
     * Command register: 1000**** the last 4 bit are for Register Address
     *  TSL2561_CMD gives the command register first 4 bit
     *  (address & 0x0F) gives me the Register Address
     */
    data_write[0]   = (address & 0x0F) | TSL2561_REG_CMD;
    data_write[1]   = (value & 0xFF);

    int length      = 2;
    bool repeated   = false;
    int status = i2c->write(_i2c_addr, data_write, length, repeated);

//    pc_debug.printf("\n\nInvio dato:\n");
//    pc_debug.printf("_addr = 0x%x\n", _i2c_addr);
//    pc_debug.printf("data_write[0] = 0x%x\n", data_write[0]);
//    pc_debug.printf("data_write[1] = 0x%x\n", data_write[1]);
//    pc_debug.printf("status = %i\n", status);

    return (status == 0);
}

TSL2561::~TSL2561() {
}
