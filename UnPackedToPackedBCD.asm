CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 4000H
            MOV DS, AX
            MOV AL, DS:[2002H]
            MOV CL, 04H
            ROL AL, CL
            ADD AL, DS:[2001H]
            MOV DS:[2000H], AL
            INT 03H
CODE ENDS
    END START