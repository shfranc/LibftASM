%define TRUE		1
%define FALSE		0

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

;int		ft_isalnum(int c);
_ft_isalnum:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	call _ft_isalpha
	cmp rax, TRUE
	je .leave
	call _ft_isdigit
	cmp rax, TRUE
	je .leave
	mov rax, FALSE
	jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
