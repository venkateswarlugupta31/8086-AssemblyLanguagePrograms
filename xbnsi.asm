; x EXCHANGE
; B BLOCK
; n NO
; s STRING
; i INSTRUCTIONS
CODE SEGMENT
    ASSUME CS:CODE
    START:
          MOV AX, 2000H
          MOV DS, AX
          MOV AX, 3000H
          MOV ES, AX
          MOV SI, 5000H
          MOV DI, 6000H
          MOV CX, 0400H
    BACK: MOV AL, DS:[SI]
          MOV AH, ES:[DI]
          MOV ES:[DI], AL
          MOV DS:[SI], AH
          INC SI
          INC DI
          LOOP BACK
          INT 03H
CODE ENDS
    END START

In this program, we exchange block of data(here 1KB, 1024B, 0400H) but here(4 bytes)
Between 25000H and 36000H 
Logic:  save 8 bit data in one register of one block, and
        save 8 bit data in another register of another block
        put those register values in opposite segments
