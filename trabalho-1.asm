main:    
    sub r1, r1          ; inicializa iterador em zero

loop:  
    sub r0, r0          
    sub r2, r2          
    addi 7              ; 7
    add r0, r0          ; 14
    add r0, r0          ; 28
    addi 7              ; 35
    addi 7              ; 42
    addi 7              ; 49
    addi 7              ; 56
    addi 2              ; 58
    add r2, r0          ; carrega endereço do fim do loop em r2

    sub r0, r0         
    addi 7
    addi 3              ; r0 = 10 (tam)     
    sub r0, r1          ; r0 = r0 - i

    brzr r0, r2         ; se i = tam, pula para o fim do loop

    sub r0, r0          
    sub r2, r2
    addi 7              ; 7
    add r0, r0          ; 14
    add r0, r0          ; 28
    add r0, r0          ; 56
    addi 6              ; 60
    add r2, r0          ; carrega endereço de A em r2 (A[0])
    add r2, r1          ; atualiza para a posição certa do vetor (r2[i])
    ld r3, r2           ; lw r3, 0(r2) -> carrega valor de r2[i] em r3

    sub r0, r0          
    sub r2, r2
    addi 7              ; 7
    add r0, r0          ; 14
    add r0, r0          ; 28
    add r0, r0          ; 56
    addi 5              ; 61
    add r2, r0          ; carrega endereço de B em r2 (B[0])
    add r2, r1          ; atualiza para a posição certa do vetor (r2[i])
    ld r0, r2           ; armazena r2[i] (B[i]) em r0

    add r3, r0          ; A[i] = A[i] + B[i]

    sub r0, r0          
    sub r2, r2
    addi 7              ; 7
    add r0, r0          ; 14
    add r0, r0          ; 28
    add r0, r0          ; 56
    addi 3              ; 59
    add r2, r0          ; carrega endereço de R em r2 (R[0])
    add r2, r1          ; atualiza para a posição certa do vetor (r2[i])
    st r3, r2           ; sw r2, 0(r3) -> armazena a soma em R[i]   
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