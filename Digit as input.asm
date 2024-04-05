.model small
.stack 100h

.data
    msg db 10, 13, 'You entered: $'  ; Message to display
    buffer db 10, ?             ; Buffer to store input character
    digit db ?                  ; Variable to store the input digit

.code
main proc
    mov ah, 09h                 ; Display message
    lea dx, msg
    int 21h

    mov ah, 01h                 ; Input a character
    int 21h
    sub al, 30h                 ; Convert ASCII to binary
    mov digit, al               ; Store the digit

    mov dl, digit               ; Move digit to DL register
    add dl, 30h                 ; Convert binary to ASCII
    mov ah, 02h                 ; Display the digit
    int 21h

    mov ah, 4Ch                 ; Exit program
    int 21h

main endp
end main
