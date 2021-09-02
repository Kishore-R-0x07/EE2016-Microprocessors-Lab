;
; Lab1Q2.asm
;
; Created: 01-09-2021 16:02:57
; Author : Kishore R (EE20B064)
; EE2016F21 Lab 1


;Problem 2 (16-bit Addition)
.CSEG
;16-bit addition stored in 3 Registers : R16, R17 and R20
LDI R20, 0x00    ; If a carry exists, We'll store it in R20
LDI R16, 0x01
LDI R17, 0x80
LDI R18, 0x01
LDI R19, 0x80
ADD R16, R18
ADC R17, R19
ADC R20, R20
NOP
