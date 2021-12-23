int 0x13
txtprint:
    db "Operating system is being executed", 0x00

err:
    db "INTERRUPT FAILLED, PLS FIX", 0x00

finshSuccess:
    db "Operating system successful", 0x00

print:
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    inc bx
    cmp al, 0x00
    jne print

mov bx, [txtprint + 0x7c00]
jmp print
mov bx, [finshSuccess + 0x7c00]
jmp print

times 510-($-$$) db 0
db 0x55, 0xaa