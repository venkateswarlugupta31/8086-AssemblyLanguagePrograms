CODE SEGMENT
    ASSUME CS:CODE
    START:  MOV AX, 2000H
            MOV DS, AX
            MOV SI, 0000H

            ; Q x S BEGINS
            MOV AX, [SI]
            MOV BX, [SI+04H]
            MUL BX
            MOV [SI+08H], AX
            MOV [SI+0AH], DX
            ; Q x S ENDS
            
            ; P x R BEGINS
            MOV AX, [SI+02H]
            MOV BX, [SI+06H]
            MUL BX
            MOV [SI+0CH], AX
            MOV [SI+0EH], DX
            ; P x S ENDS

            ; P x S BEGINS
            MOV AX, [SI+02H]
            MOV BX, [SI+04H]
            MUL BX
            ADD AX, [SI+0AH]
            MOV [SI+0AH], AX
            ADC DX, [SI+0CH]
            MOV [SI+0CH], DX
            MOV AX, 0000H
            ADC AX, [SI+0EH]
            MOV [SI+0EH], AX
            ; P x S ENDS

            ; Q x R BEGINS
            MOV AX, [SI]
            MOV BX, [SI+06H]
            MUL BX
            ADD AX, [SI+0AH]
            MOV [SI+0AH], AX
            ADC DX, [SI+0CH]
            MOV [SI+0AH], DX
            MOV AX, 0000H
            ADC AX, [SI+0EH]
            MOV [SI+0EH], AX
            ; Q x R ENDS

            INT 03H
CODE ENDS
    END START

