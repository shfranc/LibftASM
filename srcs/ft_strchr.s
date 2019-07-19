section .text
	global _ft_strchr

;char	*ft_strchr(const char *s, int c);
_ft_strchr:
	push rbp
	mov rbp, rsp
	sub rsp, 32

	mov rax, 0

	.leave:
		mov rsp, rbp
		pop rbp
		ret
