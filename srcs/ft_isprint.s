%define TRUE		1
%define FALSE		0

section .text
	global _ft_isprint

;int		ft_isprint(int c);
_ft_isprint:
	cmp edi, 32
	jl .false
	cmp edi, 126
	jg .false
	mov rax, TRUE
	ret

	.false:
		mov rax, FALSE
		ret

