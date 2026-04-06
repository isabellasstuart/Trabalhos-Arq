.data
     A: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18
     B: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
     R: .word 0, 0, 0, 0, 0, 0, 0, 0
	
.text
main:
    addi t0, zero, 0    # inicializa iterador em zero
    addi t1, zero, 8    # armazena o tamanho dos vetores em r1 (nesse caso, 8)
    addi t4, zero, 4
    
loop:
    la t2, A            # carrega endereço de A em r2 (A[0])
    mul t0, t0, t4		# para acessar o endereço certo
    add t2, t2, t0      # atualiza para a posição certa do vetor (r2[i])
    lw t3, 0(t2)        # lw r3, 0(r2) -> carrega valor de r2[i] em r3

    la t2, B            # carrega endereço de B em r2 (B[0])
    add t2, t2, t0      # atualiza para a posição certa do vetor (r2[i])
    lw t1, 0(t2)        # lw r1, 0(r2) -> "estraga" temporariamente r1 para fazer a soma

    add t3, t3, t1      # A[i] = A[i] + B[i]
    
    la t2, R            # carrega endereço de R em r2 (R[0])
    add t2, t2, t0      # atualiza para a posição certa do vetor (r2[i])
    sw t3, 0(t2)        # sw r3, 0(r2) -> armazena a soma em R[i]
    
    div t0, t0, t4		# para poder incrementar
    addi t0, zero, 1    # incrementa iterador
    addi t1, zero, 8    # atualiza novamente para o tamanho dos vetores
    blt t0, t1, loop    # continua o loop se iterador < tamanho (de 0 a 7)
    add t0, zero, zero	# iterador em 0
    
imprime_r:
	la t2, R
    li a7, 1
    lw a0, 0(t2)
    ecall
    addi t0, zero, 1
    addi t2, t2, 4
    blt t0, t1, imprime_r






