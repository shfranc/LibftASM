section .text
	global _ft_strchr

;char	*ft_strchr(const char *s, int c);
_ft_strchr:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	.loop:
		movzx r8, byte[rdi]
		cmp r8, rsi
		je .found
		cmp byte[rdi], 0
		je .not_found
		inc rdi
		jmp .loop

	.found:
		mov rax, rdi
		jmp .leave

	.not_found:
		mov rax, 0
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
