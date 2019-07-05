%define TOGGLE	32
%define TRUE	0

section .text
	global _ft_toupper
	extern _ft_isalpha

;int		ft_toupper(int c);
_ft_toupper:
	call _ft_isalpha
	cmp rax, TRUE
	jne .leave
	cmp rdi, `a`
	jl	.leave
	sub rdi, TOGGLE
	
	.leave:
		mov rax, rdi
		ret
