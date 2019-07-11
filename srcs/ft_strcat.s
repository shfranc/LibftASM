section .text
	global _ft_strcat

; char *ft_strcat(char *restrict s1, const char *restrict s2);
_ft_strcat:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	push rdi
	.loop: ; move at the end of s1
		cmp byte[rdi], 0
		je .copy_s2
		inc rdi
		jmp .loop

	.copy_s2:
		cmp byte[rsi], 0
		je .end
		mov dl, byte[rsi]
		mov byte[rdi], dl
		inc rsi
		inc rdi
		jmp .copy_s2

	.end:
		pop rdi
		mov rax, rdi
		jmp .leave

	.leave:
		mov rsp, rbp
		pop rbp
		ret
