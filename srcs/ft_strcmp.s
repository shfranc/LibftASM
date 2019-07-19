section .text
	global _ft_strcmp
	extern _ft_strlen

; int		strcmp(const char *s1, const char *s2);
_ft_strcmp:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	mov rcx, 0							; set index to 0
	.loop:
		movzx rax, byte[rdi + rcx]		; load 1 byte to rax, rdx, zero the unused bits
		movzx rdx, byte[rsi + rcx]
		sub rax, rdx					; set rax to the diff between chars

		cmp rax, 0						; if not equal, leave
		jne .leave

		cmp byte[rdi + rcx], 0			; s1 is finished, leave with the current result
		je .leave
		cmp byte[rsi + rcx], 0			; s1 is finished, leave with the current result
		je .leave

		inc rcx							; inc index
		jmp .loop

	.leave:
		mov rsp, rbp
		pop rbp
		ret
