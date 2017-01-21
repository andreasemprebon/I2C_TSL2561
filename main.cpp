#include "mbed.h"

/**
 * Sensori
 */
#include "TSL2561.h"

/**
 * Light Sensor TSL2561
 * Varibales
 */
TSL2561 *light_sensor;
char data0[2];
char data1[2];
bool flag_read_light_sensor = false;
int interrupt_count_light_sensor = 0;

/**
 * Ticker for interrupt
 */
Ticker ticker_interrupt;
int secondi_trascorsi = 0;

/**
 * Led output
 */
DigitalOut led_green(LED1);
DigitalOut led_red(LED2);
bool flag_flash_led = false;
int interrupt_count_led = 0;

/**
 * Serial output for debug purpose
 */
Serial pc(SERIAL_TX, SERIAL_RX);

/**
 * Light sensor initialization
 */
bool init_light_sensor() {
	int result = -1;
	char sensor_id[1];
	char timing_and_gain[1];

	light_sensor = new TSL2561();

	pc.printf("TSL2561 Initialization\n", sensor_id[0]);

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
	pc.printf("\n- ID: 0x%x\n", sensor_id[0]);

	//Imposto il tempo di integrazione ed il gain
	result = light_sensor->getTimingAndGain( timing_and_gain );
	if ( !result ) {
		pc.printf("Impossibile leggere il gain ed timing dell'integrazione\n");
		return false;
	}
	pc.printf("\t- Timing and Gain ATTUALE: 0x%x\n", timing_and_gain[0]);

	result = light_sensor->setTimingAndGain( TSL2561::TSL2561_INT_TIMING_402_MS, TSL2561::TSL2561_GAIN_HIGH );
	if ( !result ) {
		pc.printf("Impossibile impostare il timing ed il gain dell'integrazione\n");
		return false;
	}

	result = light_sensor->getTimingAndGain( timing_and_gain );
	if ( !result ) {
		pc.printf("Impossibile leggere il gain ed timing dell'integrazione\n");
		return false;
	}
	pc.printf("\t- Timing and Gain NUOVO: 0x%x\n", timing_and_gain[0]);

	return true;
}

/**
 * Interrupt every 1ms
 */
void interrupt() {
	interrupt_count_light_sensor++;
	interrupt_count_led++;

	//Una lettura ogni cira 65ms, ovvero a 15Hz
	if ( interrupt_count_light_sensor > 65 && !flag_read_light_sensor) {
		flag_read_light_sensor = true;
	}

	//Lampeggia una volta ogni secondo
	if ( interrupt_count_led > 1000) {
		flag_flash_led = true;
	}
}

/**
 * Life cycle
 */
void loop() {
	int count_errori = 0;
	pc.printf("Ciclo di vita avviato!\n");

	while (1) {
		// Lettura sensore di luminosta'
		if ( flag_read_light_sensor ) {
			flag_read_light_sensor = false;
			interrupt_count_light_sensor = 0;

			data0[0] = 0x12;
			data0[1] = 0x34;
			data1[0] = 0x56;
			data1[1] = 0x78;

			if( ! light_sensor->readData0( data0 ) ) {
				pc.printf("[%i] Errore lettura\n", secondi_trascorsi);
				count_errori++;
			}

			if( ! light_sensor->readData1( data1 ) ) {
				pc.printf("[%i] Errore lettura\n", secondi_trascorsi);
				count_errori++;
			}

			pc.printf("[%i] DATA0: 0x%x%x\n", secondi_trascorsi, data0[1], data0[0]);
			pc.printf("[%i] DATA1: 0x%x%x\n", secondi_trascorsi, data1[1], data1[0]);
			pc.printf("[%i] Error count: %i\n", secondi_trascorsi, count_errori);
		}

		if ( flag_flash_led ) {
			interrupt_count_led = 0;
			flag_flash_led = false;
			secondi_trascorsi++;
			led_green = !led_green;
		}

		wait(0.001);
	}
}

int main() {
    led_green   = 0;
    led_red     = 0;

    if ( !init_light_sensor() ) {
    	while(1) {
			led_red = !led_red;
			wait(1);
		}
    }

    pc.printf("Avvio ciclo di vita...\n");

    wait(1);
    ticker_interrupt.attach(&interrupt, 0.001);

    while (1) {
    	loop();
    }
}
