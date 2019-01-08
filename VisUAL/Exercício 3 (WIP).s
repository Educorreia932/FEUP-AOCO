NumA			EQU		0x420c0000
NumB			EQU		0x42040000
Aux			DCD		0x7F800000, 0x007FFFFF, 0x80000000
			
			ldr		R0, =NumA
			ldr		R1, =NumB
			bl		zero
			bl		expoentes
			bl		difexpoentes
			bl		mantissas
			bl		alinhar
			bl		expoentefinal
			bl		sinal
			bl		operacao
			bl		normalizar
			bl		resultado
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
			lsr		R4, R4, #23
			mov		PC, LR
			
mantissas		ldr		R5, =Aux
			ldr		R5, [R5, #4]
			and		R5, R5, R0
		
			ldr		R6, =Aux
			ldr		R6, [R6, #4]
			and		R6, R6, R1
			mov		PC, LR
			
alinhar		cmp		R2, R3
			lsrlo	R5, R5, R4
			lsrhi	R6, R6, R4
			mov		PC, LR
			
expoentefinal	cmp		R2, R3
			movhs	R4, R2
			movlo	R4, R3
			mov		PC, LR
			
sinal		ldr		R7, =Aux
			ldr		R7, [R7, #8]
			and		R7, R7, R0
			ldr		R8, =Aux
			ldr		R8, [R8, #8]
			and		R8, R8, R0
			mov		PC, LR
			
operacao		cmp		R7, R8
			beq		adicao
			bne		subtracao
			
adicao		add		R11, R5, R6
			mov		PC, LR
			
subtracao		cmp		R5, R6
			subhs	R11, R5, R6
			sublo	R11, R6, R5
			mov		PC, LR
			
normalizar	ldr		R10, =Aux
			ldr		R10, [R10, #4]
			and		R10, R10, R11
			cmp		R10, R11
			beq		normalizado
			addne	R9, R9, #1
			lsr		R11, R11, #1
			add		R4, R4, #1
			b		normalizar
normalizado	mov		PC, LR
			
resultado		add		R12, R11, R4
			add		R12, R12, R7
			mov		PC, LR
			
fim			END
