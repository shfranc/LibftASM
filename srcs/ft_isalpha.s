%define TRUE		1
%define FALSE		0

section .text
	global _ft_isalpha

;int		ft_isalpha(int c);
_ft_isalpha:
	push rbp
	mov rbp, rsp
	sub rsp, 16

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
		jmp .leave

	.false:
		mov rax, FALSE
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
