%define TRUE		1
%define FALSE		0

section .text
	global _ft_isdigit

;int		ft_isdigit(int c);
_ft_isdigit:
	cmp edi, `0`
	jl .false
	cmp edi, `9`
	jg .false
	mov rax, TRUE
	ret

	.false:
		mov rax, FALSE
		ret
