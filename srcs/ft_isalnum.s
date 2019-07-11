%define TRUE		1
%define FALSE		0

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

;int		ft_isalnum(int c);
_ft_isalnum:
	call _ft_isalpha
	cmp rax, TRUE
	je .leave
	call _ft_isdigit
	cmp rax, TRUE
	je .leave
	mov rax, FALSE
	ret

	.leave:
		ret
