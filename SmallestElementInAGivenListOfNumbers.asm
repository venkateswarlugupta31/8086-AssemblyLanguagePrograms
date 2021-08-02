CODE SEGMENT
    ASSUME CS:CODE
START: MOV AX, 4000H        ; initializing data segment
       MOV AX, 5000H



MOV AX, BX



PUSH AX



MOV DS, 5000H
       MOV DS, AX
       MOV SI, 2000H        ; initializing source index
       MOV CX, 0005H        ; count of 5 numbers
       MOV AL, 0FFH         ; assuming current smallest as FFH
BACK:  CMP [SI], AL         ; comparing every element with current smallest
       JNC SKIP
       MOV AL, [SI]
SKIP:  INC SI
       LOOP BACK
       MOV [SI], AL         ; storing the result at the end of 5 numbers
       INT 03H
CODE ENDS
    END START