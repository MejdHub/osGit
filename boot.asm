txtprint:
    db "Operating system is being executed", 0x00

err:
    db "INTERRUPT FAILLED, PLS FIX", 0x00

finshSuccess:
    db "Operating system successful", 0x00

mov dx, 100
mov cx, 0

pitx:
    mov al, 0x36
    out 0x43, al    ;tell the PIT which channel we're setting

    mov ax, 11931
    out 0x40, al    ;send low byte
    mov al, ah
    out 0x40, al    ;send high byte
    inc cx
    cmp cx, dx
    jle pitx

print:
    mov ah, 0x0e
    mov al, bl
    int 0x10
    inc al
    cmp al, 0x00
    jne print

errorPrt:
    mov bl, [err + 0x7c00]
    jmp print

success:
    mov bl, [finshSuccess + 0x7c00]
    jmp print

mov bl, [txtprint + 0x7c00]
jmp print
cmp cx, dx
jle pitx

cmp cx, dx
jg success

times 510-($-$$) db 0
db 0x55, 0xaa