CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 4000H
            MOV DS, AX
            MOV AL, DS:[2000H]
            AND AL, 0FH
            MOV DS:[2001H], AL
            MOV AL, DS:[2000H]
            AND AL, 0F0H
            MOV CL, 04H
            ROL AL, CL
            MOV DS:[2002H], AL
            INT 03H
CODE ENDS
    END START