section .data
hello:
	.string db "Hello World!", 10
	.len equ $ - hello.string

section .text
	global _hello_world
	extern _printf

_hello_world:
	push rbp					; push sur la stack
	mov rbp, rsp				; rbp = rsp, mettre sonr egistre de stack dans le scope
	sub rsp, 16					; Alignement obligatoire a faire sur Mac. On demande ici 16 ocets, ils ne serviront pas
	lea rdi, [rel hello.string]	; load effective address, charger la string dans le registre rdi
	call _printf				; call à printf
	leave						; enleve ce qu'il y a sur la stack, pop.
	ret
