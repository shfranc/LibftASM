%define TRUE		0
%define FALSE		1

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

;int		ft_isalnum(int c);
_ft_isalnum:
	call _ft_isalpha
	cmp rax, FALSE
	je .false
	call _ft_isdigit
	cmp rax, FALSE
	je .false
	mov rax, TRUE
	ret

	.false:
		mov rax, FALSE
		ret
