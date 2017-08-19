segment .data
	global _start

_start:
	mov edx, len		;length msg
	mov ecx, msg		;msg
	mov ebx, 1		;file descriptor
	mov eax, 4		;sys call number (sys_write)
	int 0x80		;call kernel

	mov eax, 1		;sys call (sys_exit)
	int 0x80		;call kernel

segment .data
	msg db 'Hello, World!', 0xa ;string for printing
	len equ $ - msg		    ;length of string msg
	
