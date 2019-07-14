section .text
	global _ft_strdup
	extern _malloc
	extern _ft_memcpy
	extern _ft_strlen
	extern _ft_strnew
	extern _ft_strcpy
	extern _strdup

;char	*strdup(const char *s1);
_ft_strdup:
	push rbp
	mov rbp, rsp
	sub rsp, 64

	mov [rsp], rdi		; save pointer to str
	call _ft_strlen
	mov rdi, rax
	call _ft_strnew
	cmp rax, 0
	je .leave
	mov rdi, rax		; move fresh string as dest
	mov rsi, [rsp]		; move source string
	call _ft_strcpy

	.leave:
		mov rsp, rbp
		pop rbp
		ret
