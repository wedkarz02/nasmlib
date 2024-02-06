;nasm -f elf64 printf64.asm
;gcc -static printf64.o
;./a.out

%use masm

        global main
        extern printf

        section .data   ;segment ds
    format: db "formatowany printf int %d i %d", 10, 0
    format2: db "formatowany printf float %f", 10, 0 

    zmienna1: dd 123
    zmienna2: dd 4567
    zmienna3: dq 3.14

    section .text
;zgodnosc z ABI linux 64
main:
        push rbp        ;prolog funkcji zachowanie stosu
        mov rbp,rsp
        sub rsp, 32     ;korekta stosu (Przesuniecie kolejki stosu, to jest potrzebe aby bylo z linux 64 zgodne)

        mov rdi, format ;pierwszy parametr print
        mov rsi, [zmienna1] ;drugi parametr
        mov rdx, [zmienna2] ;trzeci parametr
        xor rax,rax
        call printf ;linkowanie statyczne
    
        ;drukowanie float

        mov rdi, format2
        movsd xmm0, [zmienna3]
        mov rax, 1
        call printf

        mov rsp, rbp
        pop rbp
        reted