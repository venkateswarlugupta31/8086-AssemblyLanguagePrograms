DATA SEGMENT
    A DB '8'
    B DB '6'
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  MOV AX, DATA
            MOV DS, AX
            MOV AL, A
            MOV BL, B
            MOV AH, 00H
            ADD AL, BL
            AAA
            INT 03H
CODE ENDS
    END START