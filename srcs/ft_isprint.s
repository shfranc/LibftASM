%define TRUE		0
%define FALSE		1

section .text
	global _ft_isprint

;int		ft_isprint(int c);
_ft_isprint:
	cmp edi, 32
	jl .false
	cmp edi, 126
	jg .false
	mov rax, TRUE
	jmp leave

	.false:
		mov rax, FALSE
		jmp leave

leave:
	mov rsp, rbp
	pop rbp
	ret
