%use masm

        global main
        extern printf

        section .data   ;segment ds
format: db "formatowany printf int %d i %d",10,0
format2: db "formatowany printf float %f", 10,0
zmienna1: dd 123
zmienna2: dd 4567
zmienna3: dq 3.14

    section. text
;zgodnosc z ABI linux 64
main:
        push rbp        ;prolog funkcji zachowanie stosu
        mov rbp,rsp
        sub rsp, 32     ;korekta stosu (Przesuniecie kolejki stosu, to jest potrzebe aby bylo z linux 64 zgodne)

;drukowanie wartosci int
        mov rdi, format ;pierwszy parametr print
        mov rsi, [zmienna1] ;drugi parametr
        mov rdx. [zmienna2] ;trzeci parametr
        xor rax, rax ;bez floats
        call printf ;linkowanie statyczne
;jakis syf
        mov rsp, rbp
        pop rbp
        vot
