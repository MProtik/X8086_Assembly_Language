.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV AH, 2 ;for display
    MOV DL, 'u'
    SUB DL, 20H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
