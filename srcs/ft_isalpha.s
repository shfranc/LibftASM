%define TRUE		0
%define FALSE		1

section .text
	global _ft_isalpha

;int		ft_isalpha(int c);
_ft_isalpha:
	cmp edi, `A`
	jl .false
	cmp edi, `z`
	jg .false
	cmp edi, `Z`
	jl .true
	cmp edi, `a`
	jg .true

	.true:
		mov rax, TRUE
		ret

	.false:
		mov rax, FALSE
		ret
