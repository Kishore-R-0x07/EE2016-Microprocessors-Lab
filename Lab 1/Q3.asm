;
; Lab1Q3.asm
;
; Created: 01-09-2021 16:08:03
; Author : Kishore R (EEE20B064)
; EE2016F21 Lab 1


;Problem 3 (8-bit Multiplication without MUL)
.CSEG
;Multiplication stored in R0 and R1
LDI R20, 0x00
MOV R1, R20
LDI ZL, LOW(NUM<<1)
LDI ZH, HIGH(NUM<<1)
LPM R2, Z+
LPM R3, Z
MOV R0, R3
;Multiplication without MUL
;ADD R3 to itself R2 times
;COUNT REGISTER = R16
MOV R16, R2
outerloop : DEC R16
	    BRNE multiply
            RJMP end
multiply : ADD R0, R3
           BRCC outerloop
	   ADC R1, R20     ;R20 is used to simply store a zero value
end : NOP
NUM: .db 0x02, 0x05
