%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4
%define SUCCESS					1

section .data
newline:
	.string db 0xa, 0xd
	.len equ $ - newline.string

section .text
	global _ft_puts

; int	ft_puts(const char *s);
; write(fd, ptr, len) // rdi, rsi, rdx
_ft_puts:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rsi, rdi
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

	;Print newline
    mov rsi, newline.string
    mov rdx, newline.len
    mov rax, MACH_SYSCALL(WRITE)
    syscall

	mov rax, SUCCESS
	jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
