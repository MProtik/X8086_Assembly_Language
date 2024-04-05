.model small
.stack 100h
.DATA
    message db 'Hello, world!', '$' ; Define a null-terminated string

.code
main proc
    mov ax, @data    ; Load the data segment address into AX
    mov ds, ax       ; Move the value of AX into the data segment register

    mov ah, 09h      ; DOS function for printing string
    LEA dx, 'Hello, world!', '$' ; Load the offset of the message into DX
    int 21h          ; Call DOS interrupt to print the string

    mov ah, 4Ch      ; DOS function for program termination
    int 21h          ; Call DOS interrupt to terminate program

main endp
end main
