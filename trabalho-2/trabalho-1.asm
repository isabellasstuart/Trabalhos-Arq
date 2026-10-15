main:    
    sub r1, r1          ; i = 0

loop:  
    sub r0, r0          ; r0 = 0
    sub r2, r2          ; r2 = 0

    addi 7              ; r0 = 7
    add r0, r0          ; r0 = 14
    add r0, r0          ; r0 = 28
    add r0, r0          ; r0 = 56
    addi 1              ; r0 = 57
    add r2, r0          ; carrega endereço do fim do loop em r2

    sub r0, r0          ; r0 = 0
    addi 7              ; r0 = 7
    addi 3              ; r0 = 10 (tam)
    sub r0, r1          ; r0 = tam - i
    brzr r0, r2         ; se i == tam, salta para o fim do loop

    sub r0, r0          
    sub r2, r2          
    addi 7              ; r0 = 7
    add r0, r0          ; r0 = 14
    add r0, r0          ; r0 = 28
    add r0, r0          ; r0 = 56
    addi 7              ; r0 = 63
    addi 5              ; r0 = 68  
    add r2, r0          ; carrega endereço de A em r2 (A[0])
    add r2, r1          ; atualiza para a posição certa do vetor (A[i])
    ld r3, r2           ; lb r3, 0(r2) -> armazena A[i] em r3

    sub r0, r0          
    sub r2, r2          
    addi 7              ; r0 = 7
    add r0, r0          ; r0 = 14
    add r0, r0          ; r0 = 28
    addi 7              ; r0 = 35
    add r0, r0          ; r0 = 70
    addi 7              ; r0 = 77
    addi 1              ; r0 = 78  
    add r2, r0          ; carrega endereço de B em r2 (B[0])
    add r2, r1          ; atualiza para a posição certa do vetor (B[i])
    ld r0, r2           ; armazena B[i] em r0
    add r3, r0          ; r3 = A[i] + B[i]

    sub r0, r0          
    sub r2, r2          
    addi 7              ; r0 = 7
    add r0, r0          ; r0 = 14
    add r0, r0          ; r0 = 28
    add r0, r0          ; r0 = 56
    addi 2              ; r0 = 58
    add r2, r0          ; carrega endereço de R em r2 (R[0])
    add r2, r1          ; atualiza para a posição certa do vetor (R[i])
    st r3, r2           ; sw r2, 0(r3) -> armazena a soma em R[i] (R[i] = A[i] + B[i])

    sub r0, r0          
    addi 1              
    add r1, r0          ; incrementa iterador
    sub r0, r0          
    addi 1              
    sub r2, r2          
    add r2, r0          ; carrega endereço do inicio do loop em r2
    sub r0, r0          
    brzr r0, r2         ; salto incondicional para o inicio do loop
    ebreak              ; fim

R: 
.bits8 0 0 0 0 0 0 0 0 0 0

A: 
.bits8 0 2 4 6 8 10 12 14 16 18

B: 
.bits8 1 3 5 7 9 11 13 15 17 19 