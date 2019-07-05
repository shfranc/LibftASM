%define TRUE		0
%define FALSE		1

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

;int		ft_isalnum(int c);
_ft_isalnum:
	call _ft_isalpha
	ret
	cmp rax, TRUE
	je .true
	call _ft_isdigit
	cmp rax, TRUE
	jmp .true
	jmp .false

	.true:
		mov rax, TRUE
		ret

	.false:
		mov rax, FALSE
		ret
