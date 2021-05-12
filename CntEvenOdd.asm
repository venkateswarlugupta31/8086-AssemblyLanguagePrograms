CODE SEGMENT
    ASSUME CS:CODE
    START:MOV AX, 4000H
          MOV DS, AX
          MOV SI, 2000H
        ; MOV DX, 1111H         ; TO SET SOME VALUES
        ; MOV [SI + 04H], DX    ; TO SET SOME VALUES
          MOV CX, 0064H
          MOV BL, 00H       ; EVEN CNT
          MOV BH, 00H       ; ODD CNT
    BACK: MOV AL, [SI]
          ROR AL, 01H
          JC ODD
          INC BL
          JMP NEXT
    ODD:  INC BH
    NEXT: INC SI
          LOOP BACK
          MOV [SI], BX
          INT 03H
CODE ENDS
    END START