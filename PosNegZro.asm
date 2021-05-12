CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AX, 4000H
           MOV DS, AX
           MOV SI, 2000H
           MOV CX, 0064H        ; 100 DECIMAL CNT
           MOV BL, 00H          ; POSITIVE
           MOV BH, 00H          ; NEGATIVE
           MOV DL, 00H          ; ZERO
    BACK:  MOV AL, [SI] 
           ADD AL, 00H 
           JZ ZERO
           ROL AL, 01H
           JC NEGATIVE
           INC BL
           JMP NEXT
NEGATIVE:  INC BH
           JMP NEXT
    ZERO:  INC DL
    NEXT:  INC SI
           LOOP BACK
           INT 03H
CODE ENDS   
    END START