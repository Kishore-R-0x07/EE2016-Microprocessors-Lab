;
; Lab1Q4.asm
;
; Created: 01-09-2021 16:23:23
; Author : Kishore R
; EE2016F21 Lab 1


;Problem 4 (Largest of numbers given)
.CSEG
;.def max = R21 .def temp R22  .def count R23
LDI R23, 0x06			;No. of values in array
LDI ZL, LOW(ARR<<1)
LDI ZH, HIGH(ARR<<1)
LDI XL, 0x60
LDI XH, 0x00
LPM R21, Z+
outerloop : DEC R23
	    BRNE loop
	    RJMP end
loop: LPM R22, Z+
      CP R21, R22
      BRLT assign
      RJMP outerloop
assign : MOV R21, R22
         RJMP outerloop
end : NOP
ST X, R21
ARR: .db 0x3D,0x54,0XD3,0x54,0x01,0x02
