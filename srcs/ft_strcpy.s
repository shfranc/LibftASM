section .text
	global _ft_strcpy
	extern _ft_strlen
	extern _ft_memcpy

;char	*ft_strcpy(char * dst, const char * src);
_ft_strcpy:
	push rbp
	mov rbp, rsp
	sub rsp, 128

	mov [rsp], rdi
	mov [rsp + 64], rsi
	mov rdi, rsi
	call _ft_strlen
	mov rdx, rax
	add rdx, 1
	mov rdi, [rsp]
	mov rsi, [rsp + 64]
	call _ft_memcpy

	.leave:
		mov rsp, rbp
		pop rbp
		ret
