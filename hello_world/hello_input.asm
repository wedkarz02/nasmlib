
section .data
    msg:        db "What is your name? "
    msg_l:      equ $-msg
    hello:      db "Hello "
    hello_l:    equ $-hello

section .bss
    name_v      resb 255    ; 'res'erve 'b'yte

section .text
    global _start
    
_start:
    mov rax, 1      ; write(
    mov rdi, 1      ;   STDOUT_FILENO,
    mov rsi, msg    ;   msg,
    mov rdx, msg_l  ;   sizeof(msg),
    syscall         ; );

    mov rax, 0      ; read(
    mov rdi, 0      ;   STDIN_FILENO,
    mov rsi, name_v ;   name_v,
    mov rdx, 255    ;   sizeof(name_v),
    syscall         ; ); 

    mov rax, 1      ; write(
    mov rdi, 1      ;   STDOUT_FILENO,
    mov rsi, hello  ;   hello,
    mov rdx, hello_l;   sizeof(hello),
    syscall         ; );

    mov rax, 1      ; write(
    mov rdi, 1      ;   STDOUT_FILENO,
    mov rsi, name_v ;   name_v,
    mov rdx, 255    ;   sizeof(name_v),
    syscall         ; );

    mov rax, 60     ; exit(
    mov rdi, 0      ;   EXIT_SUCCESS
    syscall         ; );
