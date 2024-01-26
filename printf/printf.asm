
section .data
    format: db "formatorany printf int %d", 10, 0
    format2: db "formatowany printf float: %f", 10, 0 
    zmienna1: dd 123
    zmienna2: dd 4567
    zmienna3: dq 3.14

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov rdi, format
    mov rsi, [zmienna1]
    mov rdx, [zmienna2]
    xor rax, rax
    call printf

    mov rsp, rbp
    pop rbp
    ret
