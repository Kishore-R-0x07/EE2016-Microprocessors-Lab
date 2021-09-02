Q1
;
; Lab1Q1.asm
;
; Created: 01-09-2021 08:06:32
; Author : Kishore R (EEE20B064)
; EE2016F21 Lab 1


;Problem 1 (Common 8-bit Addition)
.CSEG
;Addition stored in the 2 registers : R0 and R16
LDI R16, 0x00       ;If a carry exists, We'll store it in R16
LDI ZL, LOW(NUM<<1)
LDI ZH, HIGH(NUM<<1)
LPM R0, Z+
LPM R1, Z
ADD R0, R1
ADC R16, R16
NOP
NUM: .db 0xD3, 0x5F
