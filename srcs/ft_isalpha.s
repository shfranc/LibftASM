%define TRUE		1
%define FALSE		0

section .text
	global _ft_isalpha

;int		ft_isalpha(int c);
_ft_isalpha:
	cmp edi, `A`
	jl .false
	cmp edi, `Z`
	jle .true
	cmp edi, `a`
	jl .false
	cmp edi, `z`
	jg .false

	.true:
		mov rax, TRUE
		ret

	.false:
		mov rax, FALSE
		ret
