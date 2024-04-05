   .model small
.stack 100h

.data
    num1 dw 30       ; Define num1 as a word (16-bit) variable with initial value 10
    num2 dw 50      ; Define num2 as a word (16-bit) variable with initial value 20
    greater_msg db 'num1 is greater than num2','$'   ;DB MEANS DEFINE BYTES
    less_msg db 'num1 is less than num2', 0Dh, 0Ah, '$' ; (0DH)
    equal_msg db 'num1 is equal to num2', 0Dh, 0Ah, '$'

    

.code
main proc
    mov ax, @data    ; Load the data segment address into AX
    mov ds, ax       ; Move the value of AX into the data segment register

    mov ax, num1     ; Move the value of num1 into AX
    cmp ax, num2     ; Compare the value of AX (num1) with num2
    jg greater       ; Jump to 'greater' if AX > num2
    jl less          ; Jump to 'less' if AX < num2
    je equal         ; Jump to 'equal' if AX = num2

greater:
    mov ah, 09h      ; Print message for greater
    mov dx, offset greater_msg
    int 21h
    jmp end_prog

less:
    mov ah, 09h      ; Print message for less
    mov dx, offset less_msg
    int 21h
    jmp end_prog

equal:
    mov ah, 09h      ; Print message for equal
    mov dx, offset equal_msg
    int 21h
    jmp end_prog

end_prog:
    mov ah, 4Ch      ; DOS exit function
    int 21h          ; Call DOS interrupt


main endp
end main
