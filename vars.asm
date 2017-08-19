section .data
	choice DB 'y'

section .text
global _start

_start:
	mov edx, 1		;msg len
	mov ecx, choice
	mov ebx, 1		;stdout
	mov eax, 4		;sys_write
	int 80h

	mov eax, 1
	int 80h
	
