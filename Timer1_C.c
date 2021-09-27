/*
 * Lab2_Timer1.c
 *
 * Created: 22-09-2021 15:31:38
 * Author : Kishore
 */ 

#define F_CPU 1000000
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

void T1Delay ( );
int main ( )
{
	DDRB = 0xFF; //PORTB output port
	while (1)
	{
		PORTB ^= (1<<PB4); //toggle PB4
		T1Delay ( );
	}
}
void T1Delay ( )
{
	TCNT1H = 0xF0; //TEMP = 0x85
	TCNT1L = 0xB6;
	TCCR1A = 0x00; //Normal mode
	TCCR1B = 0x04; //Normal mode, 1:256 prescaler
	while ((TIFR&(0x1<<TOV1))==0); //wait for TF0 to roll over
	TCCR1B = 0;
	TIFR = 0x1<<TOV1; //clear TOV1
}


