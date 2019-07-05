%define TOGGLE	32
%define TRUE	0

section .text
	global _ft_tolower
	extern _ft_isalpha

;int		ft_tolower(int c);
_ft_tolower:
	call _ft_isalpha
	cmp rax, TRUE
	jne .leave
	cmp rdi, `Z`
	jg	.leave
	add rdi, TOGGLE
	
	.leave:
		mov rax, rdi
		ret
