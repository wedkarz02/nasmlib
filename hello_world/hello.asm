
section .data
	msg:	db "Hello, world!", 10	; 'd'efine 'b'yte, 10 = newline in ASCII
	msg_l:	equ $-msg		; length of msg

section .text
	global _start

_start:
	mov rax, 1	; write(
	mov rdi, 1	;   STDOUT_FILENO,
	mov rsi, msg	;   "Hello, world!\n",
	mov rdx, msg_l	;   sizeof("Hello, world!\n"),
	syscall		; )

	mov rax, 60	; exit(
	mov rdi, 0	;   EXIT_SUCCESS
	syscall		; );

