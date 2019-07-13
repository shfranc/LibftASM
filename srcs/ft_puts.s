%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT					1
%define WRITE					4
%define SUCCESS					10
%define EOF						0

section .data
newline:
	.string db 0xa, 0xd, 0
null:
	.string db "(null)", 0

section .text
	global _ft_puts
	extern _ft_strlen

; write(fd, ptr, len) // rdi, rsi, rdx
_ft_write:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rsi, rdi
	call _ft_strlen
	mov rdx, rax
	mov rdi, STDOUT
	mov rax, MACH_SYSCALL(WRITE)
	syscall

	mov rsp, rbp
	pop rbp
	ret

; int	ft_puts(const char *s);
_ft_puts:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	cmp rdi, 0
	jne .put_str
	mov rdi, null.string

	.put_str:
		call _ft_write
		cmp rax, -1
		je .failure

	.new_line:
		mov rdi, newline.string
		call _ft_write
		cmp rax, -1
		je .failure

	mov rax, SUCCESS
	jmp .leave

	.failure:
		mov rax, EOF
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
