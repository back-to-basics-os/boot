[org 0x7c00]
mov bx, HELLO
call print
call print_nl

mov bx, GOODBYE
call print
mov bx, 0 ; Clear bx register so we don't get any unexpected output
call print_nl

HELLO:
    db 'Hello World!', 0

GOODBYE:
    db 'Goodbye!', 0

print:
    pusha
    jmp print_logic

print_logic:
    mov al, [bx]
    cmp al, 0
    je cleanup

    mov ah, 0x0e
    int 0x10
    add bx, 1
    jmp print_logic

cleanup:
    popa
    ret

print_nl:
    pusha
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10

    popa
    ret

jmp $ ; infinite loop

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
