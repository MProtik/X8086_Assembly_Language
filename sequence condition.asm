.model small
.stack 100h

.data 
    eq db 0Dh, 0AH, "Equal$"

    
.code
main proc
    mov ax, @data
    mov ds, ax


    mov ah, 1h
    int 21h
    mov bl, al

    mov ah, 1h
    int 21h

    cmp al, bl 
    jg greater
    jl less
    je equal

greater:
    mov ah, 2h
    mov dx, ax
    int 21h
    jmp end

less:
    mov ah, 2h
    mov dx, bx
    int 21h
    jmp end


equal:
    mov ah, 09h
    mov dx, offset eq
    int 21h
    jmp end

end:
    mov ah, 4ch
    int 21h

main endp
end main
