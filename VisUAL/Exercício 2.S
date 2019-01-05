Num			EQU		0xC20A0000
Aux			DCD		0x7F800000, 0x007FFFFF, 0x7FFFFFFF
			
			ldr		R0, =Num
			bl		sinal
			mov		R6, R0
			ldr		R0, =Num
			bl		expoentereal
			ldr		R0, =Num
			bl		mantissa
			
			END
			
sinal		lsr		R1, R0, #31
			mov		PC, LR
			
expoentereal	ldr		R1, =Aux
			ldr		R1,[R1]
			and		R0, R0, R1
			lsr		R0, R0, #23
			sub		R0, R0, #127
			mov		PC, LR
			
mantissa		ldr		R1, =Aux
			ldr		R1, [R1, #4]
			and		R1, R1, R0
			add		R0, R1, #0x08000000
			mov		PC, LR