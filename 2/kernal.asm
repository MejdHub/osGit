section .text
    [bits 32]
    mov al, 'H'
    mov ah, 0xb2
    mov [0xb8000], ax

    mov al, 'I'
    mov [0xb8002], ax

    mov al, ' '
    mov [0xb8004], ax

    mov al, 'M'
    mov [0xb8006], ax

    mov al, 'E'
    mov [0xb8008], ax

    mov al, 'J'
    mov [0xb8010], ax

    mov al, 'D'
    mov [0xb8012], ax

    mov al, '!'
    mov [0xb8014], ax

    mov ecx, 0xb8016
    
    mov al, 0

    nullfill:
        mov [ecx], ax
        times 2 inc ecx
    times 791 jmp nullfill 
    jmp $