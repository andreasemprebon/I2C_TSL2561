/*
 * SerialFloat.h
 *
 *  Created on: Jan 25, 2017
 *      Author: IEUser
 */

#include "mbed.h"

 /**
  * Le printf con i float non sono supportate, quindi bisogna
  * converitre tutto a intero :(
  * https://github.com/ARMmbed/target-mbed-gcc/issues/17
  */


#ifndef PRINTFLOAT_H_
#define PRINTFLOAT_H_

class PrintFloat {
public:
	static void ftos(char *buf, float num);
};

#endif /* SERIALFLOAT_H_ */
