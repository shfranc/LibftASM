%define TRUE		1
%define FALSE		0

section .text
	global _ft_isdigit

;int		ft_isdigit(int c);
_ft_isdigit:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	cmp edi, `0`
	jl .false
	cmp edi, `9`
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
