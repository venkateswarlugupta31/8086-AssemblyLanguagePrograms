CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 2000H
            MOV DS, AX
            MOV SI, 0000H
            MOV CX, 0005H
            MOV AH, 00H         ; KEEPING TRACK NO OF NEGATIVE NUMBERS
    BACK:   MOV AL, [SI]
            RCL AL, 01H         
            ; RCL IS BETTER OVER ROL, BECAUSE WE PRESERVE PRESENT CARRY.
            ; WE CAN REVERT BACK BY PERFORMING OPPOSITE ROTATION
            JNC SKIP
            INC AH
    SKIP:   INC SI
            LOOP BACK
            MOV [SI], AH
            INT 03H
CODE ENDS
    END START