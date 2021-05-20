DATA SEGMENT
    A DW 2222H
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  MOV AX, DATA
            MOV DS, AX
            MOV AL, [2000H]
            AND AL, 0FH
            MOV [2001H], AL
            MOV AL, [2000H]
            AND AL, 0F0H
            MOV CL, 04H
            ROL AL, CL
            MOV [2002H], AL
            INT 03H
CODE ENDS
    END START