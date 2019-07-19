%define TRUE		1
%define FALSE		0

section .text
	global _ft_atoi
	extern _ft_isdigit
	extern _ft_puts

;int	ft_atoi(const char *str);
_ft_atoi:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rdx, 0
	mov rsp, 1

	.skip_whitespaces:
		movzx rax, byte[rdi]
		cmp al, ` `
		je .is_whitespace
		cmp al, 9
		jl .is_signed
		cmp al, 13
		jg .is_signed
		jmp .is_whitespace

	.is_whitespace:
		inc rdi
		jmp .skip_whitespaces

	.is_signed:
		movzx rax, byte[rdi]
		cmp al, `-`
		je .is_negative

		cmp al, `+`
		je .is_positive
		jmp .loop

	.is_negative:
		inc rdi
		mov rsp, -1
		jmp .loop

	.is_positive:
		inc rdi
		jmp .loop

	.loop:
		cmp byte[rdi], 0
		je .done
		cmp byte[rdi], `0`
		jl .done
		cmp byte[rdi], `9`
		jg .done
		imul rdx, 10
		movzx rax, byte[rdi]
		sub al, `0`
		add rdx, rax
		inc rdi
		jmp .loop

	.done:
		mov rax, rdx
		imul rax, rsp

	.leave:
		mov rsp, rbp
		pop rbp
		ret
