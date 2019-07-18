%define MACH_SYSCALL(nb)		0x2000000 | nb
%define READ					3
%define WRITE					4
%define STDOUT					1

section .bss
	buf: resb 1024
	bufsize: equ $ - buf

section .text
	global _ft_cat
	extern _ft_bzero

; void	ft_cat(int fd);
_ft_cat:
	push rbp
	mov rbp, rsp
	sub rsp, 64

	cmp rdi, 0							; check valid fd
	jl .leave
	mov [rsp], rdi						; save fd

	.loop:
		; clean buffer
		lea rdi, [rel buf]
		mov rsi, bufsize
		call _ft_bzero

		; read
		mov rdi, [rsp]					; fd
		lea rsi, [rel buf]				; *buf
		mov rdx, bufsize				; bufsize
		mov rax, MACH_SYSCALL(READ)
		syscall
		cmp rax, 0						; check read EOF or Error ret
		jle .leave						; exit

		; write
		mov rdi, STDOUT					; fd
		lea rsi, [rel buf]				; *buf
		mov rdx, rax					; len
		mov rax, MACH_SYSCALL(WRITE)
		syscall
		cmp rax, -1						; check write Error ret
		je .leave						; exit failure

		jmp .loop						; while true

	.leave:
		mov rsp, rbp
		pop rbp
		ret

