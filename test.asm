.model small
.stack 100h

.data
    minus db '-1', 0DH, 0AH,'$'
    zero db '0$'
    pos db 0DH, 0AH,'+1', '$'
    temp db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1h
    int 21h
    mov temp, al

    mov al, temp
    cmp ax, 5
    jl less
    jg greater
    je equal

less:
    mov ah, 09h
    mov dx, offset minus
    int 21h
    jmp end

greater:
    mov ah, 09h
    mov dx, offset pos
    int 21h
    jmp end

equal:
    jmp end


    mov ah, 2H
    mov dl, temp
    int 21h

end:
    mov ah, 4Ch
    int 21h

main endp
end main