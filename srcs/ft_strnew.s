section .text
	global _ft_strnew
	extern _ft_memalloc
	extern _ft_bzero

;char	*ft_strnew(size_t size);
_ft_strnew:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	add rdi, 1
	mov [rsp], rdi
	call _ft_memalloc
	mov rdi, rax
	mov rsi, [rsp]
	call _ft_bzero

	.leave:
		mov rsp, rbp
		pop rbp
		ret
