section .text
	global _ft_strlen

;size_t	ft_strlen(const char *s);
_ft_strlen:
	push rbp
	mov rbp, rsp
	sub rsp, 16

	sub rcx, rcx	; initialize rcx to 0
	not rcx			; set rcx to its highest value (it will be decreased next)
	sub rax, rax	; initalize rax to 0
	cld
	repne scasb 	; scan until not equal or not zero
	not rcx			; reverse rcx to have the positive result
	dec rcx			; null terminator not counted
	mov rax, rcx

	.leave:
		mov rsp, rbp
		pop rbp
		ret
