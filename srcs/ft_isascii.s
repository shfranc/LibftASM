%define TRUE		0
%define FALSE		1

section .text
	global _ft_isascii

;int		ft_isascii(int c);
_ft_isascii:
	; cmp edi, 0
	; jl .false
	; cmp edi, 128
	; jg .false
	mov rax, TRUE
	jmp leave

	.false:
		mov rax, FALSE
		jmp leave

leave:
	mov rsp, rbp
	pop rbp
	ret
