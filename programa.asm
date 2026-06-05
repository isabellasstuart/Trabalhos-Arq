    sub r1, r1          ; i = 0

    sub r0, r0          ; r0 = 0
    sub r2, r2          ; r2 = 0

    movl 9
    movh 2              ; r0 = 41 (00101001)
    add r2, r0          ; carrega endereço do fim do loop em r2

    sub r0, r0          ; r0 = 0
    movl 12             ; r0 = 12 (00001100)
    sub r0, r1          ; r0 = tam - i
    brzr r0, r2         ; se i == tam, salta para o fim do loop

    sub r0, r0          
    sub r2, r2          
    movl 11
    movh 3              ; r0 = 59 (00111011) 
    add r2, r0          ; carrega endereço de A em r2 (A[0])
    add r2, r1          ; atualiza para a posição certa do vetor (A[i])
    ld r3, r2           ; lb r3, 0(r2) -> armazena A[i] em r3

    sub r0, r0          
    sub r2, r2          
    movl 7
    movh 4              ; r0 = 71 (01000111) 
    add r2, r0          ; carrega endereço de B em r2 (B[0])
    add r2, r1          ; atualiza para a posição certa do vetor (B[i])
    ld r0, r2           ; armazena B[i] em r0
    add r3, r0          ; r3 = A[i] + B[i]

    sub r0, r0          
    sub r2, r2          s
    movh 2              ; r0 = 48 (00110000)
    add r2, r0          ; carrega endereço de R em r2 (R[0])
    add r2, r1          ; atualiza para a posição certa do vetor (R[i])
    st r3, r2           ; sw r2, 0(r3) -> armazena a soma em R[i] (R[i] = A[i] + B[i])

    sub r0, r0          
    movl 1              
    add r1, r0          ; incrementa iterador
    sub r0, r0          
    movl 1              
    sub r2, r2          
    add r2, r0          ; carrega endereço do inicio do loop em r2
    sub r0, r0          
    brzr r0, r2         ; salto incondicional para o inicio do loop

    sub r0, r0          ; prepara fim do loop (end = 41)
    sub r2, r2
    movl 15
    movh 2              ; r0 = 47 (00101111)
    add r2, r0          ; carrega endereço do fim do loop em r2
    sub r0, r0         
    brzr r0, r2         ; ebreak

R: 
.bits8 0 0 0 0 0 0 0 0 0 0 0 0

A: 
.bits8 0 1 2 3 4 5 6 7 8 9 10 11

B: 
.bits8 20 21 22 23 24 25 26 27 28 29 30 31
