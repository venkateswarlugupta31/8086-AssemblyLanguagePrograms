DATA SEGMENT
    N DB 05H
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

    START:  MOV AX, DATA
            MOV DS, AX

            MOV CL, N
            MOV CH, 00H
            MOV AX, 0001H
            MOV DX, 0000H
    
    BACK:   MUL CX
            LOOP BACK

            INT 03H 
CODE ENDS
    END START