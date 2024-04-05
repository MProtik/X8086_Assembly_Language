.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    MOV AX, 4H
    MOV BX, 3H
    ADD AX, BX

    ;MOV AH, AL     ; Move the result in AL to AH for printing
    ADD AX, 30H    ; Convert AL to its ASCII representation
    MOV DX, AX    ; Move the ASCII character into DL

    MOV AH, 02H    ; Function to print character
    INT 21H        ; Call interrupt 21H to print the character in DL

    MOV AH, 4CH    ; Function to terminate program
    INT 21H        ; Call interrupt 21H to terminate program
MAIN ENDP
END MAIN
