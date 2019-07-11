%define TRUE		1
%define FALSE		0

section .text
	global _ft_isascii

;int		ft_isascii(int c);
_ft_isascii:
	cmp edi, 0
	jl .false
	cmp edi, 127
	jg .false
	mov rax, TRUE
	ret

	.false:
		mov rax, FALSE
		ret
