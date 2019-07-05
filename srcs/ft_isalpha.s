%define TRUE		0
%define FALSE		1

section .text
	global _ft_isalpha

;int		ft_isalpha(int c);
_ft_isalpha:
	cmp rdi, `A`
	jl .false
	cmp rdi, `Z`
	jle .true
	cmp rdi, `a`
	jl .false
	cmp rdi, `z`
	jg .false

	.true:
		mov rax, TRUE
		ret

	.false:
		mov rax, FALSE
		ret
