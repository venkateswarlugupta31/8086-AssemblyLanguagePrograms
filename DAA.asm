; DAA WORKS ONLY IN AX REGISTER
CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 2000H
            MOV DS, AX
            MOV AL, 25H
            MOV AH, 25H
            ADD AL, AH
            DAA
            INT 03H
CODE ENDS
    END START