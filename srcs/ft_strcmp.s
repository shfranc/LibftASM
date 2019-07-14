section .text
	global _ft_strcmp

; int		strcmp(const char *s1, const char *s2);
_ft_strcmp:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rdx, 0
	cld
	repe cmpsb

	.leave:
		mov rsp, rbp
		pop rbp
		ret
