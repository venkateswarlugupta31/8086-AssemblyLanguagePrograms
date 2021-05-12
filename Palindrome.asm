DATA SEGMENT
    STRING1 DB 01H, 02H, 03H, 02H, 01H
    PAL     DB 0FH      ; SETTING IT TO FALSE
DATA ENDS

EXTRA SEGMENT
    STRING2 DB 07H DUP(?)
EXTRA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, ES:EXTRA

    START:  MOV AX, DATA
            MOV DS, AX
            MOV AX, EXTRA
            MOV ES, AX

            LEA SI, STRING1
            LEA DI, STRING2 + 04H

            MOV CX, 05H

    BACK:   CLD
            LODSB
            STD
            STOSB
            LOOP BACK

            LEA SI, STRING1
            LEA DI, STRING2

            MOV CX, 05H

            CLD

    REPE    CMPSB

            JNZ SKIP    
            MOV PAL, 01H
    
    SKIP:   INT 03H
CODE ENDS
    END START