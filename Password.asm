DATA SEGMENT
    PASSWORD    DB      'FAILSAFE'
    STR_LENGTH  EQU     ($ - PASSWORD)
    INPUT_WORD  DB      'FAILSEFE'
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, ES:DATA
    START:  MOV AX, DATA
            MOV DS, AX
            MOV ES, AX
            LEA SI, PASSWORD
            LEA DI, INPUT_WORD
            MOV CX, STR_LENGTH
            CLD
    REP     CMPSB
            JNE INCRCT
            JMP OK
    OK:     MOV AL, 02H
    INCRCT: MOV AL, 01H
            INT 03H
CODE ENDS
    END START