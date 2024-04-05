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

    mov ax, 2H
    mov dl, 2
    int 21h
    
    mov ax, 4Ch
    int 21h

main endp
end main