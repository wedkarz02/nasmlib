global _start

section .data
    str: db "a"

section .text

_start:
    ; change str to uppercase
    mov rsi, str
    mov al, [rsi]  ; load the lowercase character
    sub al, 32     ; subtract 32 to convert to ASCII uppercase value
    mov [rsi], al  ; store the uppercase character back in memory

    mov rax, 1
    mov rdi, 1
    mov rsi, str
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

