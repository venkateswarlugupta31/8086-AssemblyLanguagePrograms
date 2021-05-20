DATA SEGMENT
    A   DB  01H, 02H, 03H, 04H, 05H
    B   DB  06H, 07H, 08H, 09H, 0AH
    S   DB  05H DUP(?)
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  MOV AX, DATA
            MOV DS, AX
            MOV CX, 0005H
            CLD
            LEA SI, A
            LEA DI, B
            LEA BX, S
    BACK:   MOV AL, [SI]
            ADC AL, [DI]
            MOV [BX], AL
            INC SI
            INC DI
            INC BX
            LOOP BACK
            INT 03H
CODE ENDS
    END START