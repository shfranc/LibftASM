%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4

section .data
hello:
	.string db "Hello World!", 10
	.len equ $ - hello.string

section .text
	global start
	global _main
	global _ft_puts

_ft_puts:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	; write(fd, ptr, len) // rdi, rsi, rdx
	mov rsi, rdi ; on récupere la string, on la place dans le second registre
	mov rdi, STDOUT
	push rsi
	mov rcx, 0

	.loop:
		cmp byte[rsi], 0
		je .put_str
		inc rcx
		inc rsi
		jmp .loop

	.put_str:
	pop rsi
	mov rdx, rcx
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret

start:
	call _main
	ret

_main:
	mov rdi, hello.string
	;mov rsi, hello.len
	call _ft_puts
	ret
