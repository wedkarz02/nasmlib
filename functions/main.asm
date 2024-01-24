
section .data
    buf     times   80  db  'x'

section .text
    global _start

puts:
    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    syscall
    ret

gets:
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 80
    syscall
    ret

_start:
    call gets
    mov rdx, rax
    call puts

    mov rax, 60
    mov rdi, 0
    syscall
