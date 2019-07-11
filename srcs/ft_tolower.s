%define TOGGLE	32
%define TRUE	1

section .text
	global _ft_tolower
	extern _ft_isalpha

;int		ft_tolower(int c);
_ft_tolower:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	call _ft_isalpha
	cmp rax, TRUE
	jne .leave
	cmp rdi, `Z`
	jg	.leave
	add rdi, TOGGLE

	.leave:
		mov rax, rdi
		mov rsp, rbp
		pop rbp
		ret
