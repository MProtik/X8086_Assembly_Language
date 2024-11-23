.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER A LETTER: $'
    UPPERCASE_MSG DB ', THE ENTERED LETTER IS UPPERCASE',  0AH, 0DH, 'Converted letter: ', '$'
    LOWERCASE_MSG DB ', THE ENTERED LETTER IS LOWERCASE', 0AH, 0DH, 'Converted letter: ', '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9H
    MOV DX, OFFSET MSG
    INT 21H

    MOV AH, 1H
    INT 21H
    MOV BL, AL

    CMP BL, 'a' ; Compare with ASCII value of 'A'
    JAE Lowercase ; Jump if below 'A'
    JB Uppercase ; Jump if below or equal to 'Z'

Lowercase:
    MOV AH, 9H
    MOV DX, OFFSET LOWERCASE_MSG
    INT 21H

    MOV DL, BL
    SUB DL, 20H
    MOV AH, 2 ;for display
    INT 21H
    JMP Exit

Uppercase:
    MOV AH, 9H
    MOV DX, OFFSET UPPERCASE_MSG
    INT 21H

    MOV DL, BL
    ADD DL, 20H
    MOV AH, 2 ;for display
    INT 21H

Exit:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
