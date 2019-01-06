NumA			EQU		0x420c0000
NumB			EQU		0x42040000
Aux			DCD		0x7F800000, 0x007FFFFF, 0x7FFFFFFF
			
			ldr		R0, =NumA
			ldr		R1, =NumB
			bl		zero
			bl		expoentes
			bl		mantissas
			bl		alinhar
			bl		soma
			END
			
zero			cmp		R0, #0
			beq		resultadoA
			cmp		R1, #0
			beq		resultadoB
			mov		PC, LR
			
resultadoA	mov		R12, R1
			END
			
resultadoB	mov		R12, R0
			END
			
expoentes		ldr		R2, =Aux
			ldr		R2, [R2]
			and		R3, R0, R2
			sub		R3, R3, #127
			and		R4, R0, R2
			sub		R4, R4, #127
			cmp		R3, R4
			moveq	R5, #0
			subhi	R5, R3, R4
			subcc	R5, R4, R3
			mov		PC, LR
			
mantissas		ldr		R2, =Aux
			ldr		R2, [R2, #4]
			and		R6, R0, R2
			and		R7, R1, R2
			
			mov		PC, LR
			
alinhar		cmp		R3, R4
			asrhi	R7, R7, R5
			asrcc	R6, R6, R5
			mov		PC, LR
			
soma			add		R8, R6, R7
			cmp		R3, R4
			addhs	R8, R8, R3
			addcc	R8, R8, R3
			mov		PC, LR
