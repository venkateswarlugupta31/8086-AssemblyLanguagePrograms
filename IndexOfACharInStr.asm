DATA SEGMENT
    STRING      DB  'ENGINEERING'
    STR_LEN     EQU  ($ - STRING)
    CHAR        DB  'G'
    INDEX DB  00H
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, ES:DATA
    START:  MOV AX, DATA        ; Initialization of Data and Extra segment
            MOV DS, AX          ; For SI
            MOV ES, AX          ; For DI
            LEA SI, STRING      ; Storing starting index of string
            LEA DI, CHAR        ; Storing location of the given char
            MOV CX, STR_LEN     ; Counter variable
            CLD                 ; Direction
    BACK:   MOV AH, [SI]        ; String literal into AH
            MOV AL, [DI]        ; Char literal into AL
            CMP AH, AL          ; Checking for equality
            JE FOUND            ; If match found
            INC SI              ; Increment the index
            DEC CX              ; Decrement the counter
            JZ  NOT_FOUND       ; If counter is zero, we are at the end of the string, so we didn't find the char
            JMP BACK            ; Looping
    FOUND:  MOV AX, STR_LEN     ; string lenght minus current CX value gives index of the char
            SUB AX, CX          
            JMP STP             ; After finding we stop the execution 
    NOT_FOUND: MOV AX, 0FFH     ; To indicate not found
    STP:    INT 03H             ; Break point
CODE ENDS
    END START


