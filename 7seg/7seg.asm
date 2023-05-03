 PORTA EQU 00H

 PORTB EQU 02H

 PORTC EQU 04H

 PORT_CON EQU 06H

CODE SEGMENT

 ORG 100H

 MOV DX, PORT_CON

 MOV AL, 10000010B      ; port C (output), port A (output) in mode 0 and PORT B (INPUT) in mode 0

 OUT DX, AL

 MOV AL, 11000000B

 MOV DX, PORTA

 OUT DX,AL      ;Display 0 on 7Segment

START:

 MOV DX, PORTB

 IN AL, DX ;Check Push Buttons

 MOV DX, PORTA     ; prepare PORTA For Output to 7Segment

 CMP AL, 11111110B

 JZ S0

 CMP AL, 11111101B

 JZ S1

 CMP AL, 11111011B

 JZ S2

 CMP AL, 11110111B

 JZ S3

 CMP AL, 11101111B

 JZ S4

 CMP AL, 11011111B

 JZ S5

 CMP AL, 10111111B

 JZ S6

 CMP AL, 01111111B

 JZ S7

JMP START

DISPLAY:

OUT DX,AL

JMP START

S0:

 MOV AL, 11000000B

 JMP DISPLAY

S1:

 MOV AL, 11111001B

 JMP DISPLAY

S2:

 MOV AL, 10100100B

 JMP DISPLAY

S3:

 MOV AL, 10110000B

 JMP DISPLAY

S4:

 MOV AL, 10011001B

 JMP DISPLAY

S5:

 MOV AL, 10010010B

 JMP DISPLAY

S6:

 MOV AL, 10000010B

 JMP DISPLAY

S7:

 MOV AL, 11111000B

 JMP DISPLAY

CODE ENDS

END
