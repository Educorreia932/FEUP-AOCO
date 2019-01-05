seqA		DCD		3, - 5,21,2, - 10,50,9 ; sequência
tseqA		DCD		7 ; tamanho da sequência
		
		ldr		R0, =tseqA ; carrega endereço do número de elementos
		ldr		R0, [R0] ; coloca o número de elementos em R0
		ldr		R1, =seqA ; carrega endereço do primeiro elemento
ciclo		cmp		R0, #0 ; verifica se chegou ao final
		beq		fim ; termina
		ldr		R2, [R1] ; carrega elemento atual
		lsl		R2, R2, #1 ; multiplica por 2
		str		R2, [R1] ; armazena em memória
		add		R1, R1, #4 ; atualiza endereço para ler próximo elemento
		sub		R0, R0, #1 ; atualiza o número de elementos a ler
		b		ciclo
fim		END
