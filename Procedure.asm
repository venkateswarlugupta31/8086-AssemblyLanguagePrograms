DATA SEGMENT
    N1   DB 05H
    N2   DB 04H
    SUM  DB ?
    DIF  DB ?
DATA ENDS

CODE SEGMENT 
    ASSUME CS:CODE, DS:DATA
    START:
            MOV AX, DATA
            MOV DS, AX
            CALL ADDITION
            CALL SUBTRACTION
            INT 03H

    ADDITION PROC NEAR
        MOV AL, N1
        MOV BL, N2
        ADD AL, BL
        MOV SUM, AL
        RET
    ADDITION ENDP

    SUBTRACTION PROC NEAR 
        MOV AL, N1
        MOV BL, N2
        SUB AL, BL
        MOV DIF, AL
        RET
    SUBTRACTION ENDP

CODE ENDS
    END START

