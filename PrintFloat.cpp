/*
 * SerialFloat.cpp
 *
 *  Created on: Jan 25, 2017
 *      Author: IEUser
 */

#include "PrintFloat.h"

int _d1 	 = 0;
float _f2 = 0.0;
int _d2 	 = 0;

void PrintFloat::ftos(char *buf, float num) {
	_d1 = num;
	_f2 = num - _d1;
	_d2 = trunc(_f2 * 100000);

	sprintf((char *)buf, "%d.%05d", _d1, _d2);
}

