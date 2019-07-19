section .text
	global _ft_strjoin
	extern _ft_strlen
	extern _ft_strnew
	extern _ft_strcpy
	extern _ft_strcat

;char	*ft_strjoin(char *s1, char *s2);
_ft_strjoin:
	push rbp
	mov rbp, rsp
	sub rsp, 128

	mov [rsp], rdi			; save s1
	mov [rsp + 64], rsi		; save s2

	; get new string len
	call _ft_strlen			; len s1
	mov rcx, rax			; save len
	mov rdi, rsi
	call _ft_strlen			; len s2
	add rcx, rax			; add len s1 + s2
	inc rcx					; room for \0

	; create new string
	mov rdi, rcx			; len new string
	call _ft_strnew
	cmp rax, 0
	je .leave				; exit error

	mov rdi, rax
	mov rsi, [rsp]
	call _ft_strcpy			; copy s1

	mov rdi, rax
	mov rsi, [rsp + 64]
	call _ft_strcat			; copy s2

	.leave:
		mov rsp, rbp
		pop rbp
		ret
