.model small
.stack 100h

.data
    minus db 0DH, 0AH,'-1$'
    zeroo db 0DH, 0AH,'0$'
    pos db 0DH, 0AH,'+1$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1h
    int 21h
    mov bl, al  ;sign registor -> to store the sign

    mov ah, 1h
    int 21h

    cmp bl, '+' ;if the sign in positive
    je positive

    cmp bl, '-' ;if the sign in negative
    je negetive

    cmp bl, '0' ;if the sign is zero
    je zero

    jmp positive ; if there is no sign

positive:
    mov ah, 09h
    mov dx, offset pos
    int 21h
    jmp end

negetive:
    mov ah, 09h
    mov dx, offset minus
    int 21h
    jmp end

zero:
    mov ah, 09h
    mov dx, offset zeroo
    int 21h
    jmp end

end:
    mov ah, 4Ch
    int 21h

main endp
end main