section .text
	global _ft_bzero

;void	ft_bzero(void *s, size_t size);
_ft_bzero:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	cmp rsi, 0

	.loop:
		cmp rsi, 0
		je leave
		mov byte[rdi], 0
		inc rdi
		dec rsi
		jmp .loop

	jmp leave

leave:
	mov rsp, rbp
	pop rbp
	ret
