NumA			EQU		0x40900000
NumB			EQU		0xc0700000
Aux			DCD		0x7F800000, 0x007FFFFF, 0x80000000
			
			
			ldr		R0, =NumA
			ldr		R1, =NumB
			bl		zero
			bl		sinal
			bl		expoente
			bl		calcshiftsbits
			b		fim
			
zero			cmp		R0, #0x00000000
			moveq	R12, R0
			beq		fim
			cmp		R1, #0x00000000
			moveq	R12, R1
			beq		fim
			mov		PC, LR
			
sinal		ldr		R2, =Aux
			ldr		R2, [R2, #8]
			and		R2, R0, R2
			ldr		R3, =Aux
			ldr		R3, [R3, #8]
			and		R3, R1, R3
			cmp		R2, R3
			moveq	R2, #0x0
			movne	R2, #0x1
			mov		PC, LR
			
expoente		ldr		R3, =Aux
			ldr		R3, [R3, #4]
			and		R3, R3, R0
			ldr		R4, =Aux
			ldr		R4, [R4, #4]
			and		R4, R4, R0
			add		R3, R3, R4
			mov		PC, LR
			
calcshiftsbits	ldr		R4, =Aux
			ldr		R4, [R4, #4]
			and		R4, R4, R0
			ldr		R5, =Aux
			ldr		R5, [R5, #4]
			and		R5, R5, R1
ciclo		lsrs		R6, R4, #1
			bhs      carry
			lsrlo	R4, R4, #1
			blo		ciclo
carry			
			mov		PC, LR
			
fim			END
			
			
