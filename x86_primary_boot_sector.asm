; Test tty works by printing Hello World
mov ah, 0x0e ; tty mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' is still on al, remember?
mov al, 'o'
int 0x10
mov al, ''
int 0x10
mov al, 'W'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10
mov al, '!'
int 0x10

; Infinite loop
jmp $ ; jump to current address = infinite loop

; Fill any empty memory locations with the value '0' and save 2 bytes for the magic number that the BIOS looks for
times 510-($-$$) db 0

; Write the magic number into the remaining 2 bytes of memory we have left
dw 0xaa55
