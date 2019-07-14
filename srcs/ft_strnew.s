section .text
	global _ft_strnew
	extern _ft_memalloc

;char	*ft_strnew(size_t size);
_ft_strnew:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	add rdi, 1
	call _ft_memalloc

	.leave:
		mov rsp, rbp
		pop rbp
		ret
