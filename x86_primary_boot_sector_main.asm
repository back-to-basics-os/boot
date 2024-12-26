[org 0x7c00]

mov bx, HELLO
call print
call print_nl

mov bx, GOODBYE
call print
mov bx, 0 ; Clear bx register so we don't get any unexpected output
call print_nl

mov dx, 0x12fe
call print_hex

HELLO:
    db 'Hello World!', 0

GOODBYE:
    db 'Goodbye!', 0

jmp $ ; infinite loop

%include "boot/x86_primary_boot_sector_print.asm"

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
