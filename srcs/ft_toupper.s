%define TOGGLE	32
%define TRUE	1

section .text
	global _ft_toupper
	extern _ft_isalpha

;int		ft_toupper(int c);
_ft_toupper:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	call _ft_isalpha
	cmp rax, TRUE
	jne .leave
	cmp rdi, `a`
	jl	.leave
	sub rdi, TOGGLE

	.leave:
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
