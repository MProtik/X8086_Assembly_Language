.MODEL SMALL
.STACK 100H
.DATA 
    CHE DB ?
.CODE
MAIN PROC
    MOV AH, 1H
    INT 21H
    
    
    MOV CHE, AL
    MOV DL, CHE
    SUB DL, 20H

    MOV AH, 2H
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

   ; MOV AH, 2 ;for display
   ; MOV DL, 'u'
   ; SUB DL, 20H 
   ; INT 21H