txtprint:
    db "Operating system is being executed", 0

finshSuccess:
    db "Operating system successful", 0

mov bx, [txtprint + 0x7c00]

print:
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    inc bx
    cmp al, 0x00
    je end
    jmp print
end:


jmp $

times 510-($-$$) db 0
db 0x55, 0xaa