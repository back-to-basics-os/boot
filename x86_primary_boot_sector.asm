; Infinite loop (e9 fd ff)
loop:
    jmp loop

; Write 510 bytes of blank memory
times 510-($-$$) db 0

; Write the magic number into the remaining 2 bytes of memory we have left
dw 0xaa55
