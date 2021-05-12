DATA SEGMENT
    A     DW 9568H      ; 8 + 8 => 10 => Auxillary carry,               6 + 6 => C => higher nibble greater than 9
    B     DW 9568H      ; 5 + 5 => A => Lower nibble greater than 9,    9 + 9 => 12 => Carry flag
    SUM   DW 0000H
    CARRY DB 00H
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    
    START:  MOV AX, DATA        ; Initializing data segment
            MOV DS, AX
            
            MOV AX, A           ; Storing A value in a register
            MOV BX, B           ; Storing B value in a register
            
            ADD AL, BL          ; Adding lower byte
            DAA                 ; Performing DAA
            
            PUSHF               ; Next step may affect current carry flag, which is undesirable. Think!

            MOV CX, 0000H       ; Since we lose contents of AL, in next step(to add, and perform DAA of higher byte)
            ADD CL, AL          ; We are storing in memory (since addition between memory and register is not possible
            MOV SUM, CX         ; two steps)
            
            POPF

            MOV AL, AH          ; Loading contents of AH, into AL, to perform DAA
            
            ADC AL, BH          ; Adding higher bytes
            DAA                 ; Performing DAA
            
            JNC SKIP            ; If no carry we skip(Need not store carry value, because no carry is generated)
            MOV CARRY, 01H      ; Incrementing carry
    
    SKIP:   MOV CX, 0000H       ; Making CX zero, to add with previously stored sum
            ADD CH, AL          ; getting value of AL to CH(Why in CH?  Because, they are higher byte numbers)
            ADD CX, SUM         ; We are storing in memory (since addition between memory and register is not possible
            MOV SUM, CX         ; two steps)
            
            INT 03H
CODE ENDS
    END START