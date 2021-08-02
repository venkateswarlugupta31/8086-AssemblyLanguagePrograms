CODE SEGMENT
    ASSUME CS:CODE
    START:
            MOV AX, 2000H
            MOV DS, AX
            MOV AL, 02H
            NEG AL
            MOV BL, 03H
            IMUL BL
            NEG AL
            INT 03H
CODE ENDS
    END START