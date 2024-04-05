.model small
.stack 100h

.data
    minus db 0DH, 0AH,'-1$'
    zeroo db 0DH, 0AH,'0$'
    pos db 0DH, 0AH,'+1$'
    temp db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1h
    int 21h
    mov bl, al

    mov ah, 1h
    int 21h

    cmp bl, '+'
    je positive

    cmp bl, '-'
    je negetive

    cmp bl, '0'
    je zero

    jmp positive

negetive:
    mov ah, 09h
    mov dx, offset minus
    int 21h
    jmp end

positive:
    mov ah, 09h
    mov dx, offset pos
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