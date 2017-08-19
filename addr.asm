section .text
global _start

_start:

	;write name 'Zara Ali'
	mov edx, 9		;length of name
	mov ecx, name
	mov ebx, 1		;stdout
	mov eax, 4		;sys_write
	int 80h			;call it

	mov [name], dword 'Nuha' ;changed name to 'Nuha Ali'

	;print new name
	mov edx, 8
	mov ecx, name
	mov ebx, 1
	mov eax, 4
	int 80h

	;quit
	mov eax, 1
	int 80h

section .data
	name db 'Zara Ali'
