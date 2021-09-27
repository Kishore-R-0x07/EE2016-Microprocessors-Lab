;
; Lab2_INT1_ASM.asm
;
; Created: 20-09-2021 19:16:29
; Author : Kishore
;


.org 0x0000
rjmp reset

.org 0x0002
rjmp int1_ISR

.org 0x0100

reset:
	  ;Loading stack pointer address
      LDI R16,0x70
	  OUT SPL,R16
	  LDI R16,0x00
	  OUT SPH,R16

	  ;Interface port B pin0 to be output
	  ;so to view LED blinking
	  LDI R16,0x01
	  OUT DDRB,R16

	  LDI R16,0x00
	  OUT DDRD,R16

	  ;Set MCUCR register to enable low level interrupt
	  LDI R16,0x00
	  OUT MCUCR,R16

	  ;Set GICR register to enable interrupt 1
	  LDI R16,0x80
	  OUT GICR,R16

	  LDI R16,0x00
	  OUT PORTB,R16

	  SEI

ind_loop:
		 rjmp ind_loop

int1_ISR:IN R16,SREG
		 PUSH R16

		 LDI R16,0x0A
		 MOV R0,R16
		 ;Modify below loops to make LED blink for 1 sec
	c1:	 LDI R16,0x01
		 OUT PORTB,R16

		 LDI R16,0xF9
	a1:	 LDI R17,0xDF
	a2:	 LDI R18,0x05
	a3:	 DEC R18
		 BRNE a3
		 DEC R17
		 BRNE a2
		 DEC R16
		 BRNE a1
		 
		 LDI R16,0x00
		 OUT PORTB,R16

		 LDI R16,0xF9
	b1:	 LDI R17,0xDF
	b2:	 LDI R18,0x05
	b3:	 DEC R18
		 BRNE b3
		 DEC R17
		 BRNE b2
		 DEC R16
		 BRNE b1

		 DEC R0
		 BRNE c1

		 POP R16
		 OUT SREG, R16

		 RETI

