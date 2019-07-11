%define TRUE		1
%define FALSE		0

section .text
	global _ft_isascii

;int		ft_isascii(int c);
_ft_isascii:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	cmp edi, 0
	jl .false
	cmp edi, 127
	jg .false
	mov rax, TRUE
	jmp .leave

	.false:
		mov rax, FALSE
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
