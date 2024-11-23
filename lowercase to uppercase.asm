.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER A LOWERCASE LETTER..', 0AH, 0DH, '->', '$'
    UPPER DB 0AH, 0DH, 'THE UPPERCASE.. ','$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9H
    MOV DX, offset MSG ;Enter a lowercase letter
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV BL, AL

    MOV AH, 9H
    MOV DX, offset UPPER ;Uppercase msg
    INT 21H

    MOV DL, BL
    SUB DL, 20H
    MOV AH, 2 ;for display
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
