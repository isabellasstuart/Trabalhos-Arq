; início do loop para carregar os valores dos vetores na memória
    nop             nop             sub r1, r1          nop                     ; i = 0         
    movl 6          nop             sub r2, r2          nop
    movh 1          nop             nop                 nop                     ; r0 = 22 (00010110)
    nop             nop             add r2, r0          not r0, r0              ; r2 = endereço do fim do loop 
    movl 12         nop             nop                 nop                     ; r0 = 12 (tamanho dos vetores) 
    nop             nop             sub r0, r1          nop                     ; r0 = tam - i
    nop             brzr r0, r2                                                 ; se i == tam, salta para o fim do loop

    nop             nop             sub r0, r0	        nop
    movl 12	    nop             sub r2, r2          nop
    nop             nop             add r2, r0		nop		        ; r2 = tam
    movl 15	    nop             sub r3, r3          nop
    movh 2          nop             nop                 nop                     ; r0 = 47 (00101111)
    nop             nop             add r3, r0	        not r0, r0		; r3 = endereço de R[0]; como r0 != 0, instrução 'not' vai zerar r0
    nop             nop             add r3, r1          nop	                ; r3 = endereço de R[i]
    st r0, r3	    nop             addz r3, r2		nop                     ; r0 = endereço de A[i]; 'st' armazena 0 em R[i]
    st r1, r0       nop             add r2, r0	  	not r0, r0	        ; r2 = endereço de B[i]; 'st' armazena iterador em A[i]
    movl 4          nop             nop                 nop
    movh 1          nop             nop                 nop                     ; r0 = 20 (00010100)
    nop             nop             add r0, r1          nop                     ; r0 = 20 + i
    st r0, r2	    nop             addi r1, 1          not r0, r0	        ; 'st' armazena 20 + i em B[i]; 'addi' incrementa iterador
    movl 1	    nop             nop                 nop
    nop             jr r0, r0       nop                 nop                     ; jump para início do loop

; início do loop para fazer a soma dos vetores   
    nop             nop             sub r1, r1          nop                     ; i = 0
    movl 12         nop             sub r2, r2          nop
    movh 2          nop             nop                 nop                     ; r0 = 44 (00101100)
    nop             nop             add r2, r0          not r0, r0              ; r2 = endereço do fim do loop 
    movl 12         nop             nop                 nop                     ; r0 = tam
    nop             nop             sub r0, r1          nop                     ; r0 = tam - i
    nop             brzr r0, r2     nop                 nop                     ; se i == tam, salta para o fim do loop   

    nop             nop             sub r0, r0	        nop
    movl 12	    nop             sub r2, r2          nop
    nop             nop             add r2, r0		nop		        ; r2 = tam
    movl 15	    nop             sub r3, r3          nop
    movh 2          nop             nop                 nop                     ; r0 = 47 (00101111)
    nop             nop             add r3, r0	        not r0, r0		; r3 = endereço de R[0]
    nop             nop             add r3, r1	        nop			; r3 = endereço de R[i]
    nop             nop             addz r3, r2         nop                     ; r0 = endereço de A[i]
    ld r0, r0       nop             add r2, r0          nop                     ; r2 = endereço de B[i] e r0 = A[i]
    ld r2, r2       nop             addi r1, 1          nop                     ; r2 = B[i]; 'addi' incrementa iterador
    nop             nop             add r0, r2          nop                     ; r0 = A[i] + B[i]
    st r0, r3       nop             nop                 nop                     ; R[i] = A[i] + B[i] 
    movl 7          nop             nop                 nop
    movh 1          nop             nop                 nop                 
    nop             jr r0, r0       sub r2, r2          not r0, r0              ; jump para início do loop; zera r2 e r0

; fim do programa       
    movl 14         nop             nop                 nop
    movh 2          nop             nop                 nop                     ; r0 = 46 (00101110)
    nop             jr r0, r0       nop                 nop                     ; "ebreak"
