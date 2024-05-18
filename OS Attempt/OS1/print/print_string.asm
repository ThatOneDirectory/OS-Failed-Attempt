print_string:
    mov ah, 0x0E    ; Set up AH register for BIOS teletype output function

print_loop:
    mov al, [bx]    ; Load the next character from memory into AL
    cmp al, 0       ; Check if the character is the null terminator (end of string)
    je print_done   ; If it is, we're done printing the string

    int 0x10        ; Call BIOS interrupt to output the character in AL to the screen
    inc bx          ; Move to the next character in the string
    jmp print_loop  ; Repeat for the next character

print_done:
    ret             ; Return from the routine