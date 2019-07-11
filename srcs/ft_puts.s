%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4
%define SUCCESS					10
%define EOF						0

section .data
newline:
	.string db 0xa, 0xd
	.len equ $ - newline.string
null:
	.string db "(null)"
	.len equ $ - null.string

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
	cmp rsi, 0
	je .print_null

	push rsi
	mov rdx, 0
	.str_len:
		cmp byte[rsi], 0
		je .print_str
		inc rdx
		inc rsi
		jmp .str_len

	.print_str:
		pop rsi
		jmp .put_endl

	.print_null:
		mov rsi, null.string
		mov rdx, null.len
		jmp .put_endl

	.put_endl:
		mov rax, MACH_SYSCALL(WRITE)
		syscall
		cmp rax, -1
		je .failure
		mov rsi, newline.string
		mov rdx, newline.len
		mov rax, MACH_SYSCALL(WRITE)
		syscall
		cmp rax, -1
		je .failure

	.success:
		mov rax, SUCCESS
		jmp .leave

	.failure:
		mov rax, EOF
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
