%define TRUE		1
%define FALSE		0

section .text
	global _ft_isprint

;int		ft_isprint(int c);
_ft_isprint:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	cmp edi, 32
	jl .false
	cmp edi, 126
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
