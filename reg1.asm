segment .text
	global _start

_start:
	mov edx, len		;msg len
	mov ecx, msg
	mov ebx, 1		;file descriptor (stdout)
	mov eax, 4		;sys call number (sys_srite)
	int 0x80		;call it

	mov edx, 9		;msg length
	mov ecx, s2		;msg to write
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1		;sys call number to exit
	int 0x80

segment .data
	msg db 'Displaying 9 stars', 0xa
	len equ $ - msg
	s2 times 9 db '*'
