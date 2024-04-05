.model small
.stack 100h

.data
    msg_positive db "Positive$"
    msg_negative db "Negative$"
    msg_zero db "Zero$"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt to enter a number
    mov ah, 09h    ; Function to print string
    mov dx, offset prompt
    int 21h        ; Call interrupt 21h to print the prompt

    ; Read a character from the keyboard
    mov ah, 01h    ; Function to read character from STDIN
    int 21h        ; Call interrupt 21h to read character from keyboard
    mov bl, al     ; Save the character in BL

    ; Check if the character is '+' or '-'
    cmp bl, '+'    ; Compare with '+'
    je positive    ; Jump if equal to '+'

    cmp bl, '-'    ; Compare with '-'
    je negative    ; Jump if equal to '-'

    ; If the character is neither '+' nor '-', it must be a digit
    cmp bl, '3'    ; Compare with '3'
    je positive    ; Jump if equal to '3'

    ; If the character is not '3', it is some other digit
    jmp negative   ; Jump to display "Negative"

positive:
    ; Display "Positive" message
    mov ah, 09h    ; Function to print string
    mov dx, offset msg_positive
    int 21h        ; Call interrupt 21h to print the message
    jmp end_prog   ; Jump to end the program

negative:
    ; Display "Negative" message
    mov ah, 09h    ; Function to print string
    mov dx, offset msg_negative
    int 21h        ; Call interrupt 21h to print the message
    jmp end_prog   ; Jump to end the program

end_prog:
    ; Terminate the program
    mov ah, 4Ch    ; Function to terminate program
    int 21h        ; Call interrupt 21h to terminate program

prompt db "Enter a number: $"

main endp
end main
