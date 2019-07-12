section .text
	global _ft_strlen

;size_t	ft_strlen(const char *s);
_ft_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 64

	mov rsp, rdi
	mov rax, 0
	cld
	repne scasb

	sub rdi, rsp
	cmp rdi, 0
	je .leave
	sub rdi, 1

	.leave:
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
