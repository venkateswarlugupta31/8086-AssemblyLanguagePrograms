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
         ;MOV CX, 0200H
          CLD
     REP  MOVSB
    ;REP  MOVSW
          INT 03H
CODE ENDS
    END START
This program transfers a block of data of 1KB(1024B in decimal) 
From 25000, to 36000, using auto increment
1024 is 2 power 10 that means   0000 0100 0000 0000 in hexadecimal it is 0400 (while byte transfer)
2048 is 2 power 11 that means   0000 1000 0000 0000 in hexadecimal it is 0800 
4096 is 2 power 12 that means   0001 0000 0000 0000 in hexadecimal it is 1000 
5KB is 5 times 1024, is 0001 0100 0000 0000 in hexadecimal it is 1400
6kb is 6 times 1024, is 0001 1000 0000 0000 in hexadecimal it is 1800
512 is 2 power 9 that means     0000 0010 0000 0000 in hexadecimal it is 0200 (while word transfer)
