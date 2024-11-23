.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER A LETTER: $'
    ASCII_MSG DB 0AH, 0DH, 'ASCII VALUE: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt to enter a letter
    MOV AH, 9
    MOV DX, OFFSET MSG
    INT 21H

    ; Read a single character
    MOV AH, 1
    INT 21H
    MOV BL, AL  ; Store the entered character in BL

    ; Display prompt for ASCII value
    MOV AH, 9
    MOV DX, OFFSET ASCII_MSG
    INT 21H

    ; Display the ASCII value of the entered character
    MOV AH, 2
    MOV DL, BL
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
