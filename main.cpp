#include "mbed.h"

/**
 * Sensori
 */
#include "TSL2561.h"

TSL2561 *light_sensor;

char data0[2];
char data1[2];

DigitalOut led_green(LED1);
DigitalOut led_red(LED2);

Serial pc(SERIAL_TX, SERIAL_RX);

bool init_light_sensor() {
	int result = -1;
	char sensor_id[1];

	light_sensor = new TSL2561();

	//Inizializzo il sensore
	if ( !light_sensor->init() ) {
		pc.printf("Impossibile inizializzare il sensore\n");
		return false;
	}

	//Lo accendo
	result = light_sensor->powerUp();

	if ( !result ) {
		pc.printf("Impossibile accendere il sensore\n");
		return false;
	}

	//Leggo l'ID
	result = light_sensor->getID(sensor_id);
	if ( !result ) {
		pc.printf("Impossibile leggere l'ID del sensore\n");
		return false;
	}
	pc.printf("TSL2561 ID: 0x%x\n", sensor_id[0]);

	return true;
}

int main() {
	int count_errori = 0;
	char timing[1];
    led_green   = 0;
    led_red     = 0;

    if ( !init_light_sensor() ) {
    	while(1) {
			led_red = !led_red;
			wait(1);
		}
    }

    wait(1);

    light_sensor->getTiming( timing );
	pc.printf("Timing attuale: 0x%x\n", timing[0]);

    if ( !light_sensor->setTiming( TSL2561::TSL2561_INT_TIMING_402_MS ) ) {
    	pc.printf("Impossibile impostare il timing dell'integrazione\n");
    	while(1) {
			led_red = !led_red;
			wait(1);
		}
    }
    wait(1);

    while (1) {
		wait(1);
		led_green = !led_green;

		data0[0] = 0x12;
		data0[1] = 0x34;
		data1[0] = 0x56;
		data1[1] = 0x78;

		if( ! light_sensor->readData0( data0 ) ) {
			pc.printf("Errore lettura");
			count_errori++;
		}

		pc.printf("DATA0LOW: 0x%x\n", data0[0]);
		pc.printf("DATA0HIGH: 0x%x\n", data0[1]);

		if( ! light_sensor->readData1( data1 ) ) {
			pc.printf("Errore lettura");
			count_errori++;
		}

		pc.printf("DATA1LOW: 0x%x\n", data1[0]);
		pc.printf("DATA1HIGH: 0x%x\n", data1[1]);
		pc.printf("Conteggio Errori: %i\n", count_errori);
    }

    while(1) {
		led_green = !led_green;
		wait(1);
	}

}
