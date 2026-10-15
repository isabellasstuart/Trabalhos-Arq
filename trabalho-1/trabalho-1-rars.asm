.data
	A: .byte 0, 2, 4, 6, 8, 10, 12, 14, 16, 18   
    B: .byte 1, 3, 5, 7, 9, 11, 13, 15, 17, 19   
    R: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0        
    espaco: .string " "
	
.text
main:
    addi t0, zero, 0    	# inicializa iterador em zero
    addi t1, zero, 10   	# armazena o tamanho dos vetores em r1 (nesse caso, 10)
    sub t1, t1, t0
    
loop:
	beq t1, zero, pre 		# continua o loop se iterador < tamanho (de 0 a 7)
    la t2, A            	# carrega endereço de A em r2 (A[0])
    add t2, t2, t0      	# atualiza para a posição certa do vetor (r2[i])
    lb t3, 0(t2)        	# lw r3, 0(r2) -> carrega valor de r2[i] em r3

    la t2, B            	# carrega endereço de B em r2 (B[0])
    add t2, t2, t0      	# atualiza para a posição certa do vetor (r2[i])
    lb t1, 0(t2)        	# lw r1, 0(r2) -> "estraga" temporariamente r1 para fazer a soma

    add t3, t3, t1      	# A[i] = A[i] + B[i]
    
    la t2, R            	# carrega endereço de R em r2 (R[0])
    add t2, t2, t0      	# atualiza para a posição certa do vetor (r2[i])
    sb t3, 0(t2)        	# sw r3, 0(r2) -> armazena a soma em R[i]
    	
    addi t0, t0, 1    		# incrementa iterador
    addi t1, zero, 10   	# atualiza novamente para o tamanho dos vetores
    sub t1, t1, t0
    beq zero, zero, loop
    
pre:
    add t0, zero, zero		# iterador em 0
    la t2, R
    addi t1, zero, 10   	# atualiza novamente para o tamanho dos vetores
    
imprime_r:
    lb a0, 0(t2)
    li a7, 1				# imprimir inteiro
    ecall
    
    la a0, espaco
    li a7, 4				# imprimir string
    ecall
    
    addi t0, t0, 1			# incrementa iterador (para imprimir o vetor R)
    addi t2, t2, 1			# incrementa ponteiro para v[i]
    blt t0, t1, imprime_r
    
    li a7, 10
    ecall