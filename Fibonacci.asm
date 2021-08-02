DATA SEGMENT
    N DB 04H
DATA ENDS
CODE SEGMENT 
    ASSUME CS:CODE, DS:DATA
    START:      MOV AX, DATA
                MOV DS, AX
                MOV AL, 00H         ; A = 0
                MOV BL, 01H         ; B = 1
                MOV CL, N           ; suppose 5 fibonacci numbers(0, 1, 1, 2, 3)
                
                CMP CL, 01H         
                JZ FINISH1
                CMP CL, 02H
                JZ FINISH2

                SUB CL, 02H         ; CX Iterates for 3 times, as 1st and 2nd fibonacci numbers are known
                MOV CH, 00H

    BACK:       MOV BH, BL
                ADD BH, AL
                MOV DL, BH          ; DL as C = A + B
                MOV AL, BL
                MOV BL, DL
                LOOP BACK
                JMP TERMINATE
    FINISH1:    MOV DX, 0000H
                JMP TERMINATE
    FINISH2:    MOV DX, 0001H 
    TERMINATE:  INT 03H
CODE ENDS
    END START
