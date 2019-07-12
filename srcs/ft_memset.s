section .text
	global _ft_memset

;void	*ft_memset(void *b, int c, size_t len);
_ft_memset:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	push rdi
	mov rax, rsi
	mov rcx, rdx
	cld
	rep stosb ; repeat storing byte from rax to rdi until rcx = 0

	pop rdi
	mov rax, rdi
	.leave:
		mov rsp, rbp
		pop rbp
		ret
