CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 4000H
            MOV DS, AX
            MOV CH, 04H     ; OUTER LOOP COUNTER
    BACK2:  MOV CL, 04H     ; INNER LOOP COUNTER
            MOV SI, 2000H   ; POINTER
    BACK1:  MOV AL, [SI]
            MOV AH, [SI+1]
            CMP AL, AH      ; 1ST - 2ND
            JC SKIP         ; JNC SKIP FOR DECENDING ORDER
            JZ SKIP
            MOV [SI+1], AL
            MOV [SI], AH
    SKIP:   INC SI
            DEC CL
            JNZ BACK1
            DEC CH
            JNZ BACK2
            INT 03H
CODE ENDS
    END START