
print:
    pusha

start:
    mov al, [bx]
    cmp al, 0
    je clean

    mov ah, 0x0e ;tty mode
    int 0x10
    add bx, 1
    jmp start

clean:
    popa
    ret

print_nl:
    pusha

    mov ah,0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10

    popa
    ret

print_hex:
    pusha

    mov cx, 0

hex_loop:
    cmp cx, 4
    je end

    mov ax, dx ; We will use ax as our "working" register
    and ax, 0x000f
    add al, 0x30
    cmp al, 0x39
    jle step2
    add al, 7

step2:
    mov bx, HEX_OUT + 5
    sub bx,cx
    mov [bx], al
    ror dx, 4

    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

    popa
    ret

HEX_OUT:
    db '0x0000', 0
