section .text
	global _ft_strdup

;char	*strdup(const char *s1);
_ft_strdup:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rax, 0

	.leave:
		mov rsp, rbp
		pop rbp
		ret
