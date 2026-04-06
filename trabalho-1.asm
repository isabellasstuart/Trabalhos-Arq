main:
    addi r0, zero, 0    ; inicializa iterador em zero
    addi r1, zero, 8    ; armazena o tamanho dos vetores em r1 (nesse caso, 8)
    
loop:
    la r2, A            ; carrega endereço de A em r2 (A[0])
    add r2, r0      ; atualiza para a posição certa do vetor (r2[i])
    lw r2, r3, 0        ; lw r3, 0(r2) -> carrega valor de r2[i] em r3

    la r2, B            ; carrega endereço de B em r2 (B[0])
    add r2, r0      ; atualiza para a posição certa do vetor (r2[i])
    lw r2, r1, 0        ; lw r1, 0(r2) -> "estraga" temporariamente r1 para fazer a soma

    add r3, r1      ; A[i] = A[i] + B[i]
    
    la r2, R            ; carrega endereço de R em r2 (R[0])
    add r2, r0      ; atualiza para a posição certa do vetor (r2[i])
    sw r2, r3, 0        ; sw r3, 0(r2) -> armazena a soma em R[i]
    
    addi r0, zero, 1    ; incrementa iterador
    addi r1, zero, 8    ; atualiza novamente para o tamanho dos vetores
    blt r0, r1, loop    ; continua o loop se iterador < tamanho (de 0 a 7)

R:
.bits8 0 0 0 0 0 0 0 0

A:
.bits8 0 2 4 6 8 10 12 14 16 18

B:
.bits8 1 3 5 7 9 11 13 15 17 19