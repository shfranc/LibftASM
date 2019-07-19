section .text
	global _ft_memcpy

;void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
_ft_memcpy:
	push rbp
	mov rbp, rsp
	sub rsp, 64

	mov rsp, rdi
	mov rcx, rdx
	cld
	rep movsb 		; repeat copying bytes from rsi to rdi until rcx = 0

	mov rax, rsp	; return beginning of the dest string
	.leave:
		mov rsp, rbp
		pop rbp
		ret
