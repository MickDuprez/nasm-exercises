SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

segment .data
	msg db 'The result of 3 x 2 is: '
	len equ $-msg

segment .bss
	res resb 1

segment .text
global _start

_start:
	mov al, '3'
	sub al, '0'

	mov bl, '2'
	sub bl, '0'

	mul bl
	add al, '0'

	mov [res], al
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg
	mov edx, len
	int 80h

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 80h

	mov eax, SYS_EXIT
	int 80h
