.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AH, 2
    MOV CX, 26
    MOV DL, 65

LETTERS:
    INT 21H
    INC DL
    DEC CX

    JNZ LETTERS
    
    MOV Ah, 2
    MOV DL, "."
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN