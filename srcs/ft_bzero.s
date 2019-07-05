section .text
	global _ft_bzero

_ft_bzero:
	mov rbp, rsp
	sub rsp, 16

	jmp leave

leave:
	mov rsp, rbp
	pop rbp
	ret
