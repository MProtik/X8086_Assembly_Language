.MODEL SMALL
.STACK 100H
.DATA
    STRING DB 'HELLO WORLD', '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, STRING
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN