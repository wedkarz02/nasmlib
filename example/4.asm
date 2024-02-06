;nasm -f elf64 printf64.asm
;gcc -static printf64.o
;./a.out

%use masm

        global main
        extern printf

        section .data   ;segment ds
    format: db "formatowany printf string %s", 10, 0


    zmienna1: db "its over", 10, 0 


    section .text
;zgodnosc z ABI linux 64
main:
        push rbp        ;prolog funkcji zachowanie stosu
        mov rbp,rsp
        sub rsp, 32     ;korekta stosu (Przesuniecie kolejki stosu, to jest potrzebe aby bylo z linux 64 zgodne)

        mov rdi, format 
        mov rsi, zmienna1 
        call printf
 
        mov rsp, rbp
        pop rbp
        ret