NumA			EQU		0x40900000
NumB			EQU		0xc0700000
Aux			DCD		0x7F800000, 0x007FFFFF, 0x7FFFFFFF
			
			ldr		R0, =NumA
			ldr		R1, =NumB
			bl		zero
			bl		expoentes
			bl		difexpoentes
			bl		mantissas
			bl		alinhar
			b		fim
			
zero			cmp		R0, #0x00000000
			moveq	R12, R1
			beq		fim
			cmp		R1, #0x00000000
			moveq	R12, R0
			beq		fim
			mov		PC, LR
			
expoentes		ldr		R2, =Aux
			ldr		R2, [R2]
			and		R2, R2, R0
			ldr		R3, =Aux
			ldr		R3, [R3]
			and		R3, R3, R1
			mov		PC, LR
			
difexpoentes	cmp		R2, R3
			subhs	R4, R2, R3
			sublo	R4, R3, R2
			mov		PC, LR
			
mantissas		ldr		R5, =Aux
			ldr		R5, [R5, #4]
			and		R5, R5, R0
			ldr		R6, =Aux
			ldr		R6, [R6, #4]
			and		R6, R6, R1
			mov		PC, LR
			
alinhar		cmp		R0, R1
			
fim			END
